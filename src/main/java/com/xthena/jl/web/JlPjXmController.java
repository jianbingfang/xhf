package com.xthena.jl.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;

import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.util.CommRyMapUtil;
import com.xthena.util.SessionUtil;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.jl.manager.JlDeptManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlPjXmController {
	private PjXmManager pjXmManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@Autowired
	private JlDeptManager jlDeptManager;

	@RequestMapping("jl-pjXm-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = pjXmManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);

		return "jl/pjXm-info-list";
	}

	@RequestMapping("jl-pjXm-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			HttpServletRequest request, Model model) {
		PjXm pjXm = pjXmManager.get(jlDeptManager.getXmId(request));
		model.addAttribute("model", pjXm);

		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

		return "jl/pjXm-info-input";
	}

	@RequestMapping("jl-pjXm-info-view")
	public String view(@RequestParam(value = "id", required = false) Long id,
			HttpServletRequest request, Model model) {
		PjXm pjXm = pjXmManager.get(jlDeptManager.getXmId(request));

		model.addAttribute("model", pjXm);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

		return "jl/pjXm-info-view";
	}

	@RequestMapping("jl-pjXm-info-save")
	public String save(@ModelAttribute PjXm pjXm,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		PjXm dest = null;

		Long id = pjXm.getFid();

		if (id != null) {
			dest = pjXmManager.get(id);
			beanMapper.copy(pjXm, dest);
		} else {
			dest = pjXm;
		}

		pjXmManager.save(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:jl-pjXm-info-input.do?id="+dest.getFid();
	}

	@RequestMapping("jl-pjXm-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<PjXm> pjXms = pjXmManager.findByIds(selectedItem);

		pjXmManager.removeAll(pjXms);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "jl/pjXm-info-list";
	}

	@RequestMapping("jl-pjXm-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = pjXmManager.pagedQuery(page, propertyFilters);

		List<PjXm> pjXms = (List<PjXm>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("pjXm info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(pjXms);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setPjXmManager(PjXmManager pjXmManager) {
		this.pjXmManager = pjXmManager;
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
