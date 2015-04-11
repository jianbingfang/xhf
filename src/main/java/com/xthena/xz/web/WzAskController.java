package  com.xthena.xz.web;

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
import com.xthena.xz.domain.WzAsk;
import com.xthena.xz.manager.WzAskManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class WzAskController {
    private WzAskManager wzAskManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("wzAsk-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzAskManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/wzAsk-info-list";
    }

    @RequestMapping("wzAsk-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            WzAsk wzAsk = wzAskManager.get(id);
            model.addAttribute("model", wzAsk);
        }

        return "xz/wzAsk-info-input";
    }

    @RequestMapping("wzAsk-info-save")
    public String save(@ModelAttribute WzAsk wzAsk,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        WzAsk dest = null;

        Long id = wzAsk.getFid();

        if (id != null) {
            dest = wzAskManager.get(id);
            beanMapper.copy(wzAsk, dest);
        } else {
            dest = wzAsk;
        }

        wzAskManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/wzAsk-info-list.do";
    }

    @RequestMapping("wzAsk-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<WzAsk> wzAsks = wzAskManager.findByIds(selectedItem);

        wzAskManager.removeAll(wzAsks);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/wzAsk-info-list.do";
    }

    @RequestMapping("wzAsk-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzAskManager.pagedQuery(page, propertyFilters);

        List<WzAsk> wzAsks = (List<WzAsk>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("wzAsk info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(wzAsks);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setWzAskManager(WzAskManager wzAskManager) {
        this.wzAskManager = wzAskManager;
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
