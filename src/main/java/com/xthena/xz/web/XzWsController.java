package com.xthena.xz.web;

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
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.xz.domain.XzWs;
import com.xthena.xz.manager.XzWsManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzWsController {
	private XzWsManager xzWsManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private OrgDepartmentManager orgDepartmentManager;

	@RequestMapping("xzWs-info-list")
	public String list(@ModelAttribute Page page,@RequestParam(value = "ftype", required = false) String ftype,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		parameterMap.put("filter_LIKES_ftype", ftype);
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzWsManager.pagedQuery(page, propertyFilters);
        model.addAttribute("ftype",ftype);
		model.addAttribute("page", page);
		model.addAttribute("deptList", orgDepartmentManager.getAll());
		return "xz/xzWs-info-list";
	}

	@RequestMapping("xzWs-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ftype", required = false) String ftype,
			Model model) {
		if (id != null) {
			XzWs xzWs = xzWsManager.get(id);
			model.addAttribute("model", xzWs);
		}
		  model.addAttribute("ftype",ftype);
		model.addAttribute("deptList", orgDepartmentManager.getAll());
		return "xz/xzWs-info-input";
	}

	@RequestMapping("xzWs-info-save")
	public String save(@ModelAttribute XzWs xzWs,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		XzWs dest = null;
		Long id = xzWs.getFid();
		if (id != null) {
			dest = xzWsManager.get(id);
			beanMapper.copy(xzWs, dest);
		} else {
			dest = xzWs;
		}

		xzWsManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/xz/xzWs-info-list.do?ftype="+dest.getFtype();
	}

	@RequestMapping("xzWs-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,@RequestParam(value = "ftype", required = false) String ftype,
			RedirectAttributes redirectAttributes) {
		List<XzWs> xzWss = xzWsManager.findByIds(selectedItem);

		xzWsManager.removeAll(xzWss);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzWs-info-list.do?ftype="+ftype;
	}

	@RequestMapping("xzWs-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzWsManager.pagedQuery(page, propertyFilters);

		List<XzWs> xzWss = (List<XzWs>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("xzWs info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(xzWss);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setXzWsManager(XzWsManager xzWsManager) {
		this.xzWsManager = xzWsManager;
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
