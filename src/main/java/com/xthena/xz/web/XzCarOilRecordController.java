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
import com.xthena.xz.domain.XzCarOilRecord;
import com.xthena.xz.domain.XzCarWbrecord;
import com.xthena.xz.manager.XzCarManager;
import com.xthena.xz.manager.XzCarOilRecordManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCarOilRecordController {
	@Autowired
	private XzCarManager xCarManager;
    private XzCarOilRecordManager xzCarOilRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzCarOilRecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	if (parameterMap.get("fcarid") != null
				&& parameterMap.get("fcarid") != "") {
			parameterMap.put("filter_EQL_fcarid", parameterMap.get("fcarid"));
		}
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarOilRecordManager.pagedQuery(page, propertyFilters);
        
        List<XzCarOilRecord> xzCarOilRecords  =(List<XzCarOilRecord>)page.getResult();
        for(XzCarOilRecord xzCarOilRecord:xzCarOilRecords){
        	xzCarOilRecord.setFmemo1(xCarManager.get(xzCarOilRecord.getFcarid()).getFcarno());
        }
        model.addAttribute("page", page);
        model.addAttribute("fcarid", parameterMap.get("fcarid"));
        return "xz/xzCarOilRecord-info-list";
    }

    @RequestMapping("xzCarOilRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
    		@RequestParam(value = "fcarid", required = false) Long fcarid,
            Model model) {
        if (id != null) {
            XzCarOilRecord xzCarOilRecord = xzCarOilRecordManager.get(id);
            model.addAttribute("model", xzCarOilRecord);
            model.addAttribute("fcarno",xCarManager.get(xzCarOilRecord.getFcarid()).getFcarno());
        }else if (fcarid != null) {
        	XzCarOilRecord xzCarWbrecord = new XzCarOilRecord();
        	xzCarWbrecord.setFcarid(fcarid);
			model.addAttribute("model", xzCarWbrecord);
			model.addAttribute("fcarno",xCarManager.get(xzCarWbrecord.getFcarid()).getFcarno());
		}

        return "xz/xzCarOilRecord-info-input";
    }

    @RequestMapping("xzCarOilRecord-info-save")
    public String save(@ModelAttribute XzCarOilRecord xzCarOilRecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCarOilRecord dest = null;

        Long id = xzCarOilRecord.getFid();

        if (id != null) {
            dest = xzCarOilRecordManager.get(id);
            beanMapper.copy(xzCarOilRecord, dest);
        } else {
            dest = xzCarOilRecord;
        }

        xzCarOilRecordManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCarOilRecord-info-list.do?fcarid="+dest.getFcarid();
    }

    @RequestMapping("xzCarOilRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCarOilRecord> xzCarOilRecords = xzCarOilRecordManager.findByIds(selectedItem);

        xzCarOilRecordManager.removeAll(xzCarOilRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCarOilRecord-info-list.do";
    }

    @RequestMapping("xzCarOilRecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCarOilRecordManager.pagedQuery(page, propertyFilters);

        List<XzCarOilRecord> xzCarOilRecords = (List<XzCarOilRecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCarOilRecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCarOilRecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzCarOilRecordManager(XzCarOilRecordManager xzCarOilRecordManager) {
        this.xzCarOilRecordManager = xzCarOilRecordManager;
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
