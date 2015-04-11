package  com.xthena.jl.web;

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
import com.xthena.jl.domain.JlKqDetail;
import com.xthena.jl.manager.JlKqDetailManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlKqDetailController {
    private JlKqDetailManager jlKqDetailManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlKqDetail-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlKqDetailManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlKqDetail-info-list";
    }

    @RequestMapping("jlKqDetail-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlKqDetail jlKqDetail = jlKqDetailManager.get(id);
            model.addAttribute("model", jlKqDetail);
        }

        return "jl/jlKqDetail-info-input";
    }

    @RequestMapping("jlKqDetail-info-save")
    public String save(@ModelAttribute JlKqDetail jlKqDetail,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlKqDetail dest = null;

        Long id = jlKqDetail.getFid();

        if (id != null) {
            dest = jlKqDetailManager.get(id);
            beanMapper.copy(jlKqDetail, dest);
        } else {
            dest = jlKqDetail;
        }

        jlKqDetailManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlKqDetail-info-list.do";
    }

    @RequestMapping("jlKqDetail-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlKqDetail> jlKqDetails = jlKqDetailManager.findByIds(selectedItem);

        jlKqDetailManager.removeAll(jlKqDetails);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlKqDetail-info-list.do";
    }

    @RequestMapping("jlKqDetail-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlKqDetailManager.pagedQuery(page, propertyFilters);

        List<JlKqDetail> jlKqDetails = (List<JlKqDetail>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlKqDetail info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlKqDetails);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlKqDetailManager(JlKqDetailManager jlKqDetailManager) {
        this.jlKqDetailManager = jlKqDetailManager;
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
