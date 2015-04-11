package  com.xthena.hr.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.hr.domain.HrShtc;
import com.xthena.hr.domain.HrYwxTihuan;
import com.xthena.hr.manager.HrShtcManager;
import com.xthena.hr.manager.HrYwxTihuanManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrYwxTihuanController {
    private HrYwxTihuanManager hrYwxTihuanManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private HrShtcManager hrShtcManager;
    
    @RequestMapping("hrYwxTihuan-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrYwxTihuanManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrYwxTihuan-info-list";
    }

    @RequestMapping("hrYwxTihuan-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fryid", required = false) Long fryid,
            Model model) {
        if (id != null) {
            HrYwxTihuan hrYwxTihuan = hrYwxTihuanManager.get(id);
            model.addAttribute("model", hrYwxTihuan);
        }else{
        	 HrYwxTihuan hrYwxTihuan = new HrYwxTihuan();
        	 hrYwxTihuan.setFryid(fryid);
             model.addAttribute("model", hrYwxTihuan);
        }
        
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "hr/hrYwxTihuan-info-input";
    }

    @RequestMapping("hrYwxTihuan-info-save")
    public String save(@ModelAttribute HrYwxTihuan hrYwxTihuan,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrYwxTihuan dest = null;

        Long id = hrYwxTihuan.getFid();

        if (id != null) {
            dest = hrYwxTihuanManager.get(id);
            beanMapper.copy(hrYwxTihuan, dest);
        } else {
            dest = hrYwxTihuan;
        }
        
        HrShtc hrShtc=hrShtcManager.findUniqueBy("fryid", dest.getFryid());
        HrShtc newHrShtc=hrShtcManager.findUniqueBy("fryid", dest.getFnewryid());
        
        hrShtc.setFlastdateyw(dest.getFrdate());
        newHrShtc.setFstartdateyw(dest.getFrdate());
        hrShtcManager.save(hrShtc);
        hrShtcManager.save(newHrShtc);
       
        hrYwxTihuanManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrYwxTihuan-info-list.do";
    }

    @RequestMapping("hrYwxTihuan-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrYwxTihuan> hrYwxTihuans = hrYwxTihuanManager.findByIds(selectedItem);

        hrYwxTihuanManager.removeAll(hrYwxTihuans);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrYwxTihuan-info-list.do";
    }

    @RequestMapping("hrYwxTihuan-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrYwxTihuanManager.pagedQuery(page, propertyFilters);

        List<HrYwxTihuan> hrYwxTihuans = (List<HrYwxTihuan>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrYwxTihuan info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrYwxTihuans);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrYwxTihuanManager(HrYwxTihuanManager hrYwxTihuanManager) {
        this.hrYwxTihuanManager = hrYwxTihuanManager;
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
