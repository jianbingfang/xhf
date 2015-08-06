package  com.xthena.gcgl.web;

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

import com.xthena.gcgl.manager.PjDuchaVManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.gcgl.domain.PjDucha;
import com.xthena.gcgl.manager.PjDuchaManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjDuchaController {
    private PjDuchaManager pjDuchaManager;
    private PjDuchaVManager pjDuchaVManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjDucha-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjDuchaVManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjDucha-info-list";
    }

    @RequestMapping("pjDucha-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjDucha pjDucha = pjDuchaManager.get(id);
            model.addAttribute("model", pjDucha);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	
        return "gcgl/pjDucha-info-input";
    }

    @RequestMapping("pjDucha-info-save")
    public String save(@ModelAttribute PjDucha pjDucha,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjDucha dest = null;

        Long id = pjDucha.getFid();

        if (id != null) {
            dest = pjDuchaManager.get(id);
            beanMapper.copy(pjDucha, dest);
        } else {
            dest = pjDucha;
        }

        pjDuchaManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjDucha-info-list.do";
    }

    @RequestMapping("pjDucha-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjDucha> pjDuchas = pjDuchaManager.findByIds(selectedItem);

        pjDuchaManager.removeAll(pjDuchas);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjDucha-info-list.do";
    }

    @RequestMapping("pjDucha-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjDuchaManager.pagedQuery(page, propertyFilters);

        List<PjDucha> pjDuchas = (List<PjDucha>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjDucha info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjDuchas);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjDuchaManager(PjDuchaManager pjDuchaManager) {
        this.pjDuchaManager = pjDuchaManager;
    }
    @Resource
    public void setPjDuchaVManager(PjDuchaVManager pjDuchaVManager) {
        this.pjDuchaVManager = pjDuchaVManager;
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
