package com.xthena.common.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.common.domain.XhfCommonPlain;
import com.xthena.common.manager.XhfCommonPlainManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CodeUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.manager.CodeGenManager;

@Controller
@RequestMapping("comm")
public class XhfCommPlainController {
	
	@Autowired
	private CodeGenManager codeGenManager;
   
	private XhfCommonPlainManager xhfCommonPlainManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    
    @RequestMapping("plain-info-input")
    public String input(@RequestParam(value = "taskId", required = false) Long taskid,
            Model model) {
        
    	if (taskid != null) {
            XhfCommonPlain xhfCommonPlain = xhfCommonPlainManager.loadPlain(String.valueOf(taskid));
            model.addAttribute("model", xhfCommonPlain);
            model.addAttribute("taskId", taskid);
        }

        return "comm/plain-info-input";
    }
    
    
    @RequestMapping("plain-info-save")
    public String save(@ModelAttribute  XhfCommonPlain xhfCommonPlain,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
           xhfCommonPlainManager.savePlain(xhfCommonPlain,String.valueOf(parameterMap.get("taskId")));
        return "redirect:/dashboard/dashboard.do";
    }

    
    // ~ ======================================================================
    @Resource
    public void setxhfCommonPlainManager(XhfCommonPlainManager xhfCommonPlainManager) {
        this.xhfCommonPlainManager = xhfCommonPlainManager;
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
