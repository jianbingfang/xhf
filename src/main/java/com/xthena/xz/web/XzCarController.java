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
import com.xthena.util.JsonResponseUtil;
import com.xthena.xz.domain.XzCar;
import com.xthena.xz.manager.XzCarManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCarController {
	private XzCarManager xzCarManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("xzCar-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page.setOrderBy("fmemo1");
		page = xzCarManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);

		return "xz/xzCar-info-list";
	}

	@RequestMapping("xzCar-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "fcarid", required = false) Long fcarid,
			Model model) {
		if (id != null) {
			XzCar xzCar = xzCarManager.get(id);
			model.addAttribute("model", xzCar);
		}
		if (fcarid != null) {
			XzCar xzCar = new XzCar();
			xzCar.setFid(fcarid);
			model.addAttribute("model", xzCar);
		}

		return "xz/xzCar-info-input";
	}

	@RequestMapping("xzCar-simple-list")
	public void listBm(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) {

		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzCarManager.pagedQuery(page, propertyFilters);
		JsonResponseUtil.write(response, page);

	}

	@RequestMapping("xzCar-info-save")
	public String save(@ModelAttribute XzCar xzCar,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		XzCar dest = null;

		Long id = xzCar.getFid();

		if (id != null) {
			dest = xzCarManager.get(id);
			beanMapper.copy(xzCar, dest);
		} else {
			dest = xzCar;
		}

		xzCarManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/xz/xzCar-info-list.do";
	}

	@RequestMapping("xzCar-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<XzCar> xzCars = xzCarManager.findByIds(selectedItem);

		xzCarManager.removeAll(xzCars);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzCar-info-list.do";
	}

	@RequestMapping("xzCar-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzCarManager.pagedQuery(page, propertyFilters);

		List<XzCar> xzCars = (List<XzCar>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("xzCar info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(xzCars);
		exportor.export(response, tableModel);
	}

	@RequestMapping("xzCar-cost-list")
	public String costList(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response, Model model) throws Exception {
		page.setResult(xzCarManager.getCarCost());
		model.addAttribute("page", page);

		return "xz/xzCar-cost-list";
	}

	// ~ ======================================================================
	@Resource
	public void setXzCarManager(XzCarManager xzCarManager) {
		this.xzCarManager = xzCarManager;
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
