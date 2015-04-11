package com.xthena.xz.web;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.xz.domain.XzJgysbg;
import com.xthena.xz.manager.XzJgysbgManager;
import com.xthena.xz.manager.XzZjDxlistManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("xz")
public class XzJgysbgController {
	private XzJgysbgManager xzJgysbgManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
@Autowired
	private CommRyManager ryManager;
	
	
	@RequestMapping("xzJgysbg-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		//*******************start 按总监查询
		Object zjname = parameterMap.get("filter_LIKES_fzongjianname");
		if (zjname != null && !zjname.equals("")) {
			String zj  = zjname.toString();
			Map<String, Object> ryparameterMap = new HashMap<String, Object>();
			ryparameterMap.put("filter_LIKES_fname", zj);
			List<PropertyFilter> rypropertyFilters = PropertyFilter
					.buildFromMap(ryparameterMap);
			List<CommRy> rys = ryManager.find(rypropertyFilters);
			if (rys.size() > 0) {
				parameterMap.put("filter_EQL_fzongjian", rys.get(0).getFid());
			}else
			{
				parameterMap.put("filter_EQL_fzongjian", 0);
			}
		}
		parameterMap.remove("filter_LIKES_fzongjianname");
		//**********************end 按总监查询
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page.setOrderBy("fcode");
		page = xzJgysbgManager.pagedQuery(page, propertyFilters);
		
		//去除科学计数法
		ArrayList<XzJgysbg> arr = (ArrayList<XzJgysbg>) page.getResult();
		for (XzJgysbg xzJgysbg : arr) {
			Double ztz = xzJgysbg.getFztz();
			if (ztz != null) {
				NumberFormat nf = java.text.NumberFormat.getInstance();   
		        nf.setGroupingUsed(false);
				String a = nf.format(ztz);
				xzJgysbg.setFmemo1(a);
			}
		}
		
		model.addAttribute("page", page);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "xz/xzJgysbg-info-list";
	}

	@RequestMapping("xzJgysbg-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			XzJgysbg xzJgysbg = xzJgysbgManager.get(id);
			if (xzJgysbg.getFztz() != null) {
				NumberFormat nf = java.text.NumberFormat.getInstance();   
		        nf.setGroupingUsed(false);
				String a = nf.format(xzJgysbg.getFztz());
				xzJgysbg.setFmemo1(a);
			}
			model.addAttribute("model", xzJgysbg);
		}
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "xz/xzJgysbg-info-input";
	}

	@RequestMapping("xzJgysbg-info-save")
	public String save(@ModelAttribute XzJgysbg xzJgysbg,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		XzJgysbg dest = null;

		Long id = xzJgysbg.getFid();

		if (id != null) {
			dest = xzJgysbgManager.get(id);
			beanMapper.copy(xzJgysbg, dest);
		} else {
			dest = xzJgysbg;
		}

		xzJgysbgManager.mysave(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/xz/xzJgysbg-info-list.do";
	}

	@RequestMapping("xzJgysbg-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<XzJgysbg> xzJgysbgs = xzJgysbgManager.findByIds(selectedItem);

		xzJgysbgManager.removeAll(xzJgysbgs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzJgysbg-info-list.do";
	}

	@RequestMapping("xzJgysbg-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzJgysbgManager.pagedQuery(page, propertyFilters);

		List<XzJgysbg> xzJgysbgs = (List<XzJgysbg>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("xzJgysbg info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(xzJgysbgs);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setXzJgysbgManager(XzJgysbgManager xzJgysbgManager) {
		this.xzJgysbgManager = xzJgysbgManager;
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
