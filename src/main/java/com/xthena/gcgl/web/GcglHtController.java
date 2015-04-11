package com.xthena.gcgl.web;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.HtMapUtil;
import com.xthena.util.JyXmMapUtil;
import com.xthena.util.PjXmMapUtil;

@Controller
@RequestMapping("gcgl")
public class GcglHtController {
	private CommHtManager commHtManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	
	@RequestMapping("gcgl-commHt-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		parameterMap.put("filter_EQS_fqiandingstatus", "5");
		parameterMap.put("filter_EQS_fisf", "0");
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = commHtManager.pagedQuery(page, propertyFilters);

		// 去除科学计数法
		ArrayList<CommHt> arr = (ArrayList<CommHt>) page.getResult();
		for (CommHt ht : arr) {
			Double ztz = ht.getFjianlifei();
			if (ztz != null) {
				NumberFormat nf = java.text.NumberFormat.getInstance();
				nf.setGroupingUsed(false);
				String a = nf.format(ztz);
				ht.setFmemo1(a);
			}
		}

		model.addAttribute("jyxmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("page", page);

		return "gcgl/commHt-info-list";
	}

	
  @RequestMapping("gcgl-commHt-info-inputFromTask")
    public String inputFromTask(@RequestParam(value = "taskId", required = false) String taskId,
            Model model) {
        model.addAttribute("model", commHtManager.loadBzj(taskId));
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	model.addAttribute("taskId", taskId);

        return "gcgl/commHt-info-inputFromTask";
    }
	    

    @RequestMapping("gcgl-commHt-info-saveForTask")
    public String saveForTask(@ModelAttribute CommHt commHt,@RequestParam(value = "taskId", required = false) String taskId,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        
    	commHt.setFgcbstatus("已确认");
        commHtManager.dealBzj(commHt, taskId);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/gcgl-commHt-info-list.do";
    }
	    

	@RequestMapping("gcgl-commHt-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CommHt commHt = commHtManager.get(id);
			model.addAttribute("model", commHt);
		}
		model.addAttribute("jyxmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		 model.addAttribute("htMap", HtMapUtil.getHtMap());
		return "gcgl/commHt-info-input";
	}

	@RequestMapping("gcgl-commHt-info-save")
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

		commHtManager.mysave(dest);
		HtMapUtil.refreshHtMap(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/gcgl/gcgl-commHt-info-list.do";
	}

	@RequestMapping("gcgl-commHt-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CommHt> commHts = commHtManager.findByIds(selectedItem);

		commHtManager.removeAll(commHts);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/gcgl/gcgl-commHt-info-list.do";
	}

	@RequestMapping("gcgl-commHt-info-export")
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
