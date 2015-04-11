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
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.xz.domain.XzGdzctj;
import com.xthena.xz.manager.XzGdzctjManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzGdzctjController {
    private XzGdzctjManager xzGdzctjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzGdzctj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzGdzctjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "xz/xzGdzctj-info-list";
    }

    @RequestMapping("xzGdzctj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzGdzctj xzGdzctj = xzGdzctjManager.get(id);
            model.addAttribute("model", xzGdzctj);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/xzGdzctj-info-input";
    }

    @RequestMapping("xzGdzctj-info-save")
    public String save(@ModelAttribute XzGdzctj xzGdzctj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzGdzctj dest = null;

        Long id = xzGdzctj.getFid();

        if (id != null) {
            dest = xzGdzctjManager.get(id);
            beanMapper.copy(xzGdzctj, dest);
        } else {
            dest = xzGdzctj;
        }

        xzGdzctjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzGdzctj-info-list.do";
    }

    @RequestMapping("xzGdzctj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzGdzctj> xzGdzctjs = xzGdzctjManager.findByIds(selectedItem);

        xzGdzctjManager.removeAll(xzGdzctjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzGdzctj-info-list.do";
    }

    @RequestMapping("xzGdzctj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzGdzctjManager.pagedQuery(page, propertyFilters);

        List<XzGdzctj> xzGdzctjs = (List<XzGdzctj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzGdzctj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzGdzctjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzGdzctjManager(XzGdzctjManager xzGdzctjManager) {
        this.xzGdzctjManager = xzGdzctjManager;
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
