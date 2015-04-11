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

import com.xthena.gcgl.domain.PjBeian;
import com.xthena.gcgl.manager.PjBeianManager;
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
public class PjBeianController {
    private PjBeianManager pjBeianManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjBeian-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjBeianManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/pjBeian-info-list";
    }

    @RequestMapping("pjBeian-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjBeian pjBeian = pjBeianManager.get(id);
            model.addAttribute("model", pjBeian);
            model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        }

        return "gcgl/pjBeian-info-input";
    }

    @RequestMapping("pjBeian-info-save")
    public String save(@ModelAttribute PjBeian pjBeian,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjBeian dest = null;

        Long id = pjBeian.getFid();

        if (id != null) {
            dest = pjBeianManager.get(id);
            beanMapper.copy(pjBeian, dest);
        } else {
            dest = pjBeian;
        }

        pjBeianManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjBeian-info-list.do";
    }

    @RequestMapping("pjBeian-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjBeian> pjBeians = pjBeianManager.findByIds(selectedItem);

        pjBeianManager.removeAll(pjBeians);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjBeian-info-list.do";
    }

    @RequestMapping("pjBeian-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjBeianManager.pagedQuery(page, propertyFilters);

        List<PjBeian> pjBeians = (List<PjBeian>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjBeian info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjBeians);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjBeianManager(PjBeianManager pjBeianManager) {
        this.pjBeianManager = pjBeianManager;
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
