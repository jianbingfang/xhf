package com.xthena.hr.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.xthena.hr.domain.HrLz;
import com.xthena.hr.manager.HrLzManager;
import com.xthena.sckf.manager.JyXmManager;
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
import com.xthena.group.domain.OrgDepartment;
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.domain.HrGwbm;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.util.CodeUtil;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.manager.CodeGenManager;

@Controller
@RequestMapping("hr")
public class CommRyController {
	@Autowired
	private CodeGenManager codeGenManager;
	@Autowired
	private HrGwbmManager hrGwbmManager;
	@Autowired
	private CommRyManager commRyManager;
	@Autowired
	private OrgDepartmentManager orgDepartmentManager;

	@Autowired
	private JyXmManager jyXmManager;

	@Autowired
	private HrLzManager hrLzManager;

	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	private List<CommRy> rylist;
	@RequestMapping("commRy-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		//按照人员姓名排序
		page = commRyManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page); 
		return "hr/commRy-info-list";
	}

	@RequestMapping("commRy-xinzi-list")
	public String xinzilist(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = commRyManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);

		return "hr/commRy-xinzi-list";
	}

	@PostConstruct
	public void intRmMap() {
		CommRyMapUtil.initRyMap(commRyManager);
	}

	@RequestMapping("commRy-simple-list")
	public void listRy(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = commRyManager.pagedQuery(page, propertyFilters);
		JsonResponseUtil.write(response, page);
	}

	// 根据工号 姓名查询人员信息
	@RequestMapping("commRy-info-findUser")
	public void listBm(HttpServletResponse response,
			@RequestParam Map<String, Object> parameterMap) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		List<CommRy> commRies = commRyManager.find(propertyFilters);
		JsonResponseUtil.write(response, commRies);
	}

	@RequestMapping("commRy-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CommRy commRy = commRyManager.get(id);
			// commRy.setFobjyear(getGongl(new Date(), commRy.getFrzdate()));
			model.addAttribute("model", commRy);
		}
		// 岗位下拉
		List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
		HashMap<Long, String> orgDeptHashMap = new HashMap<Long, String>();
		for (OrgDepartment orgDepartment : orgDepartments) {
			orgDeptHashMap.put(orgDepartment.getId(), orgDepartment.getName());
		}
		List<HrGwbm> hrGwbms = hrGwbmManager.getAll();
		List<HashMap<String, Object>> deptList = new ArrayList<HashMap<String, Object>>();
		for (HrGwbm hrGwbm : hrGwbms) {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("fid", hrGwbm.getFid());
			hashMap.put("fname", orgDeptHashMap.get(hrGwbm.getFbmid()));
			hashMap.put("fgwname", hrGwbm.getFname());
			deptList.add(hashMap);
		}

		model.addAttribute("gwInfos", deptList);

		return "hr/commRy-info-input";
	}

	
	@RequestMapping("jyXm-toubiao-simple-list")
	public void listXm2(@ModelAttribute Page page,
						@RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
		//parameterMap.put("filter_EQS_fshenpiresult", "报名");
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = jyXmManager.pagedQuery(page, propertyFilters);
		JsonResponseUtil.write(response, page);
	}


	@RequestMapping("commRy-info-save")
	public String save(@ModelAttribute CommRy commRy,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes, Model model) {
		CommRy dest = null;

		Long id = commRy.getFid();
		if (id != null) {

			String status=commRy.getFgyxz();
			dest = commRyManager.get(id);

			// 判断离职人员台账中是否已存在改离职人员记录, 大于0则说明改人信息已经在离职台账中，修改其他信息
			List<HrLz> Lzryids=hrLzManager.findBy("fry", dest.getFid());

			//离职选择为4
			if(status.equalsIgnoreCase("4")&&Lzryids.size()==0){
				String fryid= dest.getFid().toString();
				dest.setFgyxz(commRy.getFgyxz()); // 重新设置雇佣性质
				commRyManager.save(dest);
				CommRyMapUtil.refreshRyMap(dest);
				return "redirect:/hr/hrLz-info-input.do?fryid="+fryid;
			}
			else {
				// 未离职情况 或修改已离职人员的其他信息
			beanMapper.copy(commRy, dest);

			}
		} else {
			dest = commRy;
			dest.setFcardno(CodeUtil.getSysYearCode(ConstValue.SYS_CODE_RY, 4,
					codeGenManager));
		}
		commRyManager.save(dest);
		CommRyMapUtil.refreshRyMap(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/hr/commRy-info-list.do";
	}

	@RequestMapping("commRy-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CommRy> commRys = commRyManager.findByIds(selectedItem);

		commRyManager.removeAll(commRys);
		CommRyMapUtil.deleteRyMap(commRys);
		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/hr/commRy-info-list.do";
	}

	@RequestMapping("commRy-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = commRyManager.pagedQuery(page, propertyFilters);

		List<CommRy> commRys = (List<CommRy>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("commRy info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(commRys);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setCommRyManager(CommRyManager commRyManager) {
		this.commRyManager = commRyManager;
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
