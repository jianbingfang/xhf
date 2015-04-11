package com.xthena.kh.web;

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
import com.xthena.kh.domain.KhJl;
import com.xthena.kh.manager.KhJlManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("kh")
public class KhJlController {
	private KhJlManager khJlManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("khJl-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam(value = "ftype", required = false) String ftype,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		parameterMap.put("filter_EQS_ftype", ftype);
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = khJlManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);
		if (ftype != null && ftype.equals("2")) {
			return "kh/khJl-jl-info-list";
		}
		return "kh/khJl-info-list";
	}

	@RequestMapping("khJl-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "ftype", required = false) String ftype,
			Model model) {
		if (id != null) {
			KhJl khJl = khJlManager.get(id);
			model.addAttribute("model", khJl);
		}
		if (ftype != null && ftype.equals("2")) {
			return "kh/khJl-jl-info-input";
		}
		return "kh/khJl-info-input";
	}

	@RequestMapping("khJl-info-save")
	public String save(@ModelAttribute KhJl khJl,
			@RequestParam Map<String, Object> parameterMap,
			@RequestParam(value = "ftype", required = false) String ftype,
			RedirectAttributes redirectAttributes) {
		KhJl dest = null;

		Long id = khJl.getFid();

		if (id != null) {
			dest = khJlManager.get(id);
			beanMapper.copy(khJl, dest);
		} else {
			dest = khJl;
		}
        dest.setFtype(ftype);
		khJlManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/kh/khJl-info-list.do?ftype=" + ftype;
	}

	@RequestMapping("khJl-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			@RequestParam(value = "ftype", required = false) String ftype,
			RedirectAttributes redirectAttributes) {
		List<KhJl> khJls = khJlManager.findByIds(selectedItem);

		khJlManager.removeAll(khJls);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/kh/khJl-info-list.do?ftype=" + ftype;
	}

	@RequestMapping("khJl-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam(value = "ftype", required = false) String ftype,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = khJlManager.pagedQuery(page, propertyFilters);

		List<KhJl> khJls = (List<KhJl>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("khJl info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(khJls);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setKhJlManager(KhJlManager khJlManager) {
		this.khJlManager = khJlManager;
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
