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
import com.xthena.cw.domain.CwHtFx;
import com.xthena.cw.manager.CwHtfxManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwHtfxController {
	private CwHtfxManager cwHtfxManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("cwHtfx-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam(value = "id", required = false) Long id,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		if (id != null && id != 0) {
			parameterMap.put("filter_EQL_flistid", id);
			model.addAttribute("filter_EQL_flistid",id);
		}
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwHtfxManager.pagedQuery(page, propertyFilters);
		model.addAttribute("page", page);
		model.addAttribute("filter_EQL_flistid",parameterMap.get("filter_EQL_flistid"));
		return "cw/cwHtfx-info-list";
	}

	@RequestMapping("cwHtfx-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CwHtFx cwHtfx = cwHtfxManager.get(id);
			model.addAttribute("model", cwHtfx);
		}
		return "cw/cwHtfx-info-input";
	}

	@RequestMapping("cwHtfx-info-save")
	public String save(@ModelAttribute CwHtFx cwHtfx,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwHtFx dest = null;
		Long id = cwHtfx.getFid();
		if (id != null) {
			dest = cwHtfxManager.get(id);
			beanMapper.copy(cwHtfx, dest);
		} else {
			dest = cwHtfx;
		}
		cwHtfxManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwHtfx-info-list.do";
	}

	@RequestMapping("cwHtfx-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwHtFx> cwHtfxs = cwHtfxManager.findByIds(selectedItem);

		cwHtfxManager.removeAll(cwHtfxs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwHtfx-info-list.do";
	}

	@RequestMapping("cwHtfx-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwHtfxManager.pagedQuery(page, propertyFilters);

		List<CwHtFx> cwHtfxs = (List<CwHtFx>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("cwHtfx info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(cwHtfxs);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCwHtfxManager(CwHtfxManager cwHtfxManager) {
		this.cwHtfxManager = cwHtfxManager;
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
