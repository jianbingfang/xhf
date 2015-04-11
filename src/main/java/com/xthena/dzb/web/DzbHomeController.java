package com.xthena.dzb.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;

@Controller
@RequestMapping("dzb")
public class DzbHomeController {
  
	private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("dzb-home")
    public String home(Model model) {
        return "dzb/dzb-home";
    }
    
    @RequestMapping("dzb-dz")
    public String dz(Model model) {
        return "dzb/dz";
    }
    
    @RequestMapping("dzb-ds")
    public String ds(Model model) {
        return "dzb/ds";
    }
}
