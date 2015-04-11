package com.xthena.jl.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.gcgl.manager.JlShizhongTempManager;
import com.xthena.jl.domain.PjXmImg;
import com.xthena.jl.domain.PjXmJd;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlShiZhongNewManager;
import com.xthena.jl.manager.JlShizhongManager;
import com.xthena.jl.manager.PjXmImgManager;

@Controller
@RequestMapping("jl")
public class JlHomeController {
  
	private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private PjXmImgManager pjXmImgManager;
    
    @Autowired
    private JlDeptManager jlDeptManager;
    
    @Autowired
    private JlShizhongTempManager jlShizhongTempManager;
    
    @RequestMapping("jl-home")
    public String home(Model model,HttpServletRequest request) {
    	long fxmid=jlDeptManager.getXmId(request);
    	
    	if(fxmid==-1){
    		/*  messageHelper.addFlashMessage(redirectAttributes, "request",
    	                "您是管理权限，请先选择项目。");*/
    		 return "../common/jianlibutiaozhuanyemian";
    	}
    	
    	List<PjXmImg> pjXmJds= pjXmImgManager.findBy("fxmid",fxmid );
    	model.addAttribute("xmImgs", pjXmJds);
        return "jl/jl-home";
    }
    
    
    
    @RequestMapping("jldw-info-input")
    public String jldwhome(Model model) {
        return "jl/jldw-info-input";
    }
    
    
    @RequestMapping("zzryzj-info")
    public String zzryzj(Model model) {
        return "jl/zzryzj-info";
    }
    
    @RequestMapping("taizhang-info")
    public String taizhangInfo(Model model) {
        return "jl/taizhang-info";
    }
    
    @RequestMapping("pxjcjl-info")
    public String pxjcjlInfo(Model model) {
        return "jl/pxjcjl-info";
    }
    	
    @RequestMapping("mbzrs-info")
    public String mbzrshome(Model model) {
        return "jl/mbzrs-info";
    }
    
    @RequestMapping("gsdbsy-info")
    public String gsdbsyhome(Model model) {
        return "jl/gsdbsy-info";
    }
    
    @RequestMapping("xmdbsy-info")
    public String xmdbsyhome(Model model) {
        return "jl/xmdbsy-info";
    }
    
    @RequestMapping("jlwzgl-info")
    public String jlwzglhome(Model model) {
        return "jl/jlwzgl-info";
    }

    @RequestMapping("qitaflfg-info")
    public String qitaflfghome(Model model) {
        return "jl/qitaflfg-info";
    }
    
    @RequestMapping("jlJd-info-input")
    public String jlJdhome(Model model) {
        return "jl/jlJd-info-input";
    }
    
    @RequestMapping("jlzz-info-input")
    public String jlzzhome(Model model) {
        return "jl/jlzz-info-input";
    }
    
    @RequestMapping("jl-sz-zlkz-input")
    public String zlkzhome(Model model) {
        return "jl/jl-sz-zlkz-input";
    }
    @RequestMapping("jl-sz-jdkz-input")
    public String jdkzhome(Model model) {
        return "jl/jl-sz-jdkz-input";
    }
    @RequestMapping("jl-sz-aqgl-input")
    public String aqglhome(Model model) {
    	
        return "jl/jl-sz-aqgl-input";
    }
    
    @RequestMapping("jl-sz-aqgl-input-new")
    public String aqglhomenew(Model model) {
    	model.addAttribute("aqList",jlShizhongTempManager.find("select jlShizhong from JlShizhongTemp jlShizhong where ftype=? order by forder", "1"));
    	//model.addAttribute("aqList",jlShizhongTempManager.findBy("ftype","1"));
        return "jl/jl-sz-aqgl-input-new";
    }
    
    @RequestMapping("jl-sz-htgl-input")
    public String htglhome(Model model) {
        return "jl/jl-sz-htgl-input";
    }
    
    @RequestMapping("jl-sz-xxgl-input")
    public String xxglhome(Model model) {
        return "jl/jl-sz-xxgl-input";
    }
    
    @RequestMapping("jl-sz-tzkz-input")
    public String tzglhome(Model model) {
        return "jl/jl-sz-tzkz-input";
    }
    
    
    @RequestMapping("jl-sq-jdimg-info")
    public String sqjdhome(Model model) {
        return "jl/jl-sq-jdimg-info";
    }
    
    @RequestMapping("jl-sq-jlbimg-info")
    public String sqjlbhome(Model model) {
        return "jl/jl-sq-jlbimg-info";
    }

    
}
