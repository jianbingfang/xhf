package com.xthena.cw.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Field;
import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.xz.domain.WzList;
import com.xthena.xz.manager.WzListManager;
import com.xthena.cw.domain.CwZc;
import com.xthena.cw.manager.CwZcManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwZcController {
	private CwZcManager cwZcManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private WzListManager wzListManager;

	@RequestMapping("cwZc-info-list")
	public String list(@ModelAttribute Page page, @ModelAttribute String state,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		String fstatus = "";
		if (parameterMap.get("fstatus") != null) {
			parameterMap.put("filter_EQS_fsystate", parameterMap.get("fstatus"));
			 fstatus = parameterMap.get("fstatus").toString();
		}

		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = wzListManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);
		model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
		if (parameterMap.get("fstatus") != null && fstatus.equals("2")) {
			return "cw/cwZcql-info-list";
		} else {
			return "cw/cwZc-info-list";
		}
	}

	@RequestMapping("cwZc-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "fstatus", required = false) String fstatus,
			Model model) {
		if (id != null) {
			WzList wzList = wzListManager.get(id);
			model.addAttribute("model", wzList);
		}

		model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		if (fstatus!=null && fstatus.equals("2")) {
			return "cw/cwZcql-info-input";
		} else {
			return "cw/cwZc-info-input";
		}
	}

	@RequestMapping("cwZc-info-save")
	public String save(@ModelAttribute WzList cwZc,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		WzList dest = null;

		Long id = cwZc.getFid();

		if (id != null) {
			dest = wzListManager.get(id);
			beanMapper.copy(cwZc, dest);
		} else {
			dest = cwZc;
		}

		wzListManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");
       if(dest.getFsystate().equals("2")){
    	   return "redirect:/cw/cwZc-info-list.do?fstatus=2";
       }
		return "redirect:/cw/cwZc-info-list.do";
	}

	@RequestMapping("cwZc-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<WzList> cwZcs = wzListManager.findByIds(selectedItem);

		wzListManager.removeAll(cwZcs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwZc-info-list.do";
	}

	@RequestMapping("cwZc-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwZcManager.pagedQuery(page, propertyFilters);

		List<WzList> cwZcs = (List<WzList>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("cwZc info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(cwZcs);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCwZcManager(CwZcManager cwZcManager) {
		this.cwZcManager = cwZcManager;
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
