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

import com.xthena.gcgl.domain.PjZerenshu;
import com.xthena.gcgl.manager.PjZerenshuManager;
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
public class PjZerenshuController {
    private PjZerenshuManager pjZerenshuManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjZerenshu-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjZerenshuManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/pjZerenshu-info-list";
    }

    @RequestMapping("pjZerenshu-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjZerenshu pjZerenshu = pjZerenshuManager.get(id);
            model.addAttribute("model", pjZerenshu);
            model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        }

        return "gcgl/pjZerenshu-info-input";
    }

    @RequestMapping("pjZerenshu-info-save")
    public String save(@ModelAttribute PjZerenshu pjZerenshu,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjZerenshu dest = null;

        Long id = pjZerenshu.getFid();

        if (id != null) {
            dest = pjZerenshuManager.get(id);
            beanMapper.copy(pjZerenshu, dest);
        } else {
            dest = pjZerenshu;
        }

        pjZerenshuManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjZerenshu-info-list.do";
    }

    @RequestMapping("pjZerenshu-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjZerenshu> pjZerenshus = pjZerenshuManager.findByIds(selectedItem);

        pjZerenshuManager.removeAll(pjZerenshus);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjZerenshu-info-list.do";
    }

    @RequestMapping("pjZerenshu-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjZerenshuManager.pagedQuery(page, propertyFilters);

        List<PjZerenshu> pjZerenshus = (List<PjZerenshu>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjZerenshu info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjZerenshus);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjZerenshuManager(PjZerenshuManager pjZerenshuManager) {
        this.pjZerenshuManager = pjZerenshuManager;
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
