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

import com.xthena.gcgl.domain.PjHuiyi;
import com.xthena.gcgl.manager.PjHuiyiManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjHuiyiController {
    private PjHuiyiManager pjHuiyiManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjHuiyi-yt-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	parameterMap.put("filter_EQS_fhuiytype", "总监研讨会");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjHuiyiManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjHuiyi-yt-info-list";
    }

    @RequestMapping("pjHuiyi-yt-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjHuiyi pjHuiyi = pjHuiyiManager.get(id);
            model.addAttribute("model", pjHuiyi);
        }

        return "gcgl/pjHuiyi-yt-info-input";
    }

    @RequestMapping("pjHuiyi-yt-info-save")
    public String save(@ModelAttribute PjHuiyi pjHuiyi,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjHuiyi dest = null;

        Long id = pjHuiyi.getFid();

        if (id != null) {
            dest = pjHuiyiManager.get(id);
            beanMapper.copy(pjHuiyi, dest);
        } else {
            dest = pjHuiyi;
        }

        pjHuiyiManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjHuiyi-yt-info-list.do";
    }

    @RequestMapping("pjHuiyi-yt-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjHuiyi> pjHuiyis = pjHuiyiManager.findByIds(selectedItem);

        pjHuiyiManager.removeAll(pjHuiyis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjHuiyi-yt-info-list.do";
    }

    @RequestMapping("pjHuiyi-yt-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fhuiytype", "总监研讨会");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjHuiyiManager.pagedQuery(page, propertyFilters);

        List<PjHuiyi> pjHuiyis = (List<PjHuiyi>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjHuiyi info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjHuiyis);
        exportor.export(response, tableModel);
    }
    
    @RequestMapping("pjHuiyi-zt-info-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fhuiytype", "总监座谈会");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjHuiyiManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjHuiyi-zt-info-list";
    }

    @RequestMapping("pjHuiyi-zt-info-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjHuiyi pjHuiyi = pjHuiyiManager.get(id);
            model.addAttribute("model", pjHuiyi);
        }

        return "gcgl/pjHuiyi-zt-info-input";
    }

    @RequestMapping("pjHuiyi-zt-info-save")
    public String save2(@ModelAttribute PjHuiyi pjHuiyi,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjHuiyi dest = null;

        Long id = pjHuiyi.getFid();

        if (id != null) {
            dest = pjHuiyiManager.get(id);
            beanMapper.copy(pjHuiyi, dest);
        } else {
            dest = pjHuiyi;
        }

        pjHuiyiManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjHuiyi-zt-info-list.do";
    }

    @RequestMapping("pjHuiyi-zt-info-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjHuiyi> pjHuiyis = pjHuiyiManager.findByIds(selectedItem);

        pjHuiyiManager.removeAll(pjHuiyis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjHuiyi-zt-info-list.do";
    }

    @RequestMapping("pjHuiyi-zt-info-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fhuiytype", "总监座谈会");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjHuiyiManager.pagedQuery(page, propertyFilters);

        List<PjHuiyi> pjHuiyis = (List<PjHuiyi>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjHuiyi info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjHuiyis);
        exportor.export(response, tableModel);
    }


    // ~ ======================================================================
    @Resource
    public void setPjHuiyiManager(PjHuiyiManager pjHuiyiManager) {
        this.pjHuiyiManager = pjHuiyiManager;
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
