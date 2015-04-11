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

import com.xthena.gcgl.domain.PjMreport;
import com.xthena.gcgl.manager.PjMreportManager;
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
public class PjMreportController {
    private PjMreportManager pjMreportManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjMreport-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjMreportManager.pagedQuery(page, propertyFilters);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("page", page);

        return "gcgl/pjMreport-info-list";
    }

    @RequestMapping("pjMreport-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjMreport pjMreport = pjMreportManager.get(id);
            model.addAttribute("model", pjMreport);
            model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        }

        return "gcgl/pjMreport-info-input";
    }

    @RequestMapping("pjMreport-info-save")
    public String save(@ModelAttribute PjMreport pjMreport,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjMreport dest = null;

        Long id = pjMreport.getFid();

        if (id != null) {
            dest = pjMreportManager.get(id);
            beanMapper.copy(pjMreport, dest);
        } else {
            dest = pjMreport;
        }

        pjMreportManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjMreport-info-list.do";
    }

    @RequestMapping("pjMreport-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjMreport> pjMreports = pjMreportManager.findByIds(selectedItem);

        pjMreportManager.removeAll(pjMreports);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjMreport-info-list.do";
    }

    @RequestMapping("pjMreport-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjMreportManager.pagedQuery(page, propertyFilters);

        List<PjMreport> pjMreports = (List<PjMreport>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjMreport info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjMreports);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjMreportManager(PjMreportManager pjMreportManager) {
        this.pjMreportManager = pjMreportManager;
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
