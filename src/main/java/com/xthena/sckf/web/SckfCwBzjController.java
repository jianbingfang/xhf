package com.xthena.sckf.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;
import com.xthena.api.user.UserDTO;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.user.persistence.domain.UserBase;
import com.xthena.user.persistence.manager.UserBaseManager;
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
@RequestMapping("sckf")
public class SckfCwBzjController {
	private CwBzjManager cwBzjManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	
	@Autowired
	private UserBaseManager userBaseManager;
	
	@Autowired
	private CommHtManager commHtManager;
	
	
	@RequestMapping("sckf-cwBzj-info-list-hs")
	public String lisths(@ModelAttribute Page page,@RequestParam(value = "type", required = false) String type,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
			StringBuffer hql=new StringBuffer("select bzj from JyXm xm,CwBzj bzj where xm.fid=bzj.fxmid and bzj.fmemo4='财务已通过'");
			if(type !=null){
				hql.append(" and bzj.fbzjtype='"+type+"'");
			}
			if(parameterMap.get("filter_LIKES_name") != null)
			{
				hql.append(" and xm.fname like '%"+parameterMap.get("filter_LIKES_name") +"%' ");
			}
			hql.append(" order by  xm.fname");

			parameterMap.clear();
			List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
			page = cwBzjManager.pagedQuery(hql.toString(), page, propertyFilters);
			
			HashMap<Long, CommHt> htMap=new HashMap<Long, CommHt>();
			
			for(CwBzj cwBzj:(List<CwBzj>)page.getResult()){
				htMap.put(cwBzj.getFid(), commHtManager.findUniqueBy("fxmid", cwBzj.getFid()));
			}
		model.addAttribute("type", type);
		model.addAttribute("page", page);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("htMap", htMap);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-list-hs";
	}

	@RequestMapping("sckf-cwBzj-info-input-hs")
	public String inpuths(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
			@RequestParam(value = "type", required = false) String type,
			Model model) {
		if (id != null) {
			CwBzj cwBzj = cwBzjManager.get(id);
			model.addAttribute("model", cwBzj);
		}else if(xmid!=null){
			CwBzj cwBzj =new CwBzj();
			cwBzj.setFxmid(xmid);
			model.addAttribute("model", cwBzj);
		}
		
		model.addAttribute("type", type);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-input-hs";
	}

	@RequestMapping("sckf-cwBzj-info-save-hs")
	public String savehs(@ModelAttribute CwBzj cwBzj,
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

		//同时发起流程
		cwBzjManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/sckf/sckf-cwBzj-info-list-hs.do?type=" + dest.getFbzjtype();
	}
	
	
	
	@RequestMapping("sckf-cwBzj-info-list")
	public String list(@ModelAttribute Page page,@RequestParam(value = "type", required = false) String type,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
		StringBuffer hql=new StringBuffer("select bzj from JyXm xm,CwBzj bzj  where xm.fid=bzj.fxmid");
		if(type !=null){
			hql.append(" and bzj.fbzjtype='"+type+"'");
		}
		if(parameterMap.get("filter_LIKES_name") != null)
		{
			hql.append(" and xm.fname like '%"+parameterMap.get("filter_LIKES_name") +"%' ");
		}
		hql.append(" order by  xm.fname");

		parameterMap.clear();
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwBzjManager.pagedQuery(hql.toString(), page, propertyFilters);
				
		model.addAttribute("type", type);
		model.addAttribute("page", page);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-list";
	}

	@RequestMapping("sckf-cwBzj-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
			@RequestParam(value = "type", required = false) String type,
			Model model) {
		if (id != null) {
			CwBzj cwBzj = cwBzjManager.get(id);
			model.addAttribute("model", cwBzj);
		}else if(xmid!=null){
			CwBzj cwBzj =new CwBzj();
			cwBzj.setFxmid(xmid);
			model.addAttribute("model", cwBzj);
		}
		
		model.addAttribute("type", type);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-input";
	}

	@RequestMapping("sckf-cwBzj-info-save")
	public String save(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwBzj dest = null;

		Long id = cwBzj.getFid();

		if (id != null) {
			dest = cwBzjManager.get(id);
			beanMapper.copy(cwBzj, dest);
			cwBzjManager.save(dest);
		} else {
			dest = cwBzj;
			//同时发起流程
			dest.setFoprator(userBaseManager.findUniqueBy("ref", SpringSecurityUtils.getCurrentUserId()).getFryid());
			dest.setFcreatedate(new Date());
			cwBzjManager.newBzj(dest);
		}

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/sckf/sckf-cwBzj-info-list.do?type=" + dest.getFbzjtype();
	}
	
	
	
	@RequestMapping("sckf-cwBzj-info-lylist")
	public String lylist(@ModelAttribute Page page,@RequestParam(value = "type", required = false) String type,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
				StringBuffer hql=new StringBuffer("select bzj from CommHt ht,CwBzj bzj  where ht.fid=bzj.fxmid");
				if(type !=null){
					hql.append(" and bzj.fbzjtype='"+type+"'");
				}
				if(parameterMap.get("filter_LIKES_name") != null)
				{
					hql.append(" and ht.fhtname like '%"+parameterMap.get("filter_LIKES_name") +"%' ");
				}
				hql.append(" order by  ht.fhtname");

				parameterMap.clear();
				List<PropertyFilter> propertyFilters = PropertyFilter
						.buildFromMap(parameterMap);
				page = cwBzjManager.pagedQuery(hql.toString(), page, propertyFilters);
				
		model.addAttribute("type", type);
		model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-lylist";
	}

	@RequestMapping("sckf-cwBzj-info-lyinput")
	public String lyinput(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
			@RequestParam(value = "type", required = false) String type,
			Model model) {
		if (id != null) {
			CwBzj cwBzj = cwBzjManager.get(id);
			model.addAttribute("model", cwBzj);
		}else if(xmid!=null){
			CwBzj cwBzj =new CwBzj();
			cwBzj.setFxmid(xmid);
			model.addAttribute("model", cwBzj);
		}
		
		model.addAttribute("type", type);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-lyinput";
	}

	@RequestMapping("sckf-cwBzj-info-lysave")
	public String lysave(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwBzj dest = null;

		Long id = cwBzj.getFid();

		if (id != null) {
			dest = cwBzjManager.get(id);
			beanMapper.copy(cwBzj, dest);
			cwBzjManager.save(dest);
		} else {
			dest = cwBzj;
			//同时发起流程
			cwBzjManager.newBzj(dest);
		}

		

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/sckf/sckf-cwBzj-info-lylist.do?type=" + dest.getFbzjtype();
	}
	
	
	
	@RequestMapping("sckf-cwBzj-info-shenpi")
	public String shenpi(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,@RequestParam(value = "taskId", required = false) String taskId,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		if(cwBzj.getFstatus().equals("通过")){
			cwBzj.setFmemo4("经营部领导已通过");
		}else{
			cwBzj.setFmemo4("经营部领导已拒绝");
		}
		
		//cwBzj.setFstatus("已审核");
		//同时发起流程
		cwBzjManager.dealBzj(cwBzj, taskId);

		return "redirect:/dashboard/dashboard.do";
	}
	
	

	@RequestMapping("cwBzj-info-input-forShenpi")
	public String loadForShenpi(Model model,@RequestParam(value = "taskId", required = false) String taskId) {
		
		//同时发起流程
		model.addAttribute("model",cwBzjManager.loadBzj(taskId));
		model.addAttribute("taskId",taskId);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

		 return "sckf/cwBzj-info-input-forShenpi";
	}
	
	@RequestMapping("cwBzj-info-input-forShouxu")
	public String loadForShouxu(Model model,@RequestParam(value = "taskId", required = false) String taskId) {
		//同时发起流程
		model.addAttribute("model",cwBzjManager.loadBzj(taskId));
		model.addAttribute("taskId",taskId);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-input-forShouxu";
	}
	
	
	@RequestMapping("sckf-cwBzj-info-shouxu")
	public String shouxu(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,@RequestParam(value = "taskId", required = false) String taskId,
			RedirectAttributes redirectAttributes) {
		
		cwBzj.setFstatus("已办理");
		//同时发起流程
		cwBzjManager.dealBzj(cwBzj, taskId);

		 return "redirect:/dashboard/dashboard.do";
	}
	
	
	@RequestMapping("cwBzj-info-input-forManager")
	public String loadForManager(Model model,@RequestParam(value = "taskId", required = false) String taskId) {
		//同时发起流程
		model.addAttribute("model",cwBzjManager.loadBzj(taskId));
		model.addAttribute("taskId",taskId);
		model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "sckf/cwBzj-info-input-forManager";
	}
	
	
	@RequestMapping("sckf-cwBzj-info-manager")
	public String manager(@ModelAttribute CwBzj cwBzj,
			@RequestParam Map<String, Object> parameterMap,@RequestParam(value = "taskId", required = false) String taskId,
			RedirectAttributes redirectAttributes) {
		if(cwBzj.getFstatus().equals("通过")){
			cwBzj.setFmemo4("总经理已通过");
		}else{
			cwBzj.setFmemo4("总经理已拒绝");
		}
		
		//同时发起流程
		cwBzjManager.dealBzj(cwBzj, taskId);

		 return "redirect:/dashboard/dashboard.do";
	}
	
	

	@RequestMapping("sckf-cwBzj-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwBzj> cwBzjs = cwBzjManager.findByIds(selectedItem);

		cwBzjManager.removeAll(cwBzjs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/sckf/sckf-cwBzj-info-list.do";
	}

	
	
	@RequestMapping("sckf-cwBzj-info-export")
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
