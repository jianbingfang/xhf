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
import com.xthena.xz.domain.XzCarBxRecord;
import com.xthena.xz.domain.XzCarOilRecord;
import com.xthena.xz.manager.XzCarBxRecordManager;
import com.xthena.xz.manager.XzCarManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCarBxRecordController {
	@Autowired
	private XzCarManager xCarManager;
    private XzCarBxRecordManager xzCarBxRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzCarBxRecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	if (parameterMap.get("fcarid") != null
				&& parameterMap.get("fcarid") != "") {
			parameterMap.put("filter_EQL_fcarid", parameterMap.get("fcarid"));
		}
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarBxRecordManager.pagedQuery(page, propertyFilters);
        List<XzCarBxRecord> xzCarBxRecords  =(List<XzCarBxRecord>)page.getResult();
        for(XzCarBxRecord xzCarBxRecord:xzCarBxRecords){
        	xzCarBxRecord.setFmemo1(xCarManager.get(xzCarBxRecord.getFcarid()).getFcarno());
        }
        model.addAttribute("fcarid", parameterMap.get("fcarid"));
        model.addAttribute("page", page);

        return "xz/xzCarBxRecord-info-list";
    }

    @RequestMapping("xzCarBxRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
    		@RequestParam(value = "fcarid", required = false) Long fcarid,
            Model model) {
        if (id != null) {
            XzCarBxRecord xzCarBxRecord = xzCarBxRecordManager.get(id);
            model.addAttribute("model", xzCarBxRecord);
            model.addAttribute("fcarno",xCarManager.get(xzCarBxRecord.getFcarid()).getFcarno());
        }else if (fcarid != null) {
        	XzCarBxRecord xzCarWbrecord = new XzCarBxRecord();
        	xzCarWbrecord.setFcarid(fcarid);
			model.addAttribute("model", xzCarWbrecord);
			model.addAttribute("fcarno",
					xCarManager.get(fcarid).getFcarno());
		}
       
        return "xz/xzCarBxRecord-info-input";
    }

    @RequestMapping("xzCarBxRecord-info-save")
    public String save(@ModelAttribute XzCarBxRecord xzCarBxRecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCarBxRecord dest = null;

        Long id = xzCarBxRecord.getFid();

        if (id != null) {
            dest = xzCarBxRecordManager.get(id);
            beanMapper.copy(xzCarBxRecord, dest);
        } else {
            dest = xzCarBxRecord;
        }

       // xzCarBxRecordManager.saveAndUpdeCar(dest);
        xzCarBxRecordManager.save(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCarBxRecord-info-list.do?fcarid="+dest.getFcarid();
    }

    @RequestMapping("xzCarBxRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCarBxRecord> xzCarBxRecords = xzCarBxRecordManager.findByIds(selectedItem);

        xzCarBxRecordManager.removeAll(xzCarBxRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCarBxRecord-info-list.do";
    }

    @RequestMapping("xzCarBxRecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarBxRecordManager.pagedQuery(page, propertyFilters);

        List<XzCarBxRecord> xzCarBxRecords = (List<XzCarBxRecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCarBxRecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCarBxRecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzCarBxRecordManager(XzCarBxRecordManager xzCarBxRecordManager) {
        this.xzCarBxRecordManager = xzCarBxRecordManager;
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
