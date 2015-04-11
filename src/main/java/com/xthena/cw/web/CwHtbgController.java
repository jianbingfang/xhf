package com.xthena.cw.web;

import java.text.NumberFormat;
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
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.cw.domain.CwHtFx;
import com.xthena.cw.domain.CwHtbg;
import com.xthena.cw.domain.CwYingShou;
import com.xthena.cw.manager.CwHtbgManager;
import com.xthena.cw.manager.CwYingShouManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwHtbgController {
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private CommHtManager commHtManager;
	@Autowired
	private CwYingShouManager yingShouManager;

	@RequestMapping("cwHtbg-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		parameterMap.put("filter_EQS_fisf", '0');
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = commHtManager.pagedQuery(page, propertyFilters);
		List<CommHt> hts = (List<CommHt>) page.getResult();
		ArrayList<CwHtFx> results = new ArrayList<CwHtFx>();

		for (CommHt ht : hts) {
			CwHtFx htfx = new CwHtFx();
			htfx.setFhetongid(ht.getFid());
			// 合同名称
			if (ht.getFhtname() != null) {
				htfx.setFhetongname(ht.getFhtname());
			}
			// 合同金额
			Double zje = 0.0;
			if (ht.getFjianlifei() != null) {
				zje = ht.getFjianlifei() * 10000;
			}
			htfx.setFhetongjine(String.format("%.2f",zje));
			
			
			// 实际总收入
			Long xmid = ht.getFxmid();
			List yingshous = yingShouManager.find(
					"select max(fsjzsr) from CwYingShou where fxmid=?", xmid);
			
			Double sjzsr = 0.0;
			if (yingshous.size() > 0 && yingshous.get(0) != null) {
				sjzsr = (Double) yingshous.get(0);
			}
			htfx.setFsjzsr(sjzsr.toString());
			
			List list = yingShouManager
					.find("select ys from CwYingShou ys where ys.fxmid=? order by ys.fid desc",
							xmid);
			CwYingShou ys1 = new CwYingShou();
			if (list.size() > 0) {
				ys1 = (CwYingShou) list.get(0);
				if (ys1.getFhjjdfx() == "贷方") {
					htfx.setFyszk("");
				} else {
					htfx.setFyszk(ys1.getFhjje());
				}
				htfx.setFhsl(String.format("%.2f", sjzsr / zje));
			}
			results.add(htfx);
		}
		page.setResult(results);
		model.addAttribute("page", page);
		return "cw/cwHtbg-info-list";
	}

	@RequestMapping("cwHtbg-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {

		return "cw/cwHtbg-info-input";
	}

	@RequestMapping("cwHtbg-info-save")
	public String save(@ModelAttribute CwHtbg cwHtbg,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwHtbg-info-list.do";
	}

	@RequestMapping("cwHtbg-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwHtbg-info-list.do";
	}

	@RequestMapping("cwHtbg-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		/*
		 * TableModel tableModel = new TableModel();
		 * //tableModel.setName("cwHtbg info"); //tableModel.addHeaders("id",
		 * "name"); tableModel.setData(cwHtbgs); exportor.export(response,
		 * tableModel);
		 */
	}

	// ~ ======================================================================
	@Resource
	public void setCwHtbgManager(CwHtbgManager cwHtbgManager) {
		// this.cwHtbgManager = cwHtbgManager;
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
