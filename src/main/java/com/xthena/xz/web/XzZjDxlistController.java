package com.xthena.xz.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
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
import com.xthena.hr.domain.HrRyZj;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrRyZjManager;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.xz.domain.XzJgysbg;
import com.xthena.xz.domain.XzRedTape;
import com.xthena.xz.domain.XzRyzs;
import com.xthena.xz.domain.XzXjpy;
import com.xthena.xz.domain.XzZbtzs;
import com.xthena.xz.domain.XzZj;
import com.xthena.xz.domain.XzZjDxlist;
import com.xthena.xz.manager.XzJgysbgManager;
import com.xthena.xz.manager.XzRedTapeManager;
import com.xthena.xz.manager.XzRyzsManager;
import com.xthena.xz.manager.XzXjpyManager;
import com.xthena.xz.manager.XzZbtzsManager;
import com.xthena.xz.manager.XzZjDxlistManager;
import com.xthena.xz.manager.XzZjManager;
import com.xthena.xz.manager.Zj;

@Controller
@RequestMapping("xz")
public class XzZjDxlistController {
	private XzZjDxlistManager xzZjDxlistManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private XzZjManager xzzjManager;
	@Autowired
	private HrRyZjManager hrRyZjManager;
	@Autowired
	private CommRyManager commRyManager;
	@Autowired
	private XzRyzsManager xzRyzsManager;
	@Autowired
	private CommHtManager htManager;
	@Autowired
	private XzZbtzsManager xzZbtzsManager;
	@Autowired
	private XzJgysbgManager xzJgysbgManager;
	@Autowired
	private XzRedTapeManager redManager;
	@Autowired
	private XzXjpyManager xjpyManager;

	@RequestMapping("xzZjDxlist-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzZjDxlistManager.pagedQuery(page, propertyFilters);
		model.addAttribute("page", page);

		return "xz/xzZjDxlist-info-list";
	}

	@RequestMapping("xzZjDxlist-info-lesslist")
	public String lesslist(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		StringBuffer sb = new StringBuffer();
		
		sb.append("select dx,(case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
     	  		"((zjO.fstarttime between '"+parameterMap.get("startTime")+"' and '"+parameterMap.get("endTime")+"' ) or (zjO.fendtime between '"+parameterMap.get("startTime")+"' and '"+parameterMap.get("endTime")+"')) " +
     	  				" and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
     	  				" and dx.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  from XzZjDxlist as dx ");
		
		Object fname = parameterMap.get("filter_LIKES_fname");
		if (fname != null && !String.valueOf(fname).trim().equals("")) {
			sb.append("where "); 
			String[] keyWords=String.valueOf(fname).split(" ");
			for(String keyWord:keyWords){
				if(!keyWord.trim().equals("")){
					sb.append(" dx.fname like '%" ).append(keyWord).append("%'").append(" and ");
				}
			}
			sb.append(" 1=1  ");		}
		
		Query query=xzZjDxlistManager.createQuery(sb.toString());
		query.setFirstResult((page.getPageNo()-1)*page.getPageSize());
		query.setMaxResults(page.getPageSize());
		page.setResult(query.list());
		
		sb = new StringBuffer();
		
		sb.append("select count(dx) as fcount  from XzZjDxlist as dx ");
		
		fname = parameterMap.get("filter_LIKES_fname");
		if (fname != null && !String.valueOf(fname).trim().equals("")) {
			sb.append("where ");
			String[] keyWords=String.valueOf(fname).split(" ");
			for(String keyWord:keyWords){
				if(!keyWord.trim().equals("")){
					sb.append(" dx.fname like '%" ).append(keyWord).append("%'").append(" and ");
				}
			}
			sb.append(" 1=1  ");
		}
		
		query=xzZjDxlistManager.createQuery(sb.toString());
		
		page.setTotalCount(Integer.valueOf(String.valueOf(query.list().get(0))));
		
		/*page = xzZjDxlistManager.pagedQuery(sb.toString(),
				page.getPageNo(), page.getPageSize());*/
		model.addAttribute("page", page);

		return "xz/zjLessChoose-info-list";
	}

	@RequestMapping("xzZjDxlist-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			XzZjDxlist xzZjDxlist = xzZjDxlistManager.get(id);
			model.addAttribute("model", xzZjDxlist);
		}
		return "xz/xzZjDxlist-info-input";
	}

	@RequestMapping("xzZjDxlist-info-save")
	public String save(@ModelAttribute XzZjDxlist xzZjDxlist,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		XzZjDxlist dest = null;

		Long id = xzZjDxlist.getFid();

		if (id != null) {
			dest = xzZjDxlistManager.get(id);
			beanMapper.copy(xzZjDxlist, dest);
		} else {

			dest = xzZjDxlist;
		}
		xzZjDxlistManager.save(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");
		return "redirect:/xz/xzZjDxlist-info-list.do";
	}

	@RequestMapping("xzZjDxlist-info-pull")
	public String pull(@ModelAttribute XzZjDxlist xzZjDxlist,
			RedirectAttributes redirectAttributes) {
		List<XzZjDxlist> xzzjDxlist = new ArrayList<>();

		// 公司证件
		List<XzZj> xzzj = xzzjManager.getAll();
		for (XzZj xzZj : xzzj) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, xzZj));
		}

		// 人员证件
		List<HrRyZj> hrRyZjs = hrRyZjManager.getAll();
		for (HrRyZj hrRyZj : hrRyZjs) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, hrRyZj));
		}

		// 获奖证书

		List<XzRyzs> xzRyzss = xzRyzsManager.getAll();
		for (XzRyzs xzRyzs : xzRyzss) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, xzRyzs));
		}

		// 合同
		List<CommHt> hts = htManager.getAll();
		for (CommHt ht : hts) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, ht));
		}

		// 中标通知书
		List<XzZbtzs> zbs = xzZbtzsManager.getAll();
		for (XzZbtzs zb : zbs) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, zb));
		}

		// 竣工验收报告
		List<XzJgysbg> jgs = xzJgysbgManager.getAll();
		for (XzJgysbg jg : jgs) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, jg));
		}

		// 红头文件
		List<XzRedTape> reds = redManager.findBy("ftype", 2);
		for (XzRedTape red : reds) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, red));
		}

		// 外部评先
		List<XzXjpy> pxs = xjpyManager.findBy("ftype", "外");
		for (XzXjpy px : pxs) {
			XzZjDxlist dest = new XzZjDxlist();
			xzzjDxlist.add(xzZjDxlistManager.change(dest, px));
		}

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");
		for (XzZjDxlist list : xzzjDxlist) {
			xzZjDxlistManager.save(list);
		}
		return "redirect:/xz/xzZjDxlist-info-list.do";
	}

	@RequestMapping("xzZjDxlist-info-clear")
	public String clear(RedirectAttributes redirectAttributes) {
		xzZjDxlistManager.removeAll();

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzZjDxlist-info-list.do";
	}

	@RequestMapping("xzZjDxlist-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<XzZjDxlist> xzZjDxlists = xzZjDxlistManager
				.findByIds(selectedItem);

		xzZjDxlistManager.removeAll(xzZjDxlists);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzZjDxlist-info-list.do";
	}

	@RequestMapping("xzZjDxlist-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzZjDxlistManager.pagedQuery(page, propertyFilters);

		List<XzZjDxlist> xzZjDxlists = (List<XzZjDxlist>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("xzZjDxlist info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(xzZjDxlists);
		exportor.export(response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setXzZjDxlistManager(XzZjDxlistManager xzZjDxlistManager) {
		this.xzZjDxlistManager = xzZjDxlistManager;
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
