package  com.xthena.jl.web;

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

import com.xthena.jl.domain.JlZjXczbrecord;
import com.xthena.jl.manager.JlZjXczbrecordManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlZjXczbrecordController {
    private JlZjXczbrecordManager jlZjXczbrecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlZjXczbrecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjXczbrecordManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlZjXczbrecord-info-list";
    }

    @RequestMapping("jlZjXczbrecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlZjXczbrecord jlZjXczbrecord = jlZjXczbrecordManager.get(id);
            model.addAttribute("model", jlZjXczbrecord);
        }

        return "jl/jlZjXczbrecord-info-input";
    }

    @RequestMapping("jlZjXczbrecord-info-save")
    public String save(@ModelAttribute JlZjXczbrecord jlZjXczbrecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlZjXczbrecord dest = null;

        Long id = jlZjXczbrecord.getFid();

        if (id != null) {
            dest = jlZjXczbrecordManager.get(id);
            beanMapper.copy(jlZjXczbrecord, dest);
        } else {
            dest = jlZjXczbrecord;
        }

        jlZjXczbrecordManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlZjXczbrecord-info-list.do";
    }

    @RequestMapping("jlZjXczbrecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlZjXczbrecord> jlZjXczbrecords = jlZjXczbrecordManager.findByIds(selectedItem);

        jlZjXczbrecordManager.removeAll(jlZjXczbrecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlZjXczbrecord-info-list.do";
    }

    @RequestMapping("jlZjXczbrecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjXczbrecordManager.pagedQuery(page, propertyFilters);

        List<JlZjXczbrecord> jlZjXczbrecords = (List<JlZjXczbrecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlZjXczbrecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlZjXczbrecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlZjXczbrecordManager(JlZjXczbrecordManager jlZjXczbrecordManager) {
        this.jlZjXczbrecordManager = jlZjXczbrecordManager;
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
