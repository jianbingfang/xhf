package  com.xthena.jl.web;

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
import com.xthena.hr.domain.HrLz;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrLzManager;
import com.xthena.util.CommRyMapUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlHrLzController {
	
   @Autowired
	private CommRyManager commRyManager;
	    
    private HrLzManager hrLzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jl-hrLz-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrLzManager.pagedQuery(page,
                propertyFilters);
        
    
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("page", page);

        return "jl/hrLz-info-list";
    }

    @RequestMapping("jl-hrLz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrLz hrLz = hrLzManager.get(id);
            model.addAttribute("model", hrLz);
            model.addAttribute("userName", commRyManager.get(hrLz.getFry()).getFname());
        }
        return "jl/hrLz-info-input";
    }

    @RequestMapping("jl-hrLz-info-save")
    public String save(@ModelAttribute HrLz hrLz,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrLz dest = null;

        Long id = hrLz.getFid();

        if (id != null) {
            dest = hrLzManager.get(id);
            beanMapper.copy(hrLz, dest);
        } else {
            dest = hrLz;
        }

        hrLzManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-hrLz-info-list.do";
    }

    @RequestMapping("jl-hrLz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrLz> hrLzs = hrLzManager.findByIds(selectedItem);

        hrLzManager.removeAll(hrLzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-hrLz-info-list.do";
    }

    @RequestMapping("jl-hrLz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrLzManager.pagedQuery(page, propertyFilters);

        List<HrLz> hrLzs = (List<HrLz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrLz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrLzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrLzManager(HrLzManager hrLzManager) {
        this.hrLzManager = hrLzManager;
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
