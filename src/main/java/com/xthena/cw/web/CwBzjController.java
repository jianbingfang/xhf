package com.xthena.cw.web;

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
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.HtMapUtil;
import com.xthena.util.JyXmMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.cw.domain.CwBzj;
import com.xthena.cw.manager.CwBzjManager;

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
public class CwBzjController {
	private CwBzjManager cwBzjManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@Autowired
	private CommHtManager htManager;

	@RequestMapping("cwBzj-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
		StringBuffer hql = new StringBuffer(
				"select bzj from CommHt xm,CwBzj bzj  where xm.fid=bzj.fxmid");
//		if (type != null) {
//			hql.append(" and bzj.fbzjtype='" + type + "'");
//		}
		if (parameterMap.get("filter_LIKES_fprojectname") != null) {
			hql.append(" and xm.fhtname like '%"
					+ parameterMap.get("filter_LIKES_fprojectname") + "%' ");
		}
		//hql.append(" order by  xm.fhtname");

		parameterMap.remove("filter_LIKES_fprojectname");
		parameterMap.put("filter_EQL_fbzjtype", type);
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwBzjManager.pagedQuery(hql.toString(),page, propertyFilters);

		model.addAttribute("type", type);
		model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		if (type.equals("3")) {
			return "cw/cwYwx-info-list";
		}
		if (type.equals("4")) {
			return "cw/cwTc-info-list";
		}
		return "cw/cwBzj-info-list";
	}
	
	
	
	@RequestMapping("cwBzj-info-tblist")
	public String lylist(@ModelAttribute Page page,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
		StringBuffer hql = new StringBuffer(
				"select bzj from JyXm xm,CwBzj bzj  where xm.fid=bzj.fxmid and bzj.fmemo4='财务已通过'");
//		if (type != null) {
//			hql.append(" and bzj.fbzjtype='" + type + "'");
//		}
		if (parameterMap.get("filter_LIKES_fprojectname") != null) {
			hql.append(" and xm.fname like '%"
					+ parameterMap.get("filter_LIKES_fprojectname") + "%' ");
		}
		//hql.append(" order by  xm.fhtname");

		parameterMap.remove("filter_LIKES_fprojectname");
		parameterMap.put("filter_EQL_fbzjtype", type);
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwBzjManager.pagedQuery(hql.toString(),page, propertyFilters);

		model.addAttribute("type", type);
		model.addAttribute("page", page);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "cw/cwBzj-info-tblist";
	}
	
	

	@RequestMapping("cwBzj-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "type", required = false) String type,
			Model model) {
		if (id != null) {
			CwBzj cwBzj = cwBzjManager.get(id);
			model.addAttribute("model", cwBzj);
		}
		model.addAttribute("type", type);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		if (type.equals("3")) {
			return "cw/cwYwx-info-input";
		}
		if (type.equals("4")) {
			return "cw/cwTc-info-input";
		}
		return "cw/cwBzj-info-input";
	}
	
	
	@RequestMapping("cwBzj-info-tbinput")
	public String tbinput(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "type", required = false) String type,
			Model model) {
		if (id != null) {
			CwBzj cwBzj = cwBzjManager.get(id);
			model.addAttribute("model", cwBzj);
		}
		model.addAttribute("type", type);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "cw/cwBzj-info-tbinput";
	}
	
	
	@RequestMapping("cwBzj-info-tbsave")
	public String tbsave(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwBzj dest = null;
		Long id = cwBzj.getFid();
		if (id != null) {
			dest = cwBzjManager.get(id);
			beanMapper.copy(cwBzj, dest);
		} else {
			dest = cwBzj;
		}
		cwBzjManager.save(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");
		return "redirect:/cw/cwBzj-info-tblist.do?type=" + dest.getFbzjtype();
	}
	
	
	@RequestMapping("cwBzj-info-zhuanzhang")
	public String shenpi(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,@RequestParam(value = "taskId", required = false) String taskId,
			RedirectAttributes redirectAttributes) {
		
		if(cwBzj.getFstatus().equals("通过")){
			cwBzj.setFmemo4("财务已通过");
		}else{
			cwBzj.setFmemo4("财务已拒绝");
		}
		
		//同时发起流程
		cwBzjManager.dealBzj(cwBzj, taskId);

		 return "redirect:/dashboard/dashboard.do";
	}
	
	

	@RequestMapping("cwBzj-info-loadForzhuanz")
	public String loadForShenpi(Model model,@RequestParam(value = "taskId", required = false) String taskId) {
		
		//同时发起流程
		model.addAttribute("model",cwBzjManager.loadBzj(taskId));
		model.addAttribute("taskId",taskId);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "cw/cwBzj-info-input-loadForZhuanz";
	}
	
	

	@RequestMapping("cwBzj-info-save")
	public String save(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwBzj dest = null;
		Long id = cwBzj.getFid();
		if (id != null) {
			dest = cwBzjManager.get(id);
			beanMapper.copy(cwBzj, dest);
		} else {
			dest = cwBzj;
		}
		cwBzjManager.save(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwBzj-info-list.do?type=" + dest.getFbzjtype();
	}

	@RequestMapping("cwBzj-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,@RequestParam(value = "type", required = false) String type,
			RedirectAttributes redirectAttributes) {
		List<CwBzj> cwBzjs = cwBzjManager.findByIds(selectedItem);

		cwBzjManager.removeAll(cwBzjs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwBzj-info-list.do?type="+cwBzjs.get(0).getFbzjtype();
	}

	@RequestMapping("cwBzj-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwBzjManager.pagedQuery(page, propertyFilters);

		List<CwBzj> cwBzjs = (List<CwBzj>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("cwBzj info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(cwBzjs);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCwBzjManager(CwBzjManager cwBzjManager) {
		this.cwBzjManager = cwBzjManager;
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
