package com.xthena.workflow.web;


import com.xthena.cw.domain.CwBzj;
import com.xthena.workflow.domain.QingjiaEntity;
//import org.activiti.engine.repository.Model;
import com.xthena.workflow.manager.QingjiaManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.ui.Model;
/**
 * Created by xi on 2015/7/5.
 */
@Controller
@RequestMapping("workflow")
public class QingjiaController {

    @Autowired
    private QingjiaManager qingjiaManager;



    @RequestMapping("Qingjia-form-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
                        @RequestParam(value = "type", required = false) String type,
                        Model model) {
        QingjiaEntity qingjiaEntity= new QingjiaEntity();
        model.addAttribute("model", qingjiaEntity);
        return "workflow/Qingjia-form-input";
    }

//    @RequestMapping("Qingjia-form-save")
//    public String save(@RequestParam(value = "id", required = false) Long id,
//                        @RequestParam(value = "type", required = false) String type,
//                        Model model) {
//
//        QingjiaEntity qingjiaEntity= new QingjiaEntity();
//
//
//        model.addAttribute("model", qingjiaEntity);
//
//
//        return "workflow/Qingjia-form-input";
//    }


    @RequestMapping("Qingjia-form-save")
    public String lysave(@ModelAttribute QingjiaEntity qingjiaEntity) {
        QingjiaEntity dest = null;
        dest = qingjiaEntity;
        //同时发起流程
        qingjiaManager.SaveForQingjia(dest);
        return "redirect:/menu/dashboard.do" ;
    }


}
