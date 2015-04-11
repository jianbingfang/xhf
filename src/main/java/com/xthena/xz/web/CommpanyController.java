package  com.xthena.xz.web;

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
import com.xthena.util.CommRyMapUtil;
import com.xthena.xz.domain.Commpany;
import com.xthena.xz.manager.CommpanyManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class CommpanyController {
    private CommpanyManager commpanyManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("commpany-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commpanyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
     	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/commpany-info-list";
    }

    @RequestMapping("commpany-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Commpany commpany = commpanyManager.get(id);
            model.addAttribute("model", commpany);
        }
     	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/commpany-info-input";
    }

    @RequestMapping("commpany-info-save")
    public String save(@ModelAttribute Commpany commpany,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Commpany dest = null;

        Long id = commpany.getFid();

        if (id != null) {
            dest = commpanyManager.get(id);
            beanMapper.copy(commpany, dest);
        } else {
            dest = commpany;
        }

        commpanyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/commpany-info-list.do";
    }

    @RequestMapping("commpany-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Commpany> commpanys = commpanyManager.findByIds(selectedItem);

        commpanyManager.removeAll(commpanys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/commpany-info-list.do";
    }

    @RequestMapping("commpany-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commpanyManager.pagedQuery(page, propertyFilters);

        List<Commpany> commpanys = (List<Commpany>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commpany info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commpanys);
        exportor.export(response, tableModel);
    }
//**********************************************************************
    @RequestMapping("commpanyGlxy-info-list")
    public String listGlxy(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commpanyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
     	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/commpanyGlxy-info-list";
    }

    @RequestMapping("commpanyGlxy-info-input")
    public String inputGlxy(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Commpany commpany = commpanyManager.get(id);
            model.addAttribute("model", commpany);
        }
     	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/commpanyGlxy-info-input";
    }

    @RequestMapping("commpanyGlxy-info-save")
    public String saveGlxy(@ModelAttribute Commpany commpany,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Commpany dest = null;

        Long id = commpany.getFid();

        if (id != null) {
            dest = commpanyManager.get(id);
            beanMapper.copy(commpany, dest);
        } else {
            dest = commpany;
        }

        commpanyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/commpanyGlxy-info-list.do";
    }

    @RequestMapping("commpanyGlxy-info-remove")
    public String removeGlxy(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Commpany> commpanys = commpanyManager.findByIds(selectedItem);

        commpanyManager.removeAll(commpanys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/commpanyGlxy-info-list.do";
    }

    @RequestMapping("commpanyGlxy-info-export")
    public void exportGlxy(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commpanyManager.pagedQuery(page, propertyFilters);

        List<Commpany> commpanys = (List<Commpany>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commpany info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commpanys);
        exportor.export(response, tableModel);
    }

    
    // ~ ======================================================================
    @Resource
    public void setCommpanyManager(CommpanyManager commpanyManager) {
        this.commpanyManager = commpanyManager;
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
