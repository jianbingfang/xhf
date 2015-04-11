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
import com.xthena.xz.domain.XzCarRecord;
import com.xthena.xz.domain.XzCarWbrecord;
import com.xthena.xz.manager.XzCarManager;
import com.xthena.xz.manager.XzCarWbrecordManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCarWbrecordController {
	@Autowired
	private XzCarManager xCarManager;
    private XzCarWbrecordManager xzCarWbrecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzCarWbrecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	if (parameterMap.get("fcarid") != null
				&& parameterMap.get("fcarid") != "") {
			parameterMap.put("filter_EQL_fcarid", parameterMap.get("fcarid"));
		}
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarWbrecordManager.pagedQuery(page, propertyFilters);
        
        List<XzCarWbrecord> xzCarWbrecords  =(List<XzCarWbrecord>)page.getResult();
        for(XzCarWbrecord xzCarWbrecord:xzCarWbrecords){
        	xzCarWbrecord.setFmemo1(xCarManager.get(xzCarWbrecord.getFcarid()).getFcarno());
        }
        model.addAttribute("fcarid", parameterMap.get("fcarid"));
        model.addAttribute("page", page);

        return "xz/xzCarWbrecord-info-list";
    }

    @RequestMapping("xzCarWbrecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
    		@RequestParam(value = "fcarid", required = false) Long fcarid,
            Model model) {
        if (id != null) {
            XzCarWbrecord xzCarWbrecord = xzCarWbrecordManager.get(id);
            model.addAttribute("model", xzCarWbrecord);
            model.addAttribute("fcarno",xCarManager.get(xzCarWbrecord.getFcarid()).getFcarno());
        }else if (fcarid != null) {
        	XzCarWbrecord xzCarWbrecord = new XzCarWbrecord();
        	xzCarWbrecord.setFcarid(fcarid);
			model.addAttribute("model", xzCarWbrecord);
			model.addAttribute("fcarno",
					xCarManager.get(fcarid).getFcarno());
		}

        return "xz/xzCarWbrecord-info-input";
    }

    @RequestMapping("xzCarWbrecord-info-save")
    public String save(@ModelAttribute XzCarWbrecord xzCarWbrecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCarWbrecord dest = null;

        Long id = xzCarWbrecord.getFid();

        if (id != null) {
            dest = xzCarWbrecordManager.get(id);
            beanMapper.copy(xzCarWbrecord, dest);
        } else {
            dest = xzCarWbrecord;
        }

       // xzCarWbrecordManager.saveAndUpdeCar(dest);
        xzCarWbrecordManager.save(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCarWbrecord-info-list.do?fcarid="+dest.getFcarid();
    }

    @RequestMapping("xzCarWbrecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCarWbrecord> xzCarWbrecords = xzCarWbrecordManager.findByIds(selectedItem);

        xzCarWbrecordManager.removeAll(xzCarWbrecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCarWbrecord-info-list.do";
    }

    @RequestMapping("xzCarWbrecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarWbrecordManager.pagedQuery(page, propertyFilters);

        List<XzCarWbrecord> xzCarWbrecords = (List<XzCarWbrecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCarWbrecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCarWbrecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzCarWbrecordManager(XzCarWbrecordManager xzCarWbrecordManager) {
        this.xzCarWbrecordManager = xzCarWbrecordManager;
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
