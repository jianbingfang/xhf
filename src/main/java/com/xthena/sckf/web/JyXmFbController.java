package com.xthena.sckf.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.domain.JyxmFb;
import com.xthena.sckf.manager.JyXmFbManager;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JyXmMapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;



@Controller
@RequestMapping("sckf")
public class JyXmFbController {
    private JyXmFbManager jyXmFbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JyXmManager jyXmManager;
    
    
    @PostConstruct
    public void intRmMap(){
    	JyXmMapUtil.initRyMap(jyXmManager);
    }
    
    @RequestMapping("jyXmFb-info-list")
    public String list(@ModelAttribute Page page,
        @RequestParam Map<String, Object> parameterMap, Model model) {
            List<PropertyFilter> propertyFilters = PropertyFilter
                    .buildFromMap(parameterMap);
            page = jyXmFbManager.pagedQuery(page, propertyFilters);
            model.addAttribute("page", page);
            model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
            model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
            return "sckf/jyXmFb-info-list";
    }

//    @RequestMapping("jyXmFb-info-input")
//    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
//            Model model) {
//        if (id != null) {
//            JyxmFb jyXmFb = jyXmFbManager.get(id);
//            model.addAttribute("model", jyXmFb);
//        }
//        if(xmid!=null) {
//            model.addAttribute("xm", jyXmManager.get(xmid));
//        }
//
//        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
//        return "sckf/jyXmFb-info-input";
//    }


    @RequestMapping("jyXmFb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
                        @RequestParam (value="name", required = false)String name,  Model model) {

        if (id != null) {
            JyxmFb  jyXmFb = jyXmFbManager.get(id);
            model.addAttribute("model", jyXmFb);
        }
        else
        {
            String hql = "select jyXmFb from JyxmFb jyXmFb where jyXmFb.xiangmuName=?";
            List<JyxmFb> jyxmFb= jyXmFbManager.find(hql, name);
            model.addAttribute("model", jyxmFb.get(0));
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXmFb-info-input";
    }



    @RequestMapping("jyXmFb-info-savefb")
    @ResponseBody
    public String saveFb(@RequestParam(value = "xmid", required = false) Long xmid,
                        Model model, HttpServletRequest request) {
        JyxmFb jyXmFb=null;
        Date date=null;
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");
        jyXmFb=new JyxmFb();
        model.addAttribute("model", jyXmFb);
        String fname=request.getParameter("fname");
        String fkbdate=request.getParameter("fkbdate");
        try {
            date = sdf.parse(fkbdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String ffuzeren=request.getParameter("ffuzeren");

        jyXmFb.setXiangmuName(fname);
        jyXmFb.setKaibiaoData(date);
        jyXmFb.setHost(ffuzeren);
        if(xmid!=null){
            jyXmFb.setFxmid(xmid);
        }
        else{
            JyXm jyXm=new JyXm();
            jyXm.setFname(fname);
            jyXm.setFkbdate(date);
            jyXm.setFfuzeren(ffuzeren);
            jyXmManager.save(jyXm);
        }
        jyXmFbManager.save(jyXmFb);
        //return "sckf/jyXmFb-info-input";
        return  null;
    }


    // 提交表单
//    @RequestMapping("jyXmFb-info-input")
//    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
//                        Model model) {
//        JyxmFb jyXmFb=null;
//        Date date=null;
//        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");
//        if (id != null) {
//            jyXmFb = jyXmFbManager.get(id);
//        }
//        else
//        {
//            jyXmFb=new JyxmFb();
//        }
//        model.addAttribute("model", jyXmFb);
//        return "sckf/jyXmFb-info-input";
//    }


    @RequestMapping("jyXmFb-info-save")
    public String save(@ModelAttribute JyxmFb jyXmFb,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyxmFb dest = null;
        Long id = jyXmFb.getFid();

        if (id != null) {
            dest = jyXmFbManager.get(id);
            beanMapper.copy(jyXmFb, dest);
        } else {
            dest = jyXmFb;
        }

        jyXmFbManager.save(dest);
       // jyXmFbManager.refreshRyMap(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");


       // jyXmFbManager.saveForFb(dest);
        //messageHelper.addFlashMessage(redirectAttributes, "core.success.save","保存成功");
        return "redirect:/sckf/jyXmFb-info-list.do";
    }
//
    @RequestMapping("jyXmFb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyxmFb> jyxmfbs = jyXmFbManager.findByIds(selectedItem);

        jyXmFbManager.removeAll(jyxmfbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyXmFb-info-list.do";
    }

//    @RequestMapping("jyXmYj-info-export")
//    public void export(@ModelAttribute Page page,
//            @RequestParam Map<String, Object> parameterMap,
//            HttpServletResponse response) throws Exception {
//        List<PropertyFilter> propertyFilters = PropertyFilter
//                .buildFromMap(parameterMap);
//        page = jyXmYjManager.pagedQuery(page, propertyFilters);
//
//        List<JyXmYj> jyXmYjs = (List<JyXmYj>) page.getResult();
//
//        TableModel tableModel = new TableModel();
//        //tableModel.setName("jyXmYj info");
//        //tableModel.addHeaders("id", "name");
//        tableModel.setData(jyXmYjs);
//        exportor.export(response, tableModel);


    // ~ ======================================================================
    @Resource
    public void setJyXmFbManager(JyXmFbManager jyXmFbManager) {
        this.jyXmFbManager = jyXmFbManager;
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
