package com.xthena.gh.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;

@Controller
@RequestMapping("gh")
public class GhHomeController {
  
	private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("gh-home")
    public String home(Model model) {
        return "gh/gh-home";
    }
    @RequestMapping("gh-zc")
    public String zc(Model model) {
        return "gh/ghzc";
    }
    @RequestMapping("ghf")
    public String ghf(Model model) {
        return "gh/ghf";
    }
    @RequestMapping("ldf")
    public String ldf(Model model) {
        return "gh/ldf";
    }
}
