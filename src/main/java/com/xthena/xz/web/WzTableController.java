package  com.xthena.xz.web;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.util.JsonResponseUtil;
import com.xthena.util.WzMapUtil;
import com.xthena.xz.domain.WzTable;
import com.xthena.xz.manager.WzKindManager;
import com.xthena.xz.manager.WzTableManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class WzTableController {
    private WzTableManager wzTableManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private WzKindManager wzKindManager;

    @RequestMapping("wzTable-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzTableManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("kindList", wzKindManager.getAll());
        return "xz/wzTable-info-list";
    }
    

    
    @RequestMapping("wz-simple-list")
    public void wzSimpleList(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,HttpServletResponse response) {
    	List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzTableManager.pagedQuery(page, propertyFilters);
        JsonResponseUtil.write(response,page);
    }

    
    @RequestMapping("wzTable-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            WzTable wzTable = wzTableManager.get(id);
            model.addAttribute("model", wzTable);
        }
        model.addAttribute("kindList", wzKindManager.getAll());
        return "xz/wzTable-info-input";
    }

    @RequestMapping("wzTable-info-save")
    public String save(@ModelAttribute WzTable wzTable,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        WzTable dest = null;

        Long id = wzTable.getFid();

        if (id != null) {
            dest = wzTableManager.get(id);
            beanMapper.copy(wzTable, dest);
        } else {
            dest = wzTable;
        }

        wzTableManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/wzTable-info-list.do";
    }

    @RequestMapping("wzTable-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<WzTable> wzTables = wzTableManager.findByIds(selectedItem);

        wzTableManager.removeAll(wzTables);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/wzTable-info-list.do";
    }

    @RequestMapping("wzTable-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzTableManager.pagedQuery(page, propertyFilters);

        List<WzTable> wzTables = (List<WzTable>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("wzTable info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(wzTables);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setWzTableManager(WzTableManager wzTableManager) {
        this.wzTableManager = wzTableManager;
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
