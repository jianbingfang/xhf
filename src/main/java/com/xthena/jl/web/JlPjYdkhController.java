package  com.xthena.jl.web;

import java.util.Date;
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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CodeUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.SessionUtil;
import com.xthena.util.manager.CodeGenManager;
import com.xthena.gcgl.domain.PjYdkh;
import com.xthena.gcgl.manager.PjYdkhManager;
import com.xthena.jl.manager.JlDeptManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlPjYdkhController {
    private PjYdkhManager pjYdkhManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private  CodeGenManager codeGenManager;
    

    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jl-pjYdkh-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model,HttpServletRequest request) {
        parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYdkhManager.pagedQuery(page, propertyFilters);
        List<PjYdkh> pjKqs=(List<PjYdkh>) page.getResult();
        for(PjYdkh pjKq: pjKqs){
      	  pjKq.setFry(userConnector.findById(String.valueOf(pjKq.getFryid())).getUsername());
        }
        model.addAttribute("page", page);

        return "jl/pjYdkh-info-list";
    }

    @RequestMapping("jl-pjYdkh-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjYdkh pjYdkh = pjYdkhManager.get(id);
            pjYdkh.setFry(userConnector.findById(String.valueOf(pjYdkh.getFryid())).getUsername());
            model.addAttribute("model", pjYdkh);
        }

        return "jl/pjYdkh-info-input";
    }

    @RequestMapping("jl-pjYdkh-info-save")
    public String save(@ModelAttribute PjYdkh pjYdkh,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        PjYdkh dest = null;

        Long id = pjYdkh.getFid();

        if (id != null) {
            dest = pjYdkhManager.get(id);
            beanMapper.copy(pjYdkh, dest);
        } else {
            dest = pjYdkh;
            dest.setFuploaddate(new Date());
            dest.setFryid(Long.parseLong(SpringSecurityUtils.getCurrentUserId()));
            dest.setFxmid(jlDeptManager.getXmId(request));
            dest.setFkhno(CodeUtil.getSysYearCode(ConstValue.SYS_CODE_XM+jlDeptManager.getXmId(request), 6, codeGenManager));
        }

        pjYdkhManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-pjYdkh-info-list.do";
    }

    @RequestMapping("jl-pjYdkh-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjYdkh> pjYdkhs = pjYdkhManager.findByIds(selectedItem);

        pjYdkhManager.removeAll(pjYdkhs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-pjYdkh-info-list.do";
    }

    @RequestMapping("jl-pjYdkh-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYdkhManager.pagedQuery(page, propertyFilters);

        List<PjYdkh> pjYdkhs = (List<PjYdkh>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjYdkh info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjYdkhs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjYdkhManager(PjYdkhManager pjYdkhManager) {
        this.pjYdkhManager = pjYdkhManager;
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
