package com.xthena.xz.web;

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
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.util.PjXmMapUtil;
import com.xthena.xz.domain.XzChufa;
import com.xthena.xz.manager.XzChufaManager;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzChufaController {
	private XzChufaManager xzChufaManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private PjXmManager pjxmManager;

	@RequestMapping("xzChufa-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
        page = xzChufaManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);
		model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
		return "xz/xzChufa-info-list";
	}

	@RequestMapping("xzChufa-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			XzChufa xzChufa = xzChufaManager.get(id);
			model.addAttribute("model", xzChufa);
		}
		model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
		return "xz/xzChufa-info-input";
	}

	@RequestMapping("xzChufa-info-save")
	public String save(@ModelAttribute XzChufa xzChufa,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		XzChufa dest = null;

		Long id = xzChufa.getFid();

		if (id != null) {
			dest = xzChufaManager.get(id);
			beanMapper.copy(xzChufa, dest);
		} else {
			dest = xzChufa;
		}

		xzChufaManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/xz/xzChufa-info-list.do";
	}

	@RequestMapping("xzChufa-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<XzChufa> xzChufas = xzChufaManager.findByIds(selectedItem);

		xzChufaManager.removeAll(xzChufas);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzChufa-info-list.do";
	}

	@RequestMapping("xzChufa-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzChufaManager.pagedQuery(page, propertyFilters);

		List<XzChufa> xzChufas = (List<XzChufa>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("xzChufa info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(xzChufas);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setXzChufaManager(XzChufaManager xzChufaManager) {
		this.xzChufaManager = xzChufaManager;
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
