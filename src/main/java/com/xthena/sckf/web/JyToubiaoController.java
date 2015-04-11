package  com.xthena.sckf.web;

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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.sckf.domain.JyToubiao;
import com.xthena.sckf.manager.JyToubiaoManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyToubiaoController {
    private JyToubiaoManager jyToubiaoManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyToubiao-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyToubiaoManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/jyToubiao-info-list";
    }

    @RequestMapping("jyToubiao-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyToubiao jyToubiao = jyToubiaoManager.get(id);
            model.addAttribute("model", jyToubiao);
        }

        return "sckf/jyToubiao-info-input";
    }

    @RequestMapping("jyToubiao-info-save")
    public String save(@ModelAttribute JyToubiao jyToubiao,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyToubiao dest = null;

        Long id = jyToubiao.getFid();

        if (id != null) {
            dest = jyToubiaoManager.get(id);
            beanMapper.copy(jyToubiao, dest);
        } else {
            dest = jyToubiao;
        }

        jyToubiaoManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyToubiao-info-list.do";
    }

    @RequestMapping("jyToubiao-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyToubiao> jyToubiaos = jyToubiaoManager.findByIds(selectedItem);

        jyToubiaoManager.removeAll(jyToubiaos);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyToubiao-info-list.do";
    }

    @RequestMapping("jyToubiao-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyToubiaoManager.pagedQuery(page, propertyFilters);

        List<JyToubiao> jyToubiaos = (List<JyToubiao>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyToubiao info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyToubiaos);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyToubiaoManager(JyToubiaoManager jyToubiaoManager) {
        this.jyToubiaoManager = jyToubiaoManager;
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
