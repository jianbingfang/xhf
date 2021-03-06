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
import com.xthena.gcgl.domain.PjPeixun;
import com.xthena.gcgl.manager.PjPeixunManager;
import com.xthena.util.CommRyMapUtil;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjPeixunController {
    private PjPeixunManager pjpeixunManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjpeixun-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjpeixunManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/pjpeixun-info-list";
    }

    @RequestMapping("pjpeixun-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjPeixun pjpeixun = pjpeixunManager.get(id);
            model.addAttribute("model", pjpeixun);
        }

        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/pjpeixun-info-input";
    }

    @RequestMapping("pjpeixun-info-save")
    public String save(@ModelAttribute PjPeixun pjpeixun,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjPeixun dest = null;

        Long id = pjpeixun.getFid();

        if (id != null) {
            dest = pjpeixunManager.get(id);
            beanMapper.copy(pjpeixun, dest);
        } else {
            dest = pjpeixun;
        }

        pjpeixunManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjpeixun-info-list.do";
    }

    @RequestMapping("pjpeixun-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjPeixun> pjpeixuns = pjpeixunManager.findByIds(selectedItem);

        pjpeixunManager.removeAll(pjpeixuns);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjpeixun-info-list.do";
    }

    @RequestMapping("pjpeixun-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjpeixunManager.pagedQuery(page, propertyFilters);

        List<PjPeixun> pjpeixuns = (List<PjPeixun>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjpeixun info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjpeixuns);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjPeixunManager(PjPeixunManager pjpeixunManager) {
        this.pjpeixunManager = pjpeixunManager;
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
