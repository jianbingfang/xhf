package com.xthena.cw.web;

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
import com.xthena.cw.domain.CwXmhs;
import com.xthena.cw.manager.CwXmhsManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwXmhsController {
	private CwXmhsManager cwXmhsManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("cwXmhs-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam(value = "flistid", required = false) Long flistid,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		if (flistid != null && flistid != 0) {
			parameterMap.put("filter_EQL_flistid", flistid);
		}
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);

		page = cwXmhsManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);
		model.addAttribute("flistid",flistid);
		return "cw/cwXmhs-info-list";
	}

	@RequestMapping("cwXmhs-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CwXmhs cwXmhs = cwXmhsManager.get(id);
			model.addAttribute("model", cwXmhs);
		}

		return "cw/cwXmhs-info-input";
	}

	@RequestMapping("cwXmhs-info-save")
	public String save(@ModelAttribute CwXmhs cwXmhs,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwXmhs dest = null;

		Long id = cwXmhs.getFid();

		if (id != null) {
			dest = cwXmhsManager.get(id);
			beanMapper.copy(cwXmhs, dest);
		} else {
			dest = cwXmhs;
		}

		cwXmhsManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwXmhs-info-list.do";
	}

	@RequestMapping("cwXmhs-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwXmhs> cwXmhss = cwXmhsManager.findByIds(selectedItem);

		cwXmhsManager.removeAll(cwXmhss);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwXmhs-info-list.do";
	}

	@RequestMapping("cwXmhs-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwXmhsManager.pagedQuery(page, propertyFilters);

		List<CwXmhs> cwXmhss = (List<CwXmhs>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("cwXmhs info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(cwXmhss);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCwXmhsManager(CwXmhsManager cwXmhsManager) {
		this.cwXmhsManager = cwXmhsManager;
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
