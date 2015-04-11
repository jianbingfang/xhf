package  com.xthena.jl.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.util.CodeUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.SessionUtil;
import com.xthena.util.manager.CodeGenManager;
import com.xthena.jl.domain.JlZjTsgz;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlZjTsgzManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlZjTsgzController {
    private JlZjTsgzManager jlZjTsgzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private CodeGenManager codeGenManager;


    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jlZjTsgz-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjTsgzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlZjTsgz-info-list";
    }

    @RequestMapping("jlZjTsgz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlZjTsgz jlZjTsgz = jlZjTsgzManager.get(id);
            model.addAttribute("model", jlZjTsgz);
        }

        return "jl/jlZjTsgz-info-input";
    }

    @RequestMapping("jlZjTsgz-info-save")
    public String save(@ModelAttribute JlZjTsgz jlZjTsgz,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        JlZjTsgz dest = null;

        Long id = jlZjTsgz.getFid();

        if (id != null) {
            dest = jlZjTsgzManager.get(id);
            beanMapper.copy(jlZjTsgz, dest);
        } else {
        	jlZjTsgz.setFno(CodeUtil.getSysYearCode(ConstValue.SYS_CODE_XM+jlDeptManager.getXmId(request),6, codeGenManager));
            dest = jlZjTsgz;
        }

        jlZjTsgzManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlZjTsgz-info-list.do";
    }

    @RequestMapping("jlZjTsgz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlZjTsgz> jlZjTsgzs = jlZjTsgzManager.findByIds(selectedItem);

        jlZjTsgzManager.removeAll(jlZjTsgzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlZjTsgz-info-list.do";
    }

    @RequestMapping("jlZjTsgz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjTsgzManager.pagedQuery(page, propertyFilters);

        List<JlZjTsgz> jlZjTsgzs = (List<JlZjTsgz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlZjTsgz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlZjTsgzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlZjTsgzManager(JlZjTsgzManager jlZjTsgzManager) {
        this.jlZjTsgzManager = jlZjTsgzManager;
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
