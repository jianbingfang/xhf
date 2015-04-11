package  com.xthena.jl.web;

import java.util.ArrayList;
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
import com.xthena.jl.domain.JlDept;
import com.xthena.jl.domain.PjXmImg;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.PjXmImgManager;

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
public class PjXmImgController {
    private PjXmImgManager pjXmImgManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlDeptManager jlDeptManager;
    
    @RequestMapping("pjXmImg-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmImgManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/pjXmImg-info-list";
    }

    @RequestMapping("pjXmImg-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjXmImg pjXmImg = pjXmImgManager.get(id);
            model.addAttribute("model", pjXmImg);
        }

        return "jl/pjXmImg-info-input";
    }

    @RequestMapping("pjXmImg-info-save")
    public String save(@ModelAttribute PjXmImg pjXmImg,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXmImg dest = null;

        Long id = pjXmImg.getFid();

        if (id != null) {
            dest = pjXmImgManager.get(id);
            beanMapper.copy(pjXmImg, dest);
        } else {
            dest = pjXmImg;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        pjXmImgManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-home.do";
    }

    @RequestMapping("pjXmImg-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjXmImg> pjXmImgs = pjXmImgManager.findByIds(selectedItem);

        pjXmImgManager.removeAll(pjXmImgs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/pjXmImg-info-list.do";
    }

    @RequestMapping("pjXmImg-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmImgManager.pagedQuery(page, propertyFilters);

        List<PjXmImg> pjXmImgs = (List<PjXmImg>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjXmImg info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjXmImgs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjXmImgManager(PjXmImgManager pjXmImgManager) {
        this.pjXmImgManager = pjXmImgManager;
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
