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

import com.xthena.gcgl.domain.Pjjx;
import com.xthena.gcgl.manager.PjjxManager;
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
public class PjjxController {
    private PjjxManager pjjxManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjjx-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjjxManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	
        return "gcgl/pjjx-info-list";
    }

    @RequestMapping("pjjx-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Pjjx pjjx = pjjxManager.get(id);
            model.addAttribute("model", pjjx);
            model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        }

        return "gcgl/pjjx-info-input";
    }

    @RequestMapping("pjjx-info-save")
    public String save(@ModelAttribute Pjjx pjjx,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Pjjx dest = null;

        Long id = pjjx.getFid();

        if (id != null) {
            dest = pjjxManager.get(id);
            beanMapper.copy(pjjx, dest);
        } else {
            dest = pjjx;
        }

        pjjxManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjjx-info-list.do";
    }

    @RequestMapping("pjjx-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Pjjx> pjjxs = pjjxManager.findByIds(selectedItem);

        pjjxManager.removeAll(pjjxs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjjx-info-list.do";
    }

    @RequestMapping("pjjx-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjjxManager.pagedQuery(page, propertyFilters);

        List<Pjjx> pjjxs = (List<Pjjx>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjjx info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjjxs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjjxManager(PjjxManager pjjxManager) {
        this.pjjxManager = pjjxManager;
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
