package com.xthena.xz.web;

import java.util.HashMap;
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
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCommHtController {
	private CommHtManager commHtManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private CommRyManager ryManager;

	@RequestMapping("xz-commHt-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		
		//*******************start 按总监查询合同
		Object zjname = parameterMap.get("filter_LIKES_fzongjianname");
		if (zjname != null && !zjname.equals("")) {
			String zj  = zjname.toString();
			Map<String, Object> ryparameterMap = new HashMap<String, Object>();
			ryparameterMap.put("filter_LIKES_fname", zj);
			List<PropertyFilter> rypropertyFilters = PropertyFilter
					.buildFromMap(ryparameterMap);
			List<CommRy> rys = ryManager.find(rypropertyFilters);
			if (rys.size() > 0) {
				parameterMap.put("filter_EQL_fzongjian", rys.get(0).getFid());
			}else
			{
				parameterMap.put("filter_EQL_fzongjian", 0);
			}
		}
		parameterMap.remove("filter_LIKES_fzongjianname");
		//**********************end 按总监查询合同
		page.setOrderBy("fhetongno");
		parameterMap.put("filter_EQS_fqiandingstatus", 5);
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = commHtManager.pagedQuery(page, propertyFilters);
		
		model.addAttribute("page", page);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

		return "xz/commHt-info-list";
	}

	
  @RequestMapping("xz-commHt-info-inputFromTask")
    public String inputFromTask(@RequestParam(value = "taskId", required = false) String taskId,
            Model model) {
        model.addAttribute("model", commHtManager.loadBzj(taskId));
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	model.addAttribute("taskId", taskId);

        return "xz/commHt-info-inputFromTask";
    }
	    

    @RequestMapping("xz-commHt-info-saveForTask")
    public String saveForTask(@ModelAttribute CommHt commHt,@RequestParam(value = "taskId", required = false) String taskId,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        
    	commHt.setFbgsstatus("已确认");
        commHtManager.dealBzj(commHt, taskId);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xz-commHt-info-list.do";
    }
	    
	@RequestMapping("xz-commHt-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CommHt commHt = commHtManager.get(id);
			model.addAttribute("model", commHt);
		}
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

		return "xz/commHt-info-input";
	}

	@RequestMapping("xz-commHt-info-save")
	public String save(@ModelAttribute CommHt commHt,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CommHt dest = null;

		Long id = commHt.getFid();

		if (id != null) {
			dest = commHtManager.get(id);
			beanMapper.copy(commHt, dest);
		} else {
			dest = commHt;
		}
		dest.setFisf("1");
		commHtManager.mysave(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/xz/xz-commHt-info-list.do";
	}

	@RequestMapping("xz-commHt-info-saveinput")
    public String saveinput(@ModelAttribute CommHt commHt,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommHt dest = null;

        Long id = commHt.getFid();

        if (id != null) {
            dest = commHtManager.get(id);
            beanMapper.copy(commHt, dest);
        } else {
            dest = commHt;
        }
        
        dest.setFisf("1");
        dest.setFqiandingstatus("5");
        commHtManager.mysave(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "xz/commHt-info-input";
    }
	
	@RequestMapping("xz-commHt-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CommHt> commHts = commHtManager.findByIds(selectedItem);
		commHtManager.removeAll(commHts);
		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");
		return "redirect:/xz/xz-commHt-info-list.do";
	}

	@RequestMapping("xz-commHt-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = commHtManager.pagedQuery(page, propertyFilters);

		List<CommHt> commHts = (List<CommHt>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("commHt info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(commHts);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCommHtManager(CommHtManager commHtManager) {
		this.commHtManager = commHtManager;
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
