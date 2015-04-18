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
import com.xthena.util.HtMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.cw.domain.CwCb;
import com.xthena.cw.manager.CwCbManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwCbController {
	private CwCbManager cwcbManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("cwcb-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
		StringBuffer hql=new StringBuffer("select cb from CommHt xm,CwCb cb  where xm.fid=cb.fxmid");
		
		if(parameterMap.get("filter_LIKES_fprojectname") != null)
		{
			hql.append(" and xm.fhtname like '%"+parameterMap.get("filter_LIKES_fprojectname") +"%' ");
		}
		
		hql.append(" order by xm.fhtname");

		parameterMap.clear();
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwcbManager.pagedQuery(hql.toString(), page, propertyFilters);
	/*	List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwcbManager.pagedQuery(page, propertyFilters);*/

		model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		return "cw/cwcb-info-list";
	}

	@RequestMapping("cwcb-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CwCb cwcb = cwcbManager.get(id);
			model.addAttribute("model", cwcb);
		}
		model.addAttribute("htMap",HtMapUtil.getHtMap());
		return "cw/cwcb-info-input";
	}

	@RequestMapping("cwcb-info-save")
	public String save(@ModelAttribute CwCb cwcb,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwCb dest = null;

		Long id = cwcb.getFid();

		if (id != null) {
			dest = cwcbManager.get(id);
			beanMapper.copy(cwcb, dest);
		} else {
			dest = cwcb;
		}

		cwcbManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwcb-info-list.do";
	}

	@RequestMapping("cwcb-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwCb> cwcbs = cwcbManager.findByIds(selectedItem);

		cwcbManager.removeAll(cwcbs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwcb-info-list.do";
	}

	@RequestMapping("cwcb-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwcbManager.pagedQuery(page, propertyFilters);

		List<CwCb> cwcbs = (List<CwCb>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("cwcb info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(cwcbs);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCwCbManager(CwCbManager cwcbManager) {
		this.cwcbManager = cwcbManager;
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
