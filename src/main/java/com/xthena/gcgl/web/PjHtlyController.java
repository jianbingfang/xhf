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
import com.xthena.gcgl.domain.PjHtly;
import com.xthena.gcgl.manager.PjHtlyManager;
import com.xthena.gcgl.manager.PjHtlyVManager;
import com.xthena.util.HtMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjHtlyController {
    private PjHtlyManager pjHtlyManager;
    private PjHtlyVManager pjHtlyVManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjHtly-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjHtlyVManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjHtly-info-list";
    }

    @RequestMapping("pjHtly-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjHtly pjHtly = pjHtlyManager.get(id);
            model.addAttribute("model", pjHtly);
        }
        
        model.addAttribute("htMap", HtMapUtil.getHtMap());

        return "gcgl/pjHtly-info-input";
    }

    @RequestMapping("pjHtly-info-save")
    public String save(@ModelAttribute PjHtly pjHtly,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjHtly dest = null;

        Long id = pjHtly.getFid();

        if (id != null) {
            dest = pjHtlyManager.get(id);
            beanMapper.copy(pjHtly, dest);
        } else {
            dest = pjHtly;
        }

        pjHtlyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjHtly-info-list.do";
    }

    @RequestMapping("pjHtly-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjHtly> pjHtlys = pjHtlyManager.findByIds(selectedItem);

        pjHtlyManager.removeAll(pjHtlys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjHtly-info-list.do";
    }

    @RequestMapping("pjHtly-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjHtlyManager.pagedQuery(page, propertyFilters);

        List<PjHtly> pjHtlys = (List<PjHtly>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjHtly info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjHtlys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjHtlyManager(PjHtlyManager pjHtlyManager) {
        this.pjHtlyManager = pjHtlyManager;
    }
    @Resource
    public void setPjHtlyVManager(PjHtlyVManager pjHtlyVManager) {
        this.pjHtlyVManager = pjHtlyVManager;
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
