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
import com.xthena.sckf.domain.TZjDingdan;
import com.xthena.sckf.manager.TZjDingdanManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class TZjDingdanController {
    private TZjDingdanManager tZjDingdanManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("tZjDingdan-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = tZjDingdanManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/tZjDingdan-info-list";
    }

    @RequestMapping("tZjDingdan-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            TZjDingdan tZjDingdan = tZjDingdanManager.get(id);
            model.addAttribute("model", tZjDingdan);
        }

        return "sckf/tZjDingdan-info-input";
    }

    @RequestMapping("tZjDingdan-info-save")
    public String save(@ModelAttribute TZjDingdan tZjDingdan,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        TZjDingdan dest = null;

        Long id = tZjDingdan.getId();

        if (id != null) {
            dest = tZjDingdanManager.get(id);
            beanMapper.copy(tZjDingdan, dest);
        } else {
            dest = tZjDingdan;
        }

        tZjDingdanManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/sckf/tZjDingdan-info-list.do";
    }

    @RequestMapping("tZjDingdan-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<TZjDingdan> tZjDingdans = tZjDingdanManager.findByIds(selectedItem);

        tZjDingdanManager.removeAll(tZjDingdans);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/tZjDingdan-info-list.do";
    }

    @RequestMapping("tZjDingdan-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = tZjDingdanManager.pagedQuery(page, propertyFilters);

        List<TZjDingdan> tZjDingdans = (List<TZjDingdan>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("tZjDingdan info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(tZjDingdans);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setTZjDingdanManager(TZjDingdanManager tZjDingdanManager) {
        this.tZjDingdanManager = tZjDingdanManager;
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
