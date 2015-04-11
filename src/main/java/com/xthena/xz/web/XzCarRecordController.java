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

import com.xthena.xz.domain.XzCarRecord;
import com.xthena.xz.manager.XzCarManager;
import com.xthena.xz.manager.XzCarRecordManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCarRecordController {
	@Autowired
	private XzCarManager xCarManager;
	private XzCarRecordManager xzCarRecordManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("xzCarRecord-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		if (parameterMap.get("fcarid") != null
				&& parameterMap.get("fcarid") != "") {
			parameterMap.put("filter_EQL_fcarid", parameterMap.get("fcarid"));
		}
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzCarRecordManager.pagedQuery(page, propertyFilters);

		List<XzCarRecord> xzCarRecords = (List<XzCarRecord>) page.getResult();
		for (XzCarRecord xzCarRecord : xzCarRecords) {
			xzCarRecord.setFmemo1(xCarManager.get(xzCarRecord.getFcarid())
					.getFcarno());
		}
		model.addAttribute("fcarid", parameterMap.get("fcarid"));
		model.addAttribute("page", page);
		return "xz/xzCarRecord-info-list";
	}

	@RequestMapping("xzCarRecord-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "fcarid", required = false) Long fcarid,
			Model model) {

		if (id != null) {
			XzCarRecord xzCarRecord = xzCarRecordManager.get(id);
			model.addAttribute("model", xzCarRecord);
			model.addAttribute("fcarno",
					xCarManager.get(xzCarRecord.getFcarid()).getFcarno());
		} else if (fcarid != null) {
			XzCarRecord xzCarRecord = new XzCarRecord();
			xzCarRecord.setFcarid(fcarid);
			model.addAttribute("model", xzCarRecord);
			model.addAttribute("fcarno",
					xCarManager.get(fcarid).getFcarno());
		}
		model.addAttribute("fcarid", fcarid);
		return "xz/xzCarRecord-info-input";
	}

	@RequestMapping("xzCarRecord-info-save")
	public String save(@ModelAttribute XzCarRecord xzCarRecord,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		XzCarRecord dest = null;

		Long id = xzCarRecord.getFid();

		if (id != null) {
			dest = xzCarRecordManager.get(id);
			beanMapper.copy(xzCarRecord, dest);
		} else {
			dest = xzCarRecord;
		}

		//xzCarRecordManager.saveAndUpdeCar(dest);
		xzCarRecordManager.save(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/xz/xzCarRecord-info-list.do";
	}

	@RequestMapping("xzCarRecord-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<XzCarRecord> xzCarRecords = xzCarRecordManager
				.findByIds(selectedItem);

		xzCarRecordManager.removeAll(xzCarRecords);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzCarRecord-info-list.do";
	}

	@RequestMapping("xzCarRecord-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzCarRecordManager.pagedQuery(page, propertyFilters);

		List<XzCarRecord> xzCarRecords = (List<XzCarRecord>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("xzCarRecord info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(xzCarRecords);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setXzCarRecordManager(XzCarRecordManager xzCarRecordManager) {
		this.xzCarRecordManager = xzCarRecordManager;
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
