package  com.xthena.hr.web;

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
import com.xthena.hr.domain.HrZj;
import com.xthena.hr.manager.HrZjManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrZjController {
    private HrZjManager hrZjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrZj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrZjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrZj-info-list";
    }

    @RequestMapping("hrZj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrZj hrZj = hrZjManager.get(id);
            model.addAttribute("model", hrZj);
        }

        return "hr/hrZj-info-input";
    }

    @RequestMapping("hrZj-info-save")
    public String save(@ModelAttribute HrZj hrZj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrZj dest = null;

        Long id = hrZj.getFid();

        if (id != null) {
            dest = hrZjManager.get(id);
            beanMapper.copy(hrZj, dest);
        } else {
            dest = hrZj;
        }

        hrZjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrZj-info-list.do";
    }

    @RequestMapping("hrZj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrZj> hrZjs = hrZjManager.findByIds(selectedItem);

        hrZjManager.removeAll(hrZjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrZj-info-list.do";
    }

    @RequestMapping("hrZj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrZjManager.pagedQuery(page, propertyFilters);

        List<HrZj> hrZjs = (List<HrZj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrZj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrZjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrZjManager(HrZjManager hrZjManager) {
        this.hrZjManager = hrZjManager;
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
