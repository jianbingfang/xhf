package com.xthena.xz.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.manager.JlFujianManager;
import com.xthena.sckf.domain.CommHt;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.DateJsonValueProcessor;
import com.xthena.util.JsonResponseUtil;
import com.xthena.xz.domain.XzZj;
import com.xthena.xz.manager.XzZjDxlistManager;
import com.xthena.xz.manager.XzZjManager;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzZjController {
	private XzZjManager xzZjManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private UserConnector userConnector;
	private MessageHelper messageHelper;

	@Autowired
	private JlFujianManager jlFujianManager;

	@RequestMapping("xzZj-info-list")
	public void list(@ModelAttribute Page page,@RequestParam(value = "fname", required = false) String fname,
            @RequestParam Map<String, Object> parameterMap, Model model,HttpServletResponse response) {
		/*List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzZjManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);

		return "xz/xzZj-info-list";*/
		// 根据人员姓名查询
				StringBuffer hql=new StringBuffer("select zj from XzZj zj  where 1=1");
				if (fname != null) {
					hql.append(" and zj.fname like '"+fname+"'");
			    }else if(parameterMap.get("filter_LIKES_fname") != null &&!parameterMap.get("filter_LIKES_fname").equals(""))
					{
						hql.append(" and zj.fname like '%"+parameterMap.get("filter_LIKES_fname") +"%' ");
					}
				
					if(parameterMap.get("filter_GTD_fendate") != null && !parameterMap.get("filter_GTD_fendate") .equals("")){
						hql.append(" and  zj.fendate> '"+String.valueOf(parameterMap.get("filter_GTD_fendate"))+"'");
					}
					if(parameterMap.get("filter_LTD_fendate") != null && !parameterMap.get("filter_LTD_fendate") .equals("") ){
						hql.append(" and  zj.fendate<'"+String.valueOf(parameterMap.get("filter_LTD_fendate"))+"'");
					}

				parameterMap.clear();
				List<PropertyFilter> propertyFilters = PropertyFilter
						.buildFromMap(parameterMap);
				List result = xzZjManager.find(hql.toString());
				
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
	
	 @RequestMapping("xzZj-treelist")
	    public String treelist(@ModelAttribute Page page,
	            @RequestParam Map<String, Object> parameterMap, Model model) {
	      
	    //	StringBuffer hql1 = new StringBuffer("select ry from CommRy ry,HrRyZj ys  where ry.fid=ys.userid");
	    	// 根据人员姓名查询
			StringBuffer hql=new StringBuffer("select zj from XzZj zj where 1=1");//
		 if(parameterMap.get("filter_LIKES_fname") != null &&!parameterMap.get("filter_LIKES_fname").equals(""))
			{
				hql.append(" and zj.fname like '%"+parameterMap.get("filter_LIKES_fname") +"%' ");
			}
		
			if(parameterMap.get("filter_GTD_fendate") != null && !parameterMap.get("filter_GTD_fendate") .equals("")){
				hql.append(" and  zj.fendate> '"+String.valueOf(parameterMap.get("filter_GTD_fendate"))+"'");
			}
			if(parameterMap.get("filter_LTD_fendate") != null && !parameterMap.get("filter_LTD_fendate") .equals("") ){
				hql.append(" and  zj.fendate<'"+String.valueOf(parameterMap.get("filter_LTD_fendate"))+"'");
			}
			hql.append(" group by zj.fname ");
			
			List zjList = xzZjManager.find(hql.toString(), parameterMap);
			//page = xzZjManager.pagedQuery(hql.toString(), page.getPageNo(),page.getPageSize());
			

			 hql=new StringBuffer("select count(zj) from XzZj zj  where 1=1");//
			 
			 if(parameterMap.get("filter_LIKES_fname") != null &&!parameterMap.get("filter_LIKES_fname").equals(""))
				{
					hql.append(" and zj.fname like '%"+parameterMap.get("filter_LIKES_fname") +"%' ");
				}
				if(parameterMap.get("filter_GTD_fendate") != null && !parameterMap.get("filter_GTD_fendate") .equals("")){
					hql.append(" and  zj.fendate> '"+String.valueOf(parameterMap.get("filter_GTD_fendate"))+"'");
				}
				if(parameterMap.get("filter_LTD_fendate") != null && !parameterMap.get("filter_LTD_fendate") .equals("") ){
					hql.append(" and  zj.fendate<'"+String.valueOf(parameterMap.get("filter_LTD_fendate"))+"'");
				}
			
				hql.append(" group by zj.fname ");
			
				
			List result=xzZjManager.find(hql.toString());
			page.setTotalCount(result.size());
			
	    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
	        model.addAttribute("zjList", zjList);
	        model.addAttribute("hql", hql.toString());
				return "xz/xzZj-info-list";
	    	}
	    

	@RequestMapping("xzZj-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id,
			Model model) {
		if (id != null) {
			XzZj xzZj = xzZjManager.get(id);
			model.addAttribute("model", xzZj);
		}
		return "xz/xzZj-info-input";
	}

	@RequestMapping("xzZj-info-save")
	public String save(@ModelAttribute XzZj xzZj,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
		XzZj dest = null;

		Long id = xzZj.getFid();

		if (id != null) {
			dest = xzZjManager.get(id);
			beanMapper.copy(xzZj, dest);
		} else {
			dest = xzZj;
		}

		xzZjManager.mysave(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		//return "redirect:/xz/xzZj-info-list.do";
		return "redirect:/xz/xzZj-treelist.do";
	}

	@RequestMapping("xzZj-info-removeitem")
	@ResponseBody
	public String remove1(@ModelAttribute XzZj hrRyZj,
						 RedirectAttributes redirectAttributes, HttpServletRequest request) {

		String[] selectitems= request.getParameter("selecteditems").split("@");

		List<Long> Selectedlist= new ArrayList<>();

		for(int i=0; i<selectitems.length; i++){
			Long cur=Long.parseLong(selectitems[i]);
			Selectedlist.add(cur);
		}

		List<XzZj> hrRyZjs = xzZjManager.findByIds(Selectedlist);
		xzZjManager.removeAll(hrRyZjs);
		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return null;
		//return "redirect:/hr/hrRyZj-info-list";
	}





	@RequestMapping("xzZj-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		List<XzZj> xzZjs = xzZjManager.findByIds(selectedItem);

		xzZjManager.removeAll(xzZjs);

		messageHelper.addFlashMessage(redirectAttributes,
				"core.success.delete", "删除成功");

		return "redirect:/xz/xzZj-info-list.do";
	}

	@RequestMapping("xzZj-info-export")
	public void export(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletResponse response) throws Exception {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = xzZjManager.pagedQuery(page, propertyFilters);

		List<XzZj> xzZjs = (List<XzZj>) page.getResult();

		TableModel tableModel = new TableModel();
		// tableModel.setName("xzZj info");
		// tableModel.addHeaders("id", "name");
		tableModel.setData(xzZjs);
		exportor.export(response, tableModel);
	}

	@RequestMapping("saveZjScan")
	public void saveZjScan(@RequestParam("zjId") Long zjid,
			@RequestParam("tableName") String tableName,
			@RequestParam("jlFujians") String fujians,
			HttpServletResponse response) {

		JSONArray jsonArray = JSONArray.fromObject(fujians);

		for (int i = 0; i < jsonArray.size(); i++) {
			JlFujian jlFujian = new JlFujian();
			jlFujian.setFname(jsonArray.getJSONObject(i).getString("fname"));
			jlFujian.setFurl(jsonArray.getJSONObject(i).getString("furl"));
			jlFujian.setFmainid(zjid);
			jlFujian.setFtablename(tableName);
			jlFujianManager.save(jlFujian);
		}

		JsonResponseUtil.write(response, "ok");
	}



	@RequestMapping("deleteImg")
	public void deleteImg(@RequestParam("fjId") Long fjId,
			HttpServletResponse response) {
		jlFujianManager.removeById(fjId);
		JsonResponseUtil.write(response, "ok");
	}

	// ~ ======================================================================
	@Resource
	public void setXzZjManager(XzZjManager xzZjManager) {
		this.xzZjManager = xzZjManager;
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
