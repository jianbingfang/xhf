package  com.xthena.dzb.web;

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
import com.xthena.dzb.domain.Df;
import com.xthena.dzb.manager.DfManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("dzb")
public class DfController {
    private DfManager dfManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("df-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = dfManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "dzb/df-info-list";
    }

    @RequestMapping("df-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Df df = dfManager.get(id);
            model.addAttribute("model", df);
        }

        return "dzb/df-info-input";
    }

    @RequestMapping("df-info-save")
    public String save(@ModelAttribute Df df,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Df dest = null;

        Long id = df.getFid();

        if (id != null) {
            dest = dfManager.get(id);
            beanMapper.copy(df, dest);
        } else {
            dest = df;
        }

        dfManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/dzb/df-info-list.do";
    }

    @RequestMapping("df-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Df> dfs = dfManager.findByIds(selectedItem);

        dfManager.removeAll(dfs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/dzb/df-info-list.do";
    }

    @RequestMapping("df-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = dfManager.pagedQuery(page, propertyFilters);

        List<Df> dfs = (List<Df>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("df info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(dfs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setDfManager(DfManager dfManager) {
        this.dfManager = dfManager;
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
