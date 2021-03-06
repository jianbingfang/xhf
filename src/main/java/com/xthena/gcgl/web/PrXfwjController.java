package  com.xthena.gcgl.web;

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

import com.xthena.gcgl.domain.PrXfwj;
import com.xthena.gcgl.manager.PrXfwjManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PrXfwjController {
    private PrXfwjManager prXfwjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("prXfwj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = prXfwjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/prXfwj-info-list";
    }

    @RequestMapping("prXfwj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PrXfwj prXfwj = prXfwjManager.get(id);
            model.addAttribute("model", prXfwj);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/prXfwj-info-input";
    }

    @RequestMapping("prXfwj-info-save")
    public String save(@ModelAttribute PrXfwj prXfwj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PrXfwj dest = null;

        Long id = prXfwj.getFid();

        if (id != null) {
            dest = prXfwjManager.get(id);
            beanMapper.copy(prXfwj, dest);
        } else {
            dest = prXfwj;
        }

        prXfwjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/prXfwj-info-list.do";
    }

    @RequestMapping("prXfwj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PrXfwj> prXfwjs = prXfwjManager.findByIds(selectedItem);

        prXfwjManager.removeAll(prXfwjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/prXfwj-info-list.do";
    }

    @RequestMapping("prXfwj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = prXfwjManager.pagedQuery(page, propertyFilters);

        List<PrXfwj> prXfwjs = (List<PrXfwj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("prXfwj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(prXfwjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPrXfwjManager(PrXfwjManager prXfwjManager) {
        this.prXfwjManager = prXfwjManager;
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
