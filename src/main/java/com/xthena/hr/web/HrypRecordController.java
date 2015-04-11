package  com.xthena.hr.web;

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
import com.xthena.util.JsonResponseUtil;
import com.xthena.hr.domain.HrypRecord;
import com.xthena.hr.manager.HrypRecordManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrypRecordController {
    private HrypRecordManager hrypRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrypRecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrypRecordManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrypRecord-info-list";
    }

	@RequestMapping("yprecord-simple-list")
	public void listRy(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = hrypRecordManager.pagedQuery(page, propertyFilters);
		JsonResponseUtil.write(response, page);
	}
   
    @RequestMapping("hr-loadypry-ajax")
    public void loadypry(@RequestParam(value = "fid", required = false) Long fid,HttpServletResponse response,
            Model model) {
    	JsonResponseUtil.write(response,hrypRecordManager.get(fid));
    }
    
    @RequestMapping("hrypRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrypRecord hrypRecord = hrypRecordManager.get(id);
            model.addAttribute("model", hrypRecord);
        }

        return "hr/hrypRecord-info-input";
    }

    @RequestMapping("hrypRecord-info-save")
    public String save(@ModelAttribute HrypRecord hrypRecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrypRecord dest = null;

        Long id = hrypRecord.getFid();

        if (id != null) {
            dest = hrypRecordManager.get(id);
            beanMapper.copy(hrypRecord, dest);
        } else {
            dest = hrypRecord;
        }

        hrypRecordManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrypRecord-info-list.do";
    }

    @RequestMapping("hrypRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrypRecord> hrypRecords = hrypRecordManager.findByIds(selectedItem);

        hrypRecordManager.removeAll(hrypRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrypRecord-info-list.do";
    }

    @RequestMapping("hrypRecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrypRecordManager.pagedQuery(page, propertyFilters);

        List<HrypRecord> hrypRecords = (List<HrypRecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrypRecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrypRecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrypRecordManager(HrypRecordManager hrypRecordManager) {
        this.hrypRecordManager = hrypRecordManager;
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
