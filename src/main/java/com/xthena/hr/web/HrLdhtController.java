package com.xthena.hr.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
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
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.domain.HrLdht;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.hr.manager.HrLdhtManager;
import com.xthena.util.CommRyMapUtil;

@Controller
@RequestMapping("hr")
public class HrLdhtController {
	@Autowired
	private HrLdhtManager hrLdhtManager;
	@Autowired
	private CommRyManager commRyManager;
	@Autowired
	private HrGwbmManager hrGwbmManager;
	@Autowired
	private OrgDepartmentManager orgDepartmentManager;

	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@RequestMapping("hrLdht-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {

		StringBuffer hql = new StringBuffer("select b from HrLdht b  where 1=1");// "select b from CommRy a,CommHt b  where a.fid=b.fzhubanren"

		if (parameterMap.get("filter_LIKES_fname") != null
				&& !parameterMap.get("filter_LIKES_fname").equals("")) {
			hql.replace(0, hql.length(),
					"select b from CommRy a,HrLdht b  where a.fid=b.fryid");
			hql.append(" and a.fname like '%"
					+ parameterMap.get("filter_LIKES_fname") + "%' ");
			parameterMap.remove("filter_LIKES_fname");
		}

		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);

		page = hrLdhtManager.pagedQuery(hql.toString(), page, propertyFilters);
		model.addAttribute("deptList", orgDepartmentManager.getAll());
		model.addAttribute("page", page);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "hr/hrLdht-info-list";
	}

	@RequestMapping("hrLdht-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "ryid", required = false) Long ryid,
			Model model) {

		if (ryid != null) {

			List<HrLdht> hrLdhts = hrLdhtManager.findBy("fryid", ryid);
			if (!hrLdhts.isEmpty()) {
				hrLdhts.get(0).setFryid(ryid);
				model.addAttribute("model", hrLdhts.get(0));
			} else {
				HrLdht hrLdht = new HrLdht();
				hrLdht.setFryid(ryid);
				model.addAttribute("model", hrLdht);
			}

			model.addAttribute("userName", commRyManager.get(ryid).getFname());
			model.addAttribute("fryno", commRyManager.get(ryid).getFcardno());
		}

		if (id != null) {
			HrLdht hrLdht = hrLdhtManager.get(id);
			model.addAttribute("model", hrLdht);
			model.addAttribute("userName", commRyManager.get(hrLdht.getFryid())
					.getFname());
			model.addAttribute("fryno", commRyManager.get(hrLdht.getFryid())
					.getFcardno());
		}
		model.addAttribute("deptList", orgDepartmentManager.getAll());

		/*
		 * //岗位列表 List<OrgDepartment> orgDepartments=
		 * orgDepartmentManager.getAll(); HashMap<Long, String>
		 * orgDeptHashMap=new HashMap<Long, String>(); for(OrgDepartment
		 * orgDepartment:orgDepartments){
		 * orgDeptHashMap.put(orgDepartment.getId(), orgDepartment.getName()); }
		 * List<HrGwbm> hrGwbms= hrGwbmManager.getAll(); List<HashMap<String,
		 * Object>> deptList=new ArrayList<HashMap<String, Object>>();
		 * for(HrGwbm hrGwbm:hrGwbms){ HashMap<String, Object> hashMap=new
		 * HashMap<String, Object>(); hashMap.put("fid", hrGwbm.getFid());
		 * hashMap.put("fname",orgDeptHashMap.get(hrGwbm.getFbmid()));
		 * hashMap.put("fgwname",hrGwbm.getFname()); deptList.add(hashMap); }
		 * 
		 * model.addAttribute("gwInfos", deptList);
		 */
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "hr/hrLdht-info-input";
	}

	@RequestMapping("hrLdht-info-save")
	public String save(@ModelAttribute HrLdht hrLdht,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		HrLdht dest = null;

		Long id = hrLdht.getFid();

		if (id != null) {
			dest = hrLdhtManager.get(id);
			beanMapper.copy(hrLdht, dest);
		} else {
			dest = hrLdht;
		}

		hrLdhtManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/hr/hrLdht-info-input.do?id=" + dest.getFid();
	}

	@RequestMapping("hrLdht-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<HrLdht> hrLdhts = hrLdhtManager.findByIds(selectedItem);

		hrLdhtManager.removeAll(hrLdhts);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/hr/hrLdht-info-list.do";
	}

	@RequestMapping("hrLdht-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = hrLdhtManager.pagedQuery(page, propertyFilters);

		List<HrLdht> hrLdhts = (List<HrLdht>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("hrLdht info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(hrLdhts);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setHrLdhtManager(HrLdhtManager hrLdhtManager) {
		this.hrLdhtManager = hrLdhtManager;
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
