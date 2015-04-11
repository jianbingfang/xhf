package com.xthena.common.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xthena.util.PoiToHtmlUtil;
import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;



@Controller
@RequestMapping("common")
public class OfficePreviewController {
	
	  @RequestMapping("preview")
	    public String menuRoleInput(@RequestParam(value = "fileUrl", required = false) String fileUrl,HttpServletRequest request,
	             Model model) {
	    	
			PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
			poCtrl1.setServerPage(request.getContextPath()+"/common/poserver.zz"); //此行必须
			poCtrl1.setSaveFilePage("savefile.jsp");//如要保存文件，此行必须
			//打开文件
			
			if(fileUrl.endsWith("xls")||fileUrl.endsWith("xlsx")){
				poCtrl1.webOpen(fileUrl, OpenModeType.xlsNormalEdit, "");
			}else if(fileUrl.endsWith("doc")||fileUrl.endsWith("docx")){
				poCtrl1.webOpen(fileUrl, OpenModeType.docNormalEdit, "");
			}
			poCtrl1.setTagId("PageOfficeCtrl1"); //此行必须	 
			
	        return "comm/docPriview";
	    }
	  
	  
	  @RequestMapping("preview2")
	  @ResponseBody
	    public String menuRoleInput2(@RequestParam(value = "fileUrl", required = false) String fileUrl,HttpServletRequest request,
	             Model model) throws Exception {
		  return  PoiToHtmlUtil.wordToHtml(fileUrl);
	  }
	
}
