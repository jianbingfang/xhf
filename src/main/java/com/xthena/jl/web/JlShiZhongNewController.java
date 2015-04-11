package  com.xthena.jl.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.common.manager.CommCfildsManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.jl.domain.JlShiZhongNew;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlShiZhongNewManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlShiZhongNewController {
    private JlShiZhongNewManager jlShiZhongNewManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @Autowired
    private JlDeptManager jlDeptManager; 
    
    @Autowired
    private CommCfildsManager cfildsManager;
    
    @RequestMapping("jlShiZhongNew-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShiZhongNewManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlShiZhongNew-info-list";
    }

    @RequestMapping("jlShiZhongNew-info-listUserDefined")
    public String listUserDefined(@ModelAttribute Page page,@RequestParam(value = "defineCode", required = false) String defineCode,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fcode", defineCode);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShiZhongNewManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("defineCode", defineCode);
    	model.addAttribute("userDefineds",cfildsManager.findCommCfildsByCode(defineCode));
        return "jl/jlShiZhongNew-info-list";
    }
    
 
    @RequestMapping("jlShiZhongNew-info-inputUserDefined")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "defineCode", required = false) String defineCode,
            Model model) {
        if (id != null) {
            JlShiZhongNew jlShiZhongNew = jlShiZhongNewManager.get(id);
            model.addAttribute("model", jlShiZhongNew);
        }
        model.addAttribute("userDefineds",cfildsManager.findCommCfildsByCode(defineCode));
        model.addAttribute("defineCode", defineCode);
        return "jl/jlShiZhongNew-info-input";
    }

    @RequestMapping("jlShiZhongNew-info-saveUserDefined")
    public String save(@ModelAttribute JlShiZhongNew jlShiZhongNew,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlShiZhongNew dest = null;

        Long id = jlShiZhongNew.getFid();

        if (id != null) {
            dest = jlShiZhongNewManager.get(id);
            beanMapper.copy(jlShiZhongNew, dest);
        } else {
            dest = jlShiZhongNew;
        }

        dest.setFxmid(jlDeptManager.getXmId(request));
        jlShiZhongNewManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlShiZhongNew-info-listUserDefined.do?defineCode="+dest.getFcode();
    }

    @RequestMapping("jlShiZhongNew-info-removeUserDefined")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlShiZhongNew> jlShiZhongNews = jlShiZhongNewManager.findByIds(selectedItem);

        jlShiZhongNewManager.removeAll(jlShiZhongNews);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlShiZhongNew-info-listUserDefined.do?defineCode="+jlShiZhongNews.get(0).getFcode();
    }

    @RequestMapping("jlShiZhongNew-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShiZhongNewManager.pagedQuery(page, propertyFilters);

        List<JlShiZhongNew> jlShiZhongNews = (List<JlShiZhongNew>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlShiZhongNew info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlShiZhongNews);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlShiZhongNewManager(JlShiZhongNewManager jlShiZhongNewManager) {
        this.jlShiZhongNewManager = jlShiZhongNewManager;
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
