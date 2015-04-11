package com.xthena.gcgl.web;

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
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.ConstValue;
import com.xthena.util.SessionUtil;

@Controller
@RequestMapping("gcgl")
public class GcglHomeController {
  
	@Autowired
	private HrGwbmManager hrGwbmManager;
	
	private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private CommHtManager commHtManager;

    @RequestMapping("gcgl-home")
    public String home(Model model) {
        return "gcgl/gcgl-home";
    }
    
    
    @RequestMapping("gcgl-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
    	long deptId=ConstValue.DEPT_ID_GCGL;
    	hrGwbmManager.find(deptId,model);
    	model.addAttribute("model",model);
    	return "gcgl/gcgl-bmze-info";
    }
    
    //项目管理和技术这次
    @RequestMapping("xmsj-info-input")
    public String xmSjInput(Model model) {
        return "gcgl/xmsj-info-input";
    }
    
    //项目撤点
    @RequestMapping("xmcd-info-input")
    public String xmcdInput(Model model) {
        return "gcgl/xmcd-info-input";
    }
    //项目内业
    @RequestMapping("xmny-info-input")
    public String xmnyInput(Model model) {
        return "gcgl/xmny-info-input";
    }
    
 /*   //合同
    @RequestMapping("gcgl-commHt-info-input")
    public String commHtInput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        CommHt commHt = commHtManager.get(id);
        model.addAttribute("model", commHt);
        return "gcgl/commHt-info-input";
    }*/
    
    //合同
    @RequestMapping("jl-home")
    public String goJlHome(@RequestParam(value = "id", required = false) Long id,
            Model model) {
       SessionUtil.setXmId(userConnector);
       return "redirect:/jl/jl-home.do";
    }
}
