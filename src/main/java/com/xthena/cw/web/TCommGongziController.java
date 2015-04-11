package  com.xthena.cw.web;

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
import com.xthena.cw.domain.TCommGongzi;
import com.xthena.cw.manager.TCommGongziManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class TCommGongziController {
    private TCommGongziManager tCommGongziManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("tCommGongzi-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = tCommGongziManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "cw/tCommGongzi-info-list";
    }

    @RequestMapping("tCommGongzi-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            TCommGongzi tCommGongzi = tCommGongziManager.get(id);
            model.addAttribute("model", tCommGongzi);
        }

        return "cw/tCommGongzi-info-input";
    }

    @RequestMapping("tCommGongzi-info-save")
    public String save(@ModelAttribute TCommGongzi tCommGongzi,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        TCommGongzi dest = null;

        Long id = tCommGongzi.getFid();

        if (id != null) {
            dest = tCommGongziManager.get(id);
            beanMapper.copy(tCommGongzi, dest);
        } else {
            dest = tCommGongzi;
        }
        tCommGongziManager.save(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/cw/tCommGongzi-info-list.do";
    }

    @RequestMapping("tCommGongzi-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<TCommGongzi> tCommGongzis = tCommGongziManager.findByIds(selectedItem);

        tCommGongziManager.removeAll(tCommGongzis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/tCommGongzi-info-list.do";
    }

    @RequestMapping("tCommGongzi-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = tCommGongziManager.pagedQuery(page, propertyFilters);

        List<TCommGongzi> tCommGongzis = (List<TCommGongzi>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("tCommGongzi info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(tCommGongzis);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setTCommGongziManager(TCommGongziManager tCommGongziManager) {
        this.tCommGongziManager = tCommGongziManager;
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
