package  com.xthena.xz.web;

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
import com.xthena.util.CommRyMapUtil;
import com.xthena.xz.domain.XzCarRecord;
import com.xthena.xz.domain.XzCarSc;
import com.xthena.xz.manager.XzCarManager;
import com.xthena.xz.manager.XzCarScManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCarScController {
	@Autowired
	private XzCarManager xCarManager;
    private XzCarScManager xzCarScManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzCarSc-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	if (parameterMap.get("fcarid") != null
				&& parameterMap.get("fcarid") != "") {
			parameterMap.put("filter_EQL_fcarid", parameterMap.get("fcarid"));
		}
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarScManager.pagedQuery(page, propertyFilters);
      
        List<XzCarSc> xzCarScs  =(List<XzCarSc>)page.getResult();
        for(XzCarSc xzCarSc:xzCarScs){
        	xzCarSc.setFmemo1(xCarManager.get(xzCarSc.getFcarid()).getFcarno());
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("fcarid", parameterMap.get("fcarid"));
        model.addAttribute("page", page);

        return "xz/xzCarSc-info-list";
    }

    @RequestMapping("xzCarSc-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
    		@RequestParam(value = "fcarid", required = false) Long fcarid,
            Model model) {
        if (id != null) {
            XzCarSc xzCarSc = xzCarScManager.get(id);
            model.addAttribute("model", xzCarSc);
            model.addAttribute("fcarno",xCarManager.get(xzCarSc.getFcarid()).getFcarno());
        }else if (fcarid != null) {
        	XzCarSc xzCarSc =  new XzCarSc();
        	xzCarSc.setFcarid(fcarid);
			model.addAttribute("model", xzCarSc);
			model.addAttribute("fcarno",
					xCarManager.get(fcarid).getFcarno());
		}
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/xzCarSc-info-input";
    }

    @RequestMapping("xzCarSc-info-save")
    public String save(@ModelAttribute XzCarSc xzCarSc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCarSc dest = null;

        Long id = xzCarSc.getFid();

        if (id != null) {
            dest = xzCarScManager.get(id);
            beanMapper.copy(xzCarSc, dest);
        } else {
            dest = xzCarSc;
        }

        xzCarScManager.saveAndUpdeCar(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCarSc-info-list.do?fcarid="+dest.getFcarid();
    }

    @RequestMapping("xzCarSc-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCarSc> xzCarScs = xzCarScManager.findByIds(selectedItem);

        xzCarScManager.removeAll(xzCarScs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCarSc-info-list.do";
    }

    @RequestMapping("xzCarSc-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarScManager.pagedQuery(page, propertyFilters);

        List<XzCarSc> xzCarScs = (List<XzCarSc>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCarSc info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCarScs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzCarScManager(XzCarScManager xzCarScManager) {
        this.xzCarScManager = xzCarScManager;
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
