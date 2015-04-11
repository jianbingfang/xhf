package com.xthena.cw.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
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
import com.xthena.cw.domain.CwYingShou;
import com.xthena.cw.manager.CwYingShouManager;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.DateJsonValueProcessor;
import com.xthena.util.HtMapUtil;

@Controller
@RequestMapping("cw")
public class CwYingShouController {
	private CwYingShouManager cwYingShouManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;
	@Autowired
	private CommHtManager htManager;

	
	@RequestMapping("cwYingShou-treelist")
    public String treelist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
      
    //	StringBuffer hql1 = new StringBuffer("select ry from CommRy ry,HrRyZj ys  where ry.fid=ys.userid");
    	// 根据项目编号查询
		StringBuffer hql=new StringBuffer("select DISTINCT ht.fid ,ht.fhtname,SUM(ys.fdebit) ,SUM(ys.fcreditor),sum(ys.fcreditor)-sum(ys.fdebit)  from CommHt ht,CwYingShou ys where ht.fid=ys.fxmid ");
		if(parameterMap.get("filter_LIKES_fprojectname") != null  && ! parameterMap.get("filter_LIKES_fprojectname").toString().trim().equals(""))
		{
			hql.append(" and ht.fhtname like '%"+parameterMap.get("filter_LIKES_fprojectname") +"%' ");
		}
		if(parameterMap.get("filter_GTD_fdzdate") != null && ! parameterMap.get("filter_GTD_fdzdate").toString().trim().equals("")){
			String  startdate = parameterMap.get("filter_GTD_fdzdate").toString();
				hql.append(" and  ys.fdzdate>'"+startdate+"'");
			}
		if(parameterMap.get("filter_LTD_fdzdate") != null && ! parameterMap.get("filter_LTD_fdzdate").toString().trim().equals("")){
			String enddate =  parameterMap.get("filter_LTD_fdzdate").toString();
			hql.append(" and  ys.fdzdate<'"+enddate+"'");
		}
		if(parameterMap.get("filter_LIKES_finviocecode") != null && ! parameterMap.get("filter_LIKES_finviocecode").toString().trim().equals("")){
			String inviocecode = parameterMap.get("filter_LIKES_finviocecode").toString();
			hql.append(" and  ys.finviocecode like '%"+inviocecode+"%'");
		}
		if(parameterMap.get("filter_LIKES_freceiptcode") != null && ! parameterMap.get("filter_LIKES_freceiptcode").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_freceiptcode").toString();
			hql.append(" and  ys.freceiptcode like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fjsstate") != null  &&  !parameterMap.get("filter_LIKES_fjsstate").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fjsstate").toString();
			hql.append(" and  ht.fjsstate like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fmemo4") != null && !parameterMap.get("filter_LIKES_fmemo4").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fmemo4").toString();
			hql.append(" and  ht.fmemo4 like '%"+receiptcode+"%'");
		}
		hql.append(" GROUP BY ht.fid");
		List results=cwYingShouManager.find(hql.toString());
		
		//分页处理
		page.setTotalCount(results.size());
		page.setPageSize(page.getPageSize());
		page.setPageNo(page.getPageNo());
		if(page.getStart()>results.size() ){
			
		}
		else if((page.getStart()+page.getPageSize())<=results.size()){
		     page.setResult(results.subList(page.getStart(), page.getStart()+page.getPageSize()));
		}else
		{
			page.setResult(results.subList(page.getStart(), results.size()));
		}
		
		
       StringBuffer hql1 = new StringBuffer();
		hql1=new StringBuffer("select sum(ys.fcreditor) ,sum(ys.fdebit),count(ht) from CommHt ht,CwYingShou ys  where ht.fid=ys.fxmid ");
		if(parameterMap.get("filter_LIKES_fprojectname") != null  && ! parameterMap.get("filter_LIKES_fprojectname").toString().trim().equals(""))
		{
			hql1.append(" and ht.fhtname like '%"+parameterMap.get("filter_LIKES_fprojectname") +"%' ");
		}
		if(parameterMap.get("filter_GTD_fdzdate") != null && ! parameterMap.get("filter_GTD_fdzdate").toString().trim().equals("")){
			String  startdate = parameterMap.get("filter_GTD_fdzdate").toString();
				hql1.append(" and  ys.fdzdate>'"+startdate+"'");
			}
		if(parameterMap.get("filter_LTD_fdzdate") != null && ! parameterMap.get("filter_LTD_fdzdate").toString().trim().equals("")){
			String enddate =  parameterMap.get("filter_LTD_fdzdate").toString();
			hql1.append(" and  ys.fdzdate<'"+enddate+"'");
		}
		if(parameterMap.get("filter_LIKES_finviocecode") != null && ! parameterMap.get("filter_LIKES_finviocecode").toString().trim().equals("")){
			String inviocecode = parameterMap.get("filter_LIKES_finviocecode").toString();
			hql1.append(" and  ys.finviocecode like '%"+inviocecode+"%'");
		}
		if(parameterMap.get("filter_LIKES_freceiptcode") != null && ! parameterMap.get("filter_LIKES_freceiptcode").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_freceiptcode").toString();
			hql1.append(" and  ys.freceiptcode like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fjsstate") != null  &&  !parameterMap.get("filter_LIKES_fjsstate").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fjsstate").toString();
			hql1.append(" and  ht.fjsstate like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fmemo4") != null && !parameterMap.get("filter_LIKES_fmemo4").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fmemo4").toString();
			hql1.append(" and  ht.fmemo4 like '%"+receiptcode+"%'");
		}
		List countResult=cwYingShouManager.find(hql1.toString());
		Object[] result=(Object[]) countResult.get(0);
		double	jiefang = Double.parseDouble(String.valueOf(result[1]==null?0:result[1]));
		double	daifang = Double.parseDouble(String.valueOf(result[0]==null?0:result[0]));
		double  hejijine  = daifang-jiefang;
		
		String jiedaifangxiang="";
		if ( hejijine> 0) {
			jiedaifangxiang = "贷方";
		} else if(hejijine< 0){
			jiedaifangxiang = "借方";
		}else{
			jiedaifangxiang = "平";
		}
			model.addAttribute("jiefangheji",
					String.format("%.2f", jiefang));
			model.addAttribute("daifangheji",
					String.format("%.2f", daifang));
			model.addAttribute("jiedaifangxiang", jiedaifangxiang);
			model.addAttribute("hejijine", String.format("%.2f", Math.abs(hejijine)));
		model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		return "cw/cwyingshou-info-list";
    	}
	
	
	
	@RequestMapping("cwYingShou-info-list")
	public void list(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model,@RequestParam(value = "htid", required = false) Long htid,HttpServletResponse response) {

	//根据项目名称查询
	StringBuffer hql=new StringBuffer("select ys from CommHt ht,CwYingShou ys  where ht.fid=ys.fxmid ");
		if (htid != null) {
			hql.append(" and ys.fxmid="+htid);
		}
		if(parameterMap.get("filter_LIKES_fprojectname") != null  && ! parameterMap.get("filter_LIKES_fprojectname").toString().trim().equals(""))
		{
			hql.append(" and ht.fhtname like '%"+parameterMap.get("filter_LIKES_fprojectname") +"%' ");
		}
		Object a = parameterMap.get("filter_GTD_fdzdate");
		if(parameterMap.get("filter_GTD_fdzdate") != null && ! parameterMap.get("filter_GTD_fdzdate").toString().trim().equals("")){
			String  startdate = parameterMap.get("filter_GTD_fdzdate").toString();
				hql.append(" and  ys.fdzdate>'"+startdate+"'");
			}
		if(parameterMap.get("filter_LTD_fdzdate") != null && ! parameterMap.get("filter_LTD_fdzdate").toString().trim().equals("")){
			String enddate =  parameterMap.get("filter_LTD_fdzdate").toString();
			hql.append(" and  ys.fdzdate<'"+enddate+"'");
		}
		if(parameterMap.get("filter_LIKES_finviocecode") != null && ! parameterMap.get("filter_LIKES_finviocecode").toString().trim().equals("")){
			String inviocecode = parameterMap.get("filter_LIKES_finviocecode").toString();
			hql.append(" and  ys.finviocecode like '%"+inviocecode+"%'");
		}
		if(parameterMap.get("filter_LIKES_freceiptcode") != null && ! parameterMap.get("filter_LIKES_freceiptcode").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_freceiptcode").toString();
			hql.append(" and  ys.freceiptcode like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fjsstate") != null  &&  !parameterMap.get("filter_LIKES_fjsstate").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fjsstate").toString();
			hql.append(" and  ht.fjsstate like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fmemo4") != null && !parameterMap.get("filter_LIKES_fmemo4").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fmemo4").toString();
			hql.append(" and  ht.fmemo4 like '%"+receiptcode+"%'");
		}
		//page = cwYingShouManager.pagedQuery(hql.toString(), page.getPageNo(),page.getPageSize());
		List result = cwYingShouManager.find(hql.toString());
		
	/*	
		hql=new StringBuffer("select sum(ys.fcreditor) ,sum(ys.fdebit),sum(ys.fcreditor)-sum(ys.fdebit) from CommHt ht,CwYingShou ys  where ht.fid=ys.fxmid ");
		if(parameterMap.get("filter_LIKES_fprojectname") != null  && ! parameterMap.get("filter_LIKES_fprojectname").toString().trim().equals(""))
		{
			hql.append(" and ht.fhtname like '%"+parameterMap.get("filter_LIKES_fprojectname") +"%' ");
		}
		if(parameterMap.get("filter_GTD_fdzdate") != null && ! parameterMap.get("filter_GTD_fdzdate").toString().trim().equals("")){
			String  startdate = parameterMap.get("filter_GTD_fdzdate").toString();
				hql.append(" and  ys.fdzdate>'"+startdate+"'");
			}
		if(parameterMap.get("filter_LTD_fdzdate") != null && ! parameterMap.get("filter_LTD_fdzdate").toString().trim().equals("")){
			String enddate =  parameterMap.get("filter_LTD_fdzdate").toString();
			hql.append(" and  ys.fdzdate<'"+enddate+"'");
		}
		if(parameterMap.get("filter_LIKES_finviocecode") != null && ! parameterMap.get("filter_LIKES_finviocecode").toString().trim().equals("")){
			String inviocecode = parameterMap.get("filter_LIKES_finviocecode").toString();
			hql.append(" and  ys.finviocecode like '%"+inviocecode+"%'");
		}
		if(parameterMap.get("filter_LIKES_freceiptcode") != null && ! parameterMap.get("filter_LIKES_freceiptcode").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_freceiptcode").toString();
			hql.append(" and  ys.freceiptcode like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fjsstate") != null  &&  !parameterMap.get("filter_LIKES_fjsstate").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fjsstate").toString();
			hql.append(" and  ht.fjsstate like '%"+receiptcode+"%'");
		}
		if(parameterMap.get("filter_LIKES_fmemo4") != null && !parameterMap.get("filter_LIKES_fmemo4").toString().trim().equals("")){
			String receiptcode = parameterMap.get("filter_LIKES_fmemo4").toString();
			hql.append(" and  ht.fmemo4 like '%"+receiptcode+"%'");
		}
		hql.append(" order by  ys.fdzdate");*/
		
		/*List countResult=cwYingShouManager.find(hql.toString());
		Object[] result=(Object[]) countResult.get(0);
		String jiedaifangxiang="";
		if (result[2]!=null && Double.parseDouble(String.valueOf(result[2]==null?0:result[2]))> 0) {
			jiedaifangxiang = "贷方";
		} else if(result[2]!=null && Double.parseDouble(String.valueOf(result[2]==null?0:result[2]))< 0){
			jiedaifangxiang = "借方";
		}else{
			jiedaifangxiang = "平";
		}
		double	hejijine = Math.abs(Double.parseDouble(String.valueOf(result[2]==null?0:result[2])));
			model.addAttribute("jiefangheji",
					String.format("%.2f", Double.parseDouble(String.valueOf(result[1]==null?0:result[1]))));
			model.addAttribute("daifangheji",
					String.format("%.2f", Double.parseDouble(String.valueOf(result[0]==null?0:result[0]))));
			model.addAttribute("jiedaifangxiang", jiedaifangxiang);
			model.addAttribute("hejijine", String.format("%.2f", hejijine));*/
			
	/*	model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());*/
		/*return "cw/cwyingshou-info-list";*/
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  
		PrintWriter printWriter = null;
		try {
			printWriter = response.getWriter();
			JsonConfig config = new JsonConfig();  
            config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
			printWriter.write(JSONArray.fromObject(result,config).toString());
			printWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@RequestMapping("cwYingShou-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			CwYingShou cwYingShou = cwYingShouManager.get(id);
			model.addAttribute("model", cwYingShou);
		}
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		return "cw/cwYingShou-info-input";
	}

	@RequestMapping("cwYingShou-info-save")
	public String save(@ModelAttribute CwYingShou cwYingShou,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwYingShou dest = null;

		Long id = cwYingShou.getFid();

		if (id != null) {
			dest = cwYingShouManager.get(id);
			beanMapper.copy(cwYingShou, dest);
		} else {
			dest = cwYingShou;
		}

		cwYingShouManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwYingShou-info-list.do";
	}

	@RequestMapping("cwYingShou-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwYingShou> cwYingShous = cwYingShouManager
				.findByIds(selectedItem);

		cwYingShouManager.removeAll(cwYingShous);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwYingShou-info-list.do";
	}

	@RequestMapping("cwYingShou-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwYingShouManager.pagedQuery(page, propertyFilters);

		List<CwYingShou> cwYingShous = (List<CwYingShou>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("cwYingShou info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(cwYingShous);
		exportor.export(response, tableModel);
	}

	@RequestMapping("cwKaiPiao-info-list")
	public String KaiPiaolist(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
		
		//filter_GTD_fdzdate:
		//filter_LTD_fdzdate:
				
		StringBuffer hql=new StringBuffer("select ys from CommHt ht,CwYingShou ys  where ht.fid=ys.fxmid and ys.fmemo1='kaipiao'");
		if(parameterMap.get("filter_LIKES_fprojectname") != null&&!parameterMap.get("filter_LIKES_fprojectname").toString().trim().equals("") )
		{
			hql.append(" and ht.fhtname like '%"+parameterMap.get("filter_LIKES_fprojectname") +"%' ");
		}
		if(parameterMap.get("filter_LIKES_fmemo4") != null&&!parameterMap.get("filter_LIKES_fmemo4").toString().trim().equals("") )
		{
			hql.append(" and ht.fmemo4 like '%"+parameterMap.get("filter_LIKES_fmemo4") +"%' ");
		}
		if(parameterMap.get("filter_LIKES_finviocecode") != null&&!parameterMap.get("filter_LIKES_finviocecode").toString().trim().equals(""))
		{
			hql.append(" and ys.finviocecode like '%"+parameterMap.get("filter_LIKES_finviocecode") +"%' ");
		}
		
		if(parameterMap.get("filter_LIKES_freceiptcode") != null&&!parameterMap.get("filter_LIKES_freceiptcode").toString().trim().equals(""))
		{
			hql.append(" and ys.finviocecode like '%"+parameterMap.get("filter_LIKES_finviocecode") +"%' ");
		}
		
		if(parameterMap.get("filter_GTD_fdzdate") != null&&!parameterMap.get("filter_GTD_fdzdate").toString().trim().equals(""))
		{
			hql.append(" and ys.fdzdate > '"+parameterMap.get("filter_GTD_fdzdate") +"' ");
		}
		
		if(parameterMap.get("filter_LTD_fdzdate") != null&&!parameterMap.get("filter_LTD_fdzdate").toString().trim().equals(""))
		{
			hql.append(" and ys.fdzdate < '"+parameterMap.get("filter_LTD_fdzdate") +"' ");
		}
		hql.append(" order by  ht.fhtname");

		parameterMap.clear();
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = cwYingShouManager.pagedQuery(hql.toString(), page, propertyFilters);

		for (CwYingShou ys : (List<CwYingShou>) page.getResult()) {
			String a = String.format("%.2f", ys.getFdebit());
			ys.setFmemo1(a);
			/*
			 * String b = String.format("%.2f", ys.getFcreditor());
			 * ys.setFmemo2(b);
			 */
		}
		model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "cw/cwKaiPiao-info-list";
	}

	@RequestMapping("cwKaiPiao-info-input")
	public String KaiPiaoinput(
			@RequestParam(value = "id", required = false) Long id, Model model) {
		if (id != null) {
			CwYingShou cwYingShou = cwYingShouManager.get(id);
			String a = String.format("%.2f", cwYingShou.getFdebit());
			cwYingShou.setFmemo1(a);
			model.addAttribute("model", cwYingShou);
		}else{
			model.addAttribute("user",SpringSecurityUtils.getCurrentUser().getUsername());
		}
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "cw/cwKaiPiao-info-input";
	}

	@RequestMapping("cwKaiPiao-info-save")
	public String KaiPiaosave(@ModelAttribute CwYingShou cwYingShou,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwYingShou dest = null;

		Long id = cwYingShou.getFid();

		if (id != null) {
			dest = cwYingShouManager.get(id);
			beanMapper.copy(cwYingShou, dest);
		} else {
			dest = cwYingShou;
		}
		// 计算每笔合计金额
		Long xmid = cwYingShou.getFxmid();
		List<CwYingShou> ysList = cwYingShouManager.findBy("fxmid", xmid);

		Double daifangheji = 0.0;
		Double jiefangheji = 0.0;
		String jiedaifangxiang = "贷方";
		Double hejijine = 0.0;
		for (CwYingShou ys : ysList) {
			if (ys.getFcreditor() != null) {
				daifangheji += ys.getFcreditor();
			}
			if (ys.getFdebit() != null) {
				jiefangheji += ys.getFdebit();
			}
		}
		Double heji = daifangheji - jiefangheji - dest.getFdebit();
		if (heji > 0) {
			jiedaifangxiang = "贷方";
		} else if(heji<0) {
			jiedaifangxiang = "借方";
		}else{
			jiedaifangxiang="平";
		}
		hejijine = Math.abs(heji);
		dest.setFhjjdfx(jiedaifangxiang);
		dest.setFhjje(String.format("%.2f", hejijine));
		// 计算每笔合计金额 以上

		dest.setFmemo1("kaipiao");

		cwYingShouManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwKaiPiao-info-list.do";
	}

	@RequestMapping("cwKaiPiao-info-remove")
	public String KaiPiaoremove(
			@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwYingShou> cwYingShous = cwYingShouManager
				.findByIds(selectedItem);

		cwYingShouManager.removeAll(cwYingShous);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwKaiPiao-info-list.do";
	}

	@RequestMapping("cwYiShou-info-list")
	public String YiShoulist(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		// 根据项目名称查询
				StringBuffer hql=new StringBuffer("select ys from CommHt ht,CwYingShou ys  where ht.fid=ys.fxmid and ys.fmemo1='yishou' ");
				if(parameterMap.get("filter_LIKES_fprojectname") != null)
				{
					hql.append(" and ht.fhtname like '%"+parameterMap.get("filter_LIKES_fprojectname") +"%' ");
				}
				if(parameterMap.get("filter_LIKES_fmemo4") != null)
				{
					hql.append(" and ht.fmemo4 like '%"+parameterMap.get("filter_LIKES_fmemo4") +"%' ");
				}
				if(parameterMap.get("filter_GTD_fdzdate") != null&&!parameterMap.get("filter_GTD_fdzdate").toString().trim().equals(""))
				{
					hql.append(" and ys.fdzdate > '"+parameterMap.get("filter_GTD_fdzdate") +"' ");
				}
				
				if(parameterMap.get("filter_LTD_fdzdate") != null&&!parameterMap.get("filter_LTD_fdzdate").toString().trim().equals(""))
				{
					hql.append(" and ys.fdzdate < '"+parameterMap.get("filter_LTD_fdzdate") +"' ");
				}
				hql.append(" order by  ht.fhtname");

				parameterMap.clear();
				List<PropertyFilter> propertyFilters = PropertyFilter
						.buildFromMap(parameterMap);
				page = cwYingShouManager.pagedQuery(hql.toString(), page, propertyFilters);
		for (CwYingShou ys : (List<CwYingShou>) page.getResult()) {
			/*
			 * String a = String.format("%.2f", ys.getFdebit());
			 * ys.setFmemo1(a);
			 */
			String b = String.format("%.2f", ys.getFcreditor());
			ys.setFmemo1(b);
		}
		model.addAttribute("page", page);
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "cw/cwYishou-info-list";
	}

	@RequestMapping("cwYiShou-info-input")
	public String YiShouinput(
			@RequestParam(value = "id", required = false) Long id, Model model) {
		if (id != null) {
			CwYingShou cwYingShou = cwYingShouManager.get(id);
			model.addAttribute("model", cwYingShou);
		}else{
			model.addAttribute("user",SpringSecurityUtils.getCurrentUser().getUsername());
		}
		model.addAttribute("htMap", HtMapUtil.getHtMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		return "cw/cwYishou-info-input";
	}

	@RequestMapping("cwYiShou-info-save")
	public String YiShousave(@ModelAttribute CwYingShou cwYingShou,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		CwYingShou dest = null;

		Long id = cwYingShou.getFid();

		if (id != null) {
			dest = cwYingShouManager.get(id);
			beanMapper.copy(cwYingShou, dest);
		} else {
			dest = cwYingShou;
		}
		dest.setFmemo1("yishou");
		// 计算每笔合计金额
		Long xmid = cwYingShou.getFxmid();
		List<CwYingShou> ysList = cwYingShouManager.findBy("fxmid", xmid);
		Double daifangheji = 0.0;
		Double jiefangheji = 0.0;
		String jiedaifangxiang = "贷方";
		Double hejijine = 0.0;
		for (CwYingShou ys : ysList) {
			if (ys.getFcreditor() != null) {
				daifangheji += ys.getFcreditor();
			}
			if (ys.getFdebit() != null) {
				jiefangheji += ys.getFdebit();
			}
		}
		Double heji = daifangheji - jiefangheji + dest.getFcreditor();
		if (heji > 0) {
			jiedaifangxiang = "贷方";
		} else if(heji<0) {
			jiedaifangxiang = "借方";
		}else{
			jiedaifangxiang="平";
		}
		hejijine = Math.abs(heji);
		dest.setFsjzsr(daifangheji + dest.getFcreditor());
		dest.setFhjjdfx(jiedaifangxiang);
		dest.setFhjje(String.format("%.2f", hejijine));
		// 计算每笔合计金额 以上

		cwYingShouManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		return "redirect:/cw/cwYiShou-info-list.do";
	}

	@RequestMapping("cwYiShou-info-remove")
	public String YiShouremove(
			@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes) {
		List<CwYingShou> cwYingShous = cwYingShouManager
				.findByIds(selectedItem);

		cwYingShouManager.removeAll(cwYingShous);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/cw/cwYiShou-info-list.do";
	}

	// ~ ======================================================================
	@Resource
	public void setCwYingShouManager(CwYingShouManager cwYingShouManager) {
		this.cwYingShouManager = cwYingShouManager;
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
