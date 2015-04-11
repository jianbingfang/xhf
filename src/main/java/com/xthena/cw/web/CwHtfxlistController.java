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
import com.xthena.sckf.domain.CommHt;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.HtMapUtil;
import com.xthena.cw.domain.CwHtFx;
import com.xthena.cw.domain.CwHtfxlist;
import com.xthena.cw.domain.CwYingShou;
import com.xthena.cw.manager.CwHtfxManager;
import com.xthena.cw.manager.CwHtfxlistManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwHtfxlistController {
	private CwHtfxlistManager cwHtfxlistManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private CwHtfxManager cwhtfxManager;

	@RequestMapping("cwHtfxlist-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwHtfxlistManager.pagedQuery(page, propertyFilters);
		model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		return "cw/cwHtfxlist-info-list";
	}

	@RequestMapping("cwHtfxlist-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CwHtfxlist cwHtfxlist = cwHtfxlistManager.get(id);
			model.addAttribute("model", cwHtfxlist);
		}
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		return "cw/cwHtfxlist-info-input";
	}

	@RequestMapping("cwHtfxlist-info-save")
	public String save(@ModelAttribute CwHtfxlist cwHtfxlist,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwHtfxlist dest = null;

		Long id = cwHtfxlist.getFid();

		if (id != null) {
			dest = cwHtfxlistManager.get(id);
			beanMapper.copy(cwHtfxlist, dest);
		} else {
			dest = cwHtfxlist;
		}

		cwHtfxlistManager.save(dest);
		cwhtfxManager.newList(dest, redirectAttributes);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwHtfxlist-info-list.do";
	}

	@RequestMapping("cwHtfxlist-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwHtfxlist> cwHtfxlists = cwHtfxlistManager
				.findByIds(selectedItem);
		//先删子类
		for (CwHtfxlist fxlist : cwHtfxlists) {
			cwhtfxManager.removeList(fxlist.getFid(), redirectAttributes);
		}
		cwHtfxlistManager.removeAll(cwHtfxlists);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwHtfxlist-info-list.do";
	}

	@RequestMapping("cwHtfxlist-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwHtfxlistManager.pagedQuery(page, propertyFilters);

		List<CwHtfxlist> cwHtfxlists = (List<CwHtfxlist>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("cwHtfxlist info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(cwHtfxlists);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCwHtfxlistManager(CwHtfxlistManager cwHtfxlistManager) {
		this.cwHtfxlistManager = cwHtfxlistManager;
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
