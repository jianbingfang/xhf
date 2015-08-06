package com.xthena.xz.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.util.WzMapUtil;
import com.xthena.xz.domain.WzList;
import com.xthena.xz.domain.WzStorage;
import com.xthena.xz.manager.WzListManager;
import com.xthena.xz.manager.WzStorageManager;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("xz")
public class WzStorageController {
    private WzStorageManager wzStorageManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private WzListManager wzListManager;

    @RequestMapping("wzStorage-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        // 根据物资名称查询
        StringBuffer hql = new StringBuffer(
                "select ws from WzStorage ws,WzList wz where wz.fid=ws.fwzid");
        if (parameterMap.get("filter_LIKES_fname") != null && !parameterMap.get("filter_LIKES_fname").equals("")) {
            hql.append(" and wz.fname like '%"
                    + parameterMap.get("filter_LIKES_fname") + "%' ");
        }
        if (parameterMap.get("filter_LIKES_fgg") != null && !parameterMap.get("filter_LIKES_fgg").equals("")) {
            hql.append(" and wz.fgg like '%"
                    + parameterMap.get("filter_LIKES_fgg") + "%' ");
        }
        if (parameterMap.get("filter_LIKES_ftype") != null && !parameterMap.get("filter_LIKES_ftype").equals("")) {
            hql.append(" and ws.ftype like '%"
                    + parameterMap.get("filter_LIKES_ftype") + "%' ");
        }
        parameterMap.remove("filter_LIKES_fname");
        parameterMap.remove("filter_LIKES_fgg");
        parameterMap.remove("filter_LIKES_ftype");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzStorageManager.pagedQuery(hql.toString(), page,
                propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("wzMap", WzMapUtil.getWzMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "xz/wzStorage-info-list";
    }

    @RequestMapping("wzStorage-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        @RequestParam(value = "fwzid", required = false) Long fwzid,
                        @RequestParam(value = "ftype", required = false) String ftype,
                        Model model) {
        if (id != null) {
            WzStorage wzStorage = wzStorageManager.get(id);
            model.addAttribute("model", wzStorage);
        }
        if (fwzid != null) {
            WzStorage wzStorage = new WzStorage();
            wzStorage.setFwzid(fwzid);
            wzStorage.setFdateString(DateFormatUtils.format(new Date(),
                    "yyyy-MM-dd"));
            model.addAttribute("model", wzStorage);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("wzMap", WzMapUtil.getWzMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        if (ftype != null && ftype.equals("1")) {
            return "xz/wzStorage-jh-info-input";
        }

        return "xz/wzStorage-info-input";
    }

    @RequestMapping("wzStorage-info-save")
    public String save(@ModelAttribute WzStorage wzStorage,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        WzStorage dest = null;

        Long id = wzStorage.getFid();

        if (id != null) {
            dest = wzStorageManager.get(id);
            beanMapper.copy(wzStorage, dest);
        } else {
            dest = wzStorage;
        }

        if (dest.getFtype().equals("1")) {
            WzList wz = wzListManager.get(dest.getFwzid());
            wz.setFnum(wz.getFnum() + dest.getFnum());
            wz.setFprice(dest.getFprice());
            wzListManager.save(wz);
        } else if (dest.getFtype().equals("2")) {
            WzList wz = wzListManager.get(dest.getFwzid());
            if (wz.getFnum() >= dest.getFnum()) {
                int num = wz.getFnum() - dest.getFnum();
                wz.setFnum(num);
            } else {
                messageHelper.addFlashMessage(redirectAttributes, "WzStorage",
                        "出库失败，库存不足。");
                return "redirect:/xz/wzList-info-list.do";
            }
            wz.setFprice(dest.getFprice());
            wzListManager.save(wz);
        }
        wzStorageManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        WzList wz = wzListManager.findUniqueBy("fid", dest.getFwzid());
        String wztype = "";
        if (wz != null) {
            wztype = wz.getFtype();
        }
        return "redirect:/xz/wzList-dh-info-list.do?ftype=" + wztype;
    }

    @RequestMapping("wzStorage-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<WzStorage> wzStorages = wzStorageManager.findByIds(selectedItem);

        wzStorageManager.removeAll(wzStorages);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/wzStorage-info-list.do";
    }

    @RequestMapping("wzStorage-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzStorageManager.pagedQuery(page, propertyFilters);

        List<WzStorage> wzStorages = (List<WzStorage>) page.getResult();

        TableModel tableModel = new TableModel();
        // tableModel.setName("wzStorage info");
        // tableModel.addHeaders("id", "name");
        tableModel.setData(wzStorages);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setWzStorageManager(WzStorageManager wzStorageManager) {
        this.wzStorageManager = wzStorageManager;
    }

    @Resource
    public void setExportor(Exportor exportor) {
        this.exportor = exportor;
    }

    @Resource
    public void setUserConnector(UserConnector userConnector) {
        this.userConnector = userConnector;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
