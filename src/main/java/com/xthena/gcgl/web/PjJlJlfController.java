package com.xthena.gcgl.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.impl.transformer.StringToLong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.jl.domain.Jlf;
import com.xthena.jl.domain.JlfRecord;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlfManager;
import com.xthena.jl.manager.JlfRecordManager;
import com.xthena.jl.manager.PjXmJdManager;

@Controller
@RequestMapping("gcgl")
public class PjJlJlfController {
	private JlfManager jlfManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private PjXmManager pjXmManager;

	@Autowired
	private PjXmJdManager pjXmJdManager;

	@Autowired
	private JlfRecordManager jlfRecordManager;

	@Autowired
	private JlDeptManager jlDeptManager;

	@RequestMapping("jlf-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = jlfManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);

		return "gcgl/jlf-info-list";
	}


	@RequestMapping("jl-ny-jlf-input")
	public String jlfinput(@ModelAttribute Page page,
						   @RequestParam(value = "fxmid", required = false) Long fxmid,
						   @RequestParam Map<String, Object> parameterMap,
						   HttpServletRequest request, Model model) {

		Jlf jlf1 = jlfManager.findUniqueBy("fxmid", fxmid);

		if(jlf1==null){
			Jlf newjlf=new Jlf();
			newjlf.setFxmid(fxmid);
			jlfManager.save(newjlf);
			jlf1=newjlf;
		}
//		jlf1.setFxmid(fxmid);
		model.addAttribute("model", jlf1);

		parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = jlfRecordManager.pagedQuery(page, propertyFilters);
		List<JlfRecord> jlfRecords = (List<JlfRecord>) page.getResult();
		double jlfSum = 0;
		for (JlfRecord jlfRecord : jlfRecords) {
			jlfSum += Double.valueOf(jlfRecord.getFhtjlf());
		}
		model.addAttribute("page", page);
		model.addAttribute("jlfSum", jlfSum);
		return "gcgl/jl-ny-jlf-input";
	}


//	@RequestMapping("jl-ny-jlf-input")
//	public String jlfinput(@ModelAttribute Page page,
//			@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
//			@RequestParam Map<String, Object> parameterMap,
//			HttpServletRequest request, Model model) {
//		PjXm pjXm = pjXmManager.get(fxmid);
//		if (pjXm != null) {
//			Jlf jlf1 = jlfManager.get(pjXm.getFid());
//			model.addAttribute("model", jlf1);
//		}
//
//	/*	List<PjXmJd> pjXmJds = pjXmJdManager.findBy("fxmid",
//				jlDeptManager.getXmId(request));
//		double jlf = 0;
//		for (PjXmJd pjXmJd : pjXmJds) {
//			jlf += Double.valueOf(pjXmJd.getFjlf());
//		}*/
//
//		parameterMap.put("filter_EQL_fxmid",fxmid );
//		List<PropertyFilter> propertyFilters = PropertyFilter
//				.buildFromMap(parameterMap);
//		page = jlfRecordManager.pagedQuery(page, propertyFilters);
//		List<JlfRecord> jlfRecords = (List<JlfRecord>) page.getResult();
//		double jlfSum = 0;
//		for (JlfRecord jlfRecord : jlfRecords) {
//			jlfSum += Double.valueOf(jlfRecord.getFhtjlf());
//		}
//
//		model.addAttribute("page", page);
//	/*	if (pjXm.getFhtid() != null) {
//			CommHt commHt = commHtManager.get(pjXm.getFhtid());
//			model.addAttribute("commHt", commHt);
//		}*/
//		model.addAttribute("jlfSum", jlfSum);
//
//
//		return "gcgl/jlf-info-input";
//	}

	@RequestMapping("jlf-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			Jlf jlf = jlfManager.get(id);
			model.addAttribute("model", jlf);
		}

		return "gcgl/jlf-info-input";
	}

	@RequestMapping("jlf-info-save")
	public String save(@ModelAttribute Jlf jlf,

					   @RequestParam Map<String, Object> parameterMap,
//					   @RequestParam(value = "fxmid", required = false) Long fxmid,
					   HttpServletRequest request,RedirectAttributes redirectAttributes) {


		String fxmid=request.getParameter("fxmid");

		Long fxmid1= Long.parseLong(fxmid);
		Jlf dest = null;

//		PjXm pjXm = pjXmManager.get(jlDeptManager.getXmId(request));

		Long id = jlf.getFid();

		if (id != null) {
			dest = jlfManager.get(id);
			beanMapper.copy(jlf, dest);
		} else {
			dest = jlf;
		}
//		if(pjXm!=null){
//			Long xmid=pjXm.getFid();
//			dest.setFxmid(xmid);
//		}
		dest.setFxmid(fxmid1);
		jlfManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		//return "redirect:/jl/jlf-info-list.do";
		return "redirect:/gcgl/jl-ny-jlf-input.do?fxmid="+fxmid;
	}

//	@RequestMapping("jlf-info-save")
//	public String save(@ModelAttribute Jlf jlf,
//			@RequestParam Map<String, Object> parameterMap,
//			RedirectAttributes redirectAttributes) {
//		Jlf dest = null;
//
//		Long id = jlf.getFid();
//
//		if (id != null) {
//			dest = jlfManager.get(id);
//			beanMapper.copy(jlf, dest);
//		} else {
//			dest = jlf;
//		}
//
//		jlfManager.save(dest);
//
//		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
//				"保存成功");
//
//		return "redirect:/gcgl/jl-ny-jlf-input.do";
//	}

	@RequestMapping("jlf-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<Jlf> jlfs = jlfManager.findByIds(selectedItem);

		jlfManager.removeAll(jlfs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/gcgl/jlf-info-list.do";
	}

	@RequestMapping("jlf-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = jlfManager.pagedQuery(page, propertyFilters);

		List<Jlf> jlfs = (List<Jlf>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("jlf info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(jlfs);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setJlfManager(JlfManager jlfManager) {
		this.jlfManager = jlfManager;
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
