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
import com.xthena.xz.domain.WzIo;
import com.xthena.xz.domain.WzList;
import com.xthena.xz.manager.WzIoManager;
import com.xthena.xz.manager.WzListManager;
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
public class WzIoController {
    private WzIoManager wzIoManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    @Autowired
    private WzListManager wzListManager;

    @RequestMapping("wzIo-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        // 根据项目名称查询
        StringBuffer hql = new StringBuffer(
                "select io from WzList as wz, WzIo as io where wz.fid=io.fwzid");
        if (parameterMap.get("filter_LIKES_fname") != null && !parameterMap.get("filter_LIKES_fname").equals("")) {
            hql.append(" and wz.fname like '%"
                    + parameterMap.get("filter_LIKES_fname") + "%' ");
        }
        if (parameterMap.get("filter_LIKES_fcode") != null && !parameterMap.get("filter_LIKES_fcode").equals("")) {
            hql.append(" and wz.fcode like '%"
                    + parameterMap.get("filter_LIKES_fcode") + "%' ");
        }
        if (parameterMap.get("filter_LIKES_flyr") != null && !parameterMap.get("filter_LIKES_flyr").equals("")) {
            hql.append(" and wz.flyr like '%"
                    + parameterMap.get("filter_LIKES_flyr") + "%' ");
        }
        if (parameterMap.get("filter_EQL_fxmid") != null && !parameterMap.get("filter_EQL_fxmid").equals("")) {
            hql.append(" and wz.fxmid ="
                    + parameterMap.get("filter_EQL_fxmid"));
        }

        hql.append(" order by io.fdate");
        parameterMap.remove("filter_LIKES_fname");
        parameterMap.remove("filter_LIKES_fcode");
        parameterMap.remove("filter_LIKES_flyr");
        parameterMap.remove("filter_EQL_fxmid");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzIoManager.pagedQuery(hql.toString(), page, propertyFilters);
        /*
         * if (parameterMap.get("filter_LIKES_fname") != null) {
		 * parameterMap.get("")  } if
		 * (parameterMap.get("filter_LIKES_fcode") != null) {
		 * 
		 * } List<PropertyFilter>
		 * propertyFilters = PropertyFilter .buildFromMap(parameterMap); page =
		 * wzIoManager.pagedQuery(page, propertyFilters);
		 */
        model.addAttribute("page", page);
        model.addAttribute("wzMap", WzMapUtil.getWzMap());
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/wzIo-info-list";
    }

    @RequestMapping("wzIo-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        @RequestParam(value = "fwzid", required = false) Long fwzid,
                        Model model) {
        if (id != null) {
            WzIo wzIo = wzIoManager.get(id);
            wzIo.setFmemo2(DateFormatUtils.format(wzIo.getFdate(), "yyyy-MM-dd"));
            model.addAttribute("model", wzIo);
        }
        if (fwzid != null) {
            WzIo wzIo = new WzIo();
            wzIo.setFwzid(fwzid);
            WzList wz = wzListManager.get(fwzid);
            wzIo.setFdcxm(wz.getFxmid());

            wzIo.setFmemo2(DateFormatUtils.format(new Date(), "yyyy-MM-dd"));
            /* 默认为用户本人wzIo.setFjbr(userConnecto); */
            model.addAttribute("model", wzIo);
        }
        model.addAttribute("wzMap", WzMapUtil.getWzMap());
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/wzIo-info-input";
    }

    @RequestMapping("wzIo-info-save")
    public String save(@ModelAttribute WzIo wzIo,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        WzIo dest = null;

        Long id = wzIo.getFid();

        if (id != null) {
            dest = wzIoManager.get(id);
            beanMapper.copy(wzIo, dest);
        } else {
            dest = wzIo;
        }

        wzIoManager.save(dest);
        // 根据调拨记录 调整物资的属性 实现调拨
        WzList wz = wzListManager.get(dest.getFwzid());
        wz.setFxmid(dest.getFdrxm());
        wz.setFlyr(dest.getFmemo1());
        wz.setFlydate(dest.getFdate());
        wz.setFxjstate(dest.getFwhqk());
        wzListManager.save(wz);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/wzIo-info-list.do";
    }

    @RequestMapping("wzIo-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<WzIo> wzIos = wzIoManager.findByIds(selectedItem);

        wzIoManager.removeAll(wzIos);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/wzIo-info-list.do";
    }

    @RequestMapping("wzIo-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzIoManager.pagedQuery(page, propertyFilters);

        List<WzIo> wzIos = (List<WzIo>) page.getResult();

        TableModel tableModel = new TableModel();
        // tableModel.setName("wzIo info");
        // tableModel.addHeaders("id", "name");
        tableModel.setData(wzIos);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setWzIoManager(WzIoManager wzIoManager) {
        this.wzIoManager = wzIoManager;
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
