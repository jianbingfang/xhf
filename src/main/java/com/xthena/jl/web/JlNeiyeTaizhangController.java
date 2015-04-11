package com.xthena.jl.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.impl.interceptor.SessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.domain.JlNeiyeTaizhang;
import com.xthena.jl.domain.JlShizhong;
import com.xthena.jl.manager.JlFujianManager;
import com.xthena.jl.manager.JlShizhongManager;
import com.xthena.sckf.manager.CommHtManager;

@Controller
@RequestMapping("jl")
public class JlNeiyeTaizhangController {
	private CommHtManager commHtManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private JlFujianManager jlFujianManager;
	@Autowired
	private JlShizhongManager jlshizhongManager;

	@RequestMapping("jl-neiyetaizhang-info-list")
	public String list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);

		ArrayList<JlNeiyeTaizhang> tz = new ArrayList<JlNeiyeTaizhang>();
		// 监理月报
		List<JlShizhong> jlshizhongs = jlshizhongManager
				.find("select sz from JlShizhong sz where sz.fszleix='TEMP_JL_JLYB' order by sz.fuploaddate desc");
		Date newdate =null ;
		if (jlshizhongs.size() > 0) {
			newdate= jlshizhongs.get(0).getFuploaddate();
		}
		JlNeiyeTaizhang yb = new JlNeiyeTaizhang("监理月报", jlshizhongs.size(),
				newdate, "TEMP_JL_JLYB");
		tz.add(yb);
		// 例会纪要
		List<JlShizhong> jlshizhongs1 = jlshizhongManager
				.find("select sz from JlShizhong sz where sz.fszleix='TEMP_JL_LHJY' order by sz.fuploaddate desc");
		Date newdate1 = null;
		if (jlshizhongs1.size() > 0) {
			newdate1 = jlshizhongs1.get(0).getFuploaddate();
		}
		JlNeiyeTaizhang lhjy = new JlNeiyeTaizhang("例会纪要", jlshizhongs1.size(),
				newdate1, "TEMP_JL_LHJY");
		tz.add(lhjy);
		// 专题会议
		/*
		 * List<JlShizhong> jlshizhongs2= jlshizhongManager.find(
		 * "select sz from JlShizhong sz where sz.fszleix='TEMP_JL_TONGZHIDAN' order by sz.fuploaddate desc"
		 * ); Date newdate2 = jlshizhongs2.get(0).getFuploaddate();
		 */
		JlNeiyeTaizhang zthy = new JlNeiyeTaizhang("专题会议", 0, null, "");
		tz.add(zthy);
		// 监理通知单
		List<JlShizhong> jlshizhongs3 = jlshizhongManager
				.find("select sz from JlShizhong sz where sz.fszleix='TEMP_JL_TONGZHIDAN' order by sz.fuploaddate desc");
		Date newdate3 = null;
		if (jlshizhongs3.size() > 0) {
			newdate3 = jlshizhongs3.get(0).getFuploaddate();
		}
		JlNeiyeTaizhang jltz = new JlNeiyeTaizhang("监理通知单",
				jlshizhongs3.size(), newdate3, "TEMP_JL_TONGZHIDAN");
		tz.add(jltz);
		// 监理联系单
		List<JlShizhong> jlshizhongs4 = jlshizhongManager
				.find("select sz from JlShizhong sz where sz.fszleix='TEMP_JL_JLLXD' order by sz.fuploaddate desc");
		Date newdate4 = null;
		if (jlshizhongs4.size() > 0) {
			newdate4 = jlshizhongs4.get(0).getFuploaddate();
		}
		JlNeiyeTaizhang jllx = new JlNeiyeTaizhang("监理联系单",
				jlshizhongs4.size(), newdate4, "TEMP_JL_JLLXD");
		tz.add(jllx);
		// 安全文明检查
		/*
		 * List<JlShizhong> jlshizhongs5= jlshizhongManager.find(
		 * "select sz from JlShizhong sz where sz.fszleix='TEMP_JL_LHJY' order by sz.fuploaddate desc"
		 * ); Date newdate2 = jlshizhongs5.get(0).getFuploaddate();
		 */
		JlNeiyeTaizhang aqwm = new JlNeiyeTaizhang("安全文明检查", 0, null, "");
		tz.add(aqwm);
		// 设计变更
		/*
		 * List<JlShizhong> jlshizhongs6= jlshizhongManager.find(
		 * "select sz from JlShizhong sz where sz.fszleix='TEMP_JL_LHJY' order by sz.fuploaddate desc"
		 * ); Date newdate6 = jlshizhongs6.get(0).getFuploaddate();
		 */
		JlNeiyeTaizhang sjbg = new JlNeiyeTaizhang("设计变更", 0, null, "");
		tz.add(sjbg);
		// 工作总结
		/*
		 * List<JlShizhong> jlshizhongs7= jlshizhongManager.find(
		 * "select sz from JlShizhong sz where sz.fszleix='TEMP_JL_LHJY' order by sz.fuploaddate desc"
		 * ); Date newdate2 = jlshizhongs7.get(0).getFuploaddate();
		 */
		JlNeiyeTaizhang gzzj = new JlNeiyeTaizhang("工作总结", 0, null, "");
		tz.add(gzzj);
		model.addAttribute("model", tz);
		return "jl/jlNeiyeTaizhang";
	}

	@RequestMapping("jl-neiyetaizhang-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		Session session = jlFujianManager.getSession();
		Query query = session
				.createQuery("select count(*) from JlFujian f where f.fnumber='TEMP_JL_JLYB'");
		String sum = query.list().get(0).toString();
		System.out.print(sum);
		return "jl/jlNeiyeTaizhang";
	}

	// ~ ======================================================================
	@Resource
	public void setCommHtManager(CommHtManager commHtManager) {
		this.commHtManager = commHtManager;
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
