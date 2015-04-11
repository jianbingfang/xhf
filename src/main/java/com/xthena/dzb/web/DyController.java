package com.xthena.dzb.web;

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
import com.xthena.dzb.domain.Dy;
import com.xthena.dzb.manager.DyManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("dzb")
public class DyController {
	private DyManager dyManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("dy-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam(value = "ftype", required = false) String ftype,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		if (ftype != null) {
			parameterMap.put("filter_EQS_ftype", ftype);
		}
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = dyManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);
		if (ftype != null && ftype.equals("3") ) {
			return "dzb/dy-jjfz-info-list";
		}
		return "dzb/dy-info-list";
	}

	@RequestMapping("dy-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "ftype", required = false) String ftype,
			Model model) {
		if (id != null) {
			Dy dy = dyManager.get(id);
			model.addAttribute("model", dy);
		}
		if (ftype != null && ftype.equals("3") ) {
			return "dzb/dy-jjfz-info-input";
		}
		return "dzb/dy-info-input";
	}

	@RequestMapping("dy-info-save")
	public String save(@ModelAttribute Dy dy,
			@RequestParam(value = "ftype", required = false) String ftype,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		Dy dest = null;

		Long id = dy.getFid();

		if (id != null) {
			dest = dyManager.get(id);
			beanMapper.copy(dy, dest);
		} else {
			dest = dy;
		}
		dest.setFtype(ftype);
		dyManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/dzb/dy-info-list.do?ftype="+ ftype;
	}

	@RequestMapping("dy-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			@RequestParam(value = "ftype", required = false) Long ftype,
			RedirectAttributes redirectAttributes) {
		List<Dy> dys = dyManager.findByIds(selectedItem);

		dyManager.removeAll(dys);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/dzb/dy-info-list.do?ftype=" + ftype;
	}

	@RequestMapping("dy-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = dyManager.pagedQuery(page, propertyFilters);

		List<Dy> dys = (List<Dy>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("dy info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(dys);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setDyManager(DyManager dyManager) {
		this.dyManager = dyManager;
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
