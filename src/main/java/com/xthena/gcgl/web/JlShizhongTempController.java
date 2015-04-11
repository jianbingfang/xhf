package  com.xthena.gcgl.web;

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
import com.xthena.gcgl.domain.JlShizhongTemp;
import com.xthena.gcgl.manager.JlShizhongTempManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class JlShizhongTempController {
    private JlShizhongTempManager jlShizhongTempManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    
    
    @RequestMapping("jlShizhongTemp-info-listByfcode")
    public String listByfcode(@ModelAttribute Page page,@RequestParam(value = "fcode", required = false) String fcode,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	JlShizhongTemp jlShizhongTemp= jlShizhongTempManager.get(Long.parseLong(fcode));

        return "redirect:/gcgl/jlShizhongTemp-info-list.do?filter_EQS_ftype="+jlShizhongTemp.getFtype();
    }
    
    
    @RequestMapping("jl-szTemp-input")
    public String szTempinput(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShizhongTempManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/jl-szTemp-input";
    }

    
    @RequestMapping("jlShizhongTemp-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShizhongTempManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/jlShizhongTemp-info-list";
    }

    @RequestMapping("jlShizhongTemp-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ftype", required = false) String ftype,
            Model model) {
        if (id != null) {
            JlShizhongTemp jlShizhongTemp = jlShizhongTempManager.get(id);
            model.addAttribute("model", jlShizhongTemp);
        }
        model.addAttribute("ftype", ftype);
        return "gcgl/jlShizhongTemp-info-input";
    }

    @RequestMapping("jlShizhongTemp-info-save")
    public String save(@ModelAttribute JlShizhongTemp jlShizhongTemp,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlShizhongTemp dest = null;

        Long id = jlShizhongTemp.getFid();

        if (id != null) {
            dest = jlShizhongTempManager.get(id);
            beanMapper.copy(jlShizhongTemp, dest);
        } else {
            dest = jlShizhongTemp;
        }

        jlShizhongTempManager.saveAndBuild(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/commcfilds-info-list.do?fcode="+dest.getFid();
    }

    @RequestMapping("jlShizhongTemp-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlShizhongTemp> jlShizhongTemps = jlShizhongTempManager.findByIds(selectedItem);

        jlShizhongTempManager.removeAll(jlShizhongTemps);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/jlShizhongTemp-info-list.do";
    }

    @RequestMapping("jlShizhongTemp-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShizhongTempManager.pagedQuery(page, propertyFilters);

        List<JlShizhongTemp> jlShizhongTemps = (List<JlShizhongTemp>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlShizhongTemp info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlShizhongTemps);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlShizhongTempManager(JlShizhongTempManager jlShizhongTempManager) {
        this.jlShizhongTempManager = jlShizhongTempManager;
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
