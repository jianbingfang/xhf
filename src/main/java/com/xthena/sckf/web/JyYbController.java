package  com.xthena.sckf.web;

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
import com.xthena.sckf.domain.JyYb;
import com.xthena.sckf.manager.JyYbManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyYbController {
    private JyYbManager jyYbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyYb-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyYbManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "sckf/jyYb-info-list";
    }

    @RequestMapping("jyYb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyYb jyYb = jyYbManager.get(id);
            model.addAttribute("model", jyYb);
        }

        return "sckf/jyYb-info-input";
    }

    @RequestMapping("jyYb-info-save")
    public String save(@ModelAttribute JyYb jyYb,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyYb dest = null;

        Long id = jyYb.getFid();

        if (id != null) {
            dest = jyYbManager.get(id);
            beanMapper.copy(jyYb, dest);
        } else {
            dest = jyYb;
        }
        dest.setFuploadry(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        jyYbManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyYb-info-list.do";
    }

    @RequestMapping("jyYb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyYb> jyYbs = jyYbManager.findByIds(selectedItem);

        jyYbManager.removeAll(jyYbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyYb-info-list.do";
    }

    @RequestMapping("jyYb-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyYbManager.pagedQuery(page, propertyFilters);

        List<JyYb> jyYbs = (List<JyYb>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyYb info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyYbs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyYbManager(JyYbManager jyYbManager) {
        this.jyYbManager = jyYbManager;
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
