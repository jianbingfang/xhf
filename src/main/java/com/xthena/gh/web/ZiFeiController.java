package  com.xthena.gh.web;

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
import com.xthena.gh.domain.ZiFei;
import com.xthena.gh.manager.ZiFeiManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gh")
public class ZiFeiController {
    private ZiFeiManager ziFeiManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("ziFei-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "ftype", required = false) String ftype,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	if(ftype!=null ){
    		parameterMap.put("filter_EQS_fmemo2", ftype);
    	}
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = ziFeiManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        switch (ftype) {
		case "1":
			return "gh/ziFei-info-list";
		case "2":
			return "gh/ziFei-jk-info-list";
		case "3":
			return "gh/ziFei-sq-info-list";
		default:
			break;
		}
        return "gh/ziFei-info-list";
    }

    @RequestMapping("ziFei-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ftype", required = false) String ftype,
            Model model) {
        if (id != null) {
            ZiFei ziFei = ziFeiManager.get(id);
            model.addAttribute("model", ziFei);
        }
        switch (ftype) {
     		case "1":
     			return "gh/ziFei-info-input";
     		case "2":
     			return "gh/ziFei-jk-info-input";
     		case "3":
     			return "gh/ziFei-sq-info-input";
     		default:
     			break;
     		}
        return "gh/ziFei-info-input";
    }

    @RequestMapping("ziFei-info-save")
    public String save(@ModelAttribute ZiFei ziFei,@RequestParam(value = "ftype", required = false) String ftype,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        ZiFei dest = null;

        Long id = ziFei.getFid();

        if (id != null) {
            dest = ziFeiManager.get(id);
            beanMapper.copy(ziFei, dest);
        } else {
            dest = ziFei;
        }
        dest.setFmemo2(ftype);

        ziFeiManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gh/ziFei-info-list.do?ftype="+ftype;
    }

    @RequestMapping("ziFei-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,@RequestParam(value = "ftype", required = false) String ftype,
            RedirectAttributes redirectAttributes) {
        List<ZiFei> ziFeis = ziFeiManager.findByIds(selectedItem);

        ziFeiManager.removeAll(ziFeis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/ziFei-info-list.do?ftype="+ftype;
    }

    @RequestMapping("ziFei-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = ziFeiManager.pagedQuery(page, propertyFilters);

        List<ZiFei> ziFeis = (List<ZiFei>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("ziFei info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(ziFeis);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setZiFeiManager(ZiFeiManager ziFeiManager) {
        this.ziFeiManager = ziFeiManager;
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
