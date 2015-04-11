package com.xthena.cw.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.util.ConstValue;

@Controller
@RequestMapping("cw")
public class CwHomeController {
  
	private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private HrGwbmManager hrGwbmManager;
    
    @RequestMapping("cw-home")
    public String home(Model model) {
        return "cw/cw-home";
    }
    
    @RequestMapping("cw-report")
    public String reportHome(Model model) {
        return "cw/cw-report";
    }
    
    @RequestMapping("cw-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
    	long deptId=ConstValue.DEPT_ID_CW;
    	hrGwbmManager.find(deptId,model);
    	model.addAttribute("model",model);
    	return "cw/cw-bmze-info";
    }
}
