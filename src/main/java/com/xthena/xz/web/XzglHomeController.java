package com.xthena.xz.web;

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
@RequestMapping("xz")
public class XzglHomeController {
  
	@Autowired
	private HrGwbmManager hrGwbmManager;
	private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xz-home")
    public String home(Model model) {
        return "xz/xz-home";
    }
    
    @RequestMapping("xz-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
    	long deptId=ConstValue.DEPT_ID_XZ;
    	hrGwbmManager.find(deptId,model);
    	model.addAttribute("model",model);
    	return "xz/xz-bmze-info";
    }
}
