package  com.xthena.gcgl.web;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.domain.JyXmYj;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.HtMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.JyXmMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.sckf.manager.JyXmYjManager;
import com.xthena.jl.manager.JlDeptManager;

import org.hibernate.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjXmController {
    private PjXmManager pjXmManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private JlDeptManager jlDeptManager;

    @Autowired
    private JyXmYjManager jyXmYjManager;

    @Autowired
    private JyXmManager jyXmManager;
    @PostConstruct
    public void intRmMap(){
    	PjXmMapUtil.initRyMap(pjXmManager);
    }
    
    
    @RequestMapping("pjXm-manager-list")
    public String listXmForManager(@ModelAttribute Page page,@RequestParam(value = "fstatus", required = false) Long fstatus,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	StringBuffer hql = new StringBuffer();
    	hql.append("from PjXm where (fmemo1<>'1' OR fmemo1 is null) and fonline='1' ");//1代表在线
    	if(fstatus!= null&&fstatus==1){
    		hql.append(" and fxmstatus='在建'");
    	}else if(fstatus!= null&&fstatus==2){
    		hql.append(" and fxmstatus='完工'");
    	}else if(fstatus!= null&&fstatus==3){
    		hql.append(" and fxmstatus='竣工'");
    	}
    	if(parameterMap.get("filter_LIKES_fxmno") != null && parameterMap.get("filter_LIKES_fxmno").toString().trim() !="")
    	{
    		hql.append(" and fxmno like '%"+parameterMap.get("filter_LIKES_fxmno").toString().trim()+"%'");
    	}
    	parameterMap.remove("filter_LIKES_fxmno");
    	if(parameterMap.get("filter_LIKES_fxmname") != null && parameterMap.get("filter_LIKES_fxmname").toString().trim() !="")
    	{
    		hql.append(" and fxmname like '%"+parameterMap.get("filter_LIKES_fxmname").toString().trim()+"%'");
    	}
    	parameterMap.remove("filter_LIKES_fxmname");
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmManager.pagedQuery(hql.toString(),page, propertyFilters);
        model.addAttribute("page", page);   
        return "gcgl/pjXm-manager-list";
    }
    
    @RequestMapping("gc-jl-home")
    public String gcjlhome(Model model,HttpServletRequest request,@RequestParam(value = "fxmid", required = false) Long fxmid) {
    	jlDeptManager.setXmId(request, fxmid);
        return "redirect:/jl/jl-home.do";
    }
    
    

    @RequestMapping("pjXm-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fstatus", required = false) Long fstatus,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	StringBuffer hql = new StringBuffer();
    	hql.append("from PjXm where (fmemo1<>'1' OR fmemo1 is null)  ");
    	if(fstatus!= null&&fstatus==1){
    		hql.append(" and fxmstatus='在建'");
    	}else if(fstatus!= null&&fstatus==2){
    		hql.append(" and fxmstatus='完工'");
    	}else if(fstatus!= null&&fstatus==3){
    		hql.append(" and fxmstatus='竣工'");
    	}
    	if(parameterMap.get("filter_LIKES_fxmno") != null && parameterMap.get("filter_LIKES_fxmno").toString().trim() !="")
    	{
    		hql.append(" and fxmno like '%"+parameterMap.get("filter_LIKES_fxmno").toString().trim()+"%'");
    	}
    	parameterMap.remove("filter_LIKES_fxmno");
    	if(parameterMap.get("filter_LIKES_fxmname") != null && parameterMap.get("filter_LIKES_fxmname").toString().trim() !="")
    	{
    		hql.append(" and fxmname like '%"+parameterMap.get("filter_LIKES_fxmname").toString().trim()+"%'");
    	}
    	parameterMap.remove("filter_LIKES_fxmname");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = pjXmManager.pagedQuery(hql.toString(),page, propertyFilters);
        model.addAttribute("fstatus",fstatus);
        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("htMap", HtMapUtil.getHtMap());
        return "gcgl/pjXm-info-list";
    }

    

    @RequestMapping("pjXm-info-list1")
    public String list1(@ModelAttribute Page page,@RequestParam(value = "fstatus", required = false) Long fstatus,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	StringBuffer hql = new StringBuffer();
    	hql.append("from PjXm where (fmemo1<>'1' OR fmemo1 is null)  ");
    	if(fstatus!= null&&fstatus==1){
    		hql.append(" and fxmstatus='在建'");
    	}else if(fstatus!= null&&fstatus==2){
    		hql.append(" and fxmstatus='完工'");
    	}else if(fstatus!= null&&fstatus==3){
    		hql.append(" and fxmstatus='竣工'");
    	}
    	if(parameterMap.get("filter_LIKES_fxmno") != null && parameterMap.get("filter_LIKES_fxmno").toString().trim() !="")
    	{
    		hql.append(" and fxmno like '%"+parameterMap.get("filter_LIKES_fxmno").toString().trim()+"%'");
    	}
    	parameterMap.remove("filter_LIKES_fxmno");
    	if(parameterMap.get("filter_LIKES_fxmname") != null && parameterMap.get("filter_LIKES_fxmname").toString().trim() !="")
    	{
    		hql.append(" and fxmname like '%"+parameterMap.get("filter_LIKES_fxmname").toString().trim()+"%'");
    	}
    	parameterMap.remove("filter_LIKES_fxmname");
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = pjXmManager.pagedQuery(hql.toString(),page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/pjXm-info-list1";
    }



    @RequestMapping("jyXmYj-info-inputforShenpi")
    public String inputforShenpi(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "taskId",
            required = false) String taskid,
                        Model model) {
        PjXm pjXm= new PjXm();
        if (taskid != null) {
            JyXmYj jyXmYj = jyXmYjManager.loadJyXmyj(taskid);
            model.addAttribute("jyxmyj", jyXmYj);
            Long xmid= jyXmYj.getFxmid();
            JyXm jyXm = jyXmManager.get(xmid);
            String xmname= jyXm.getFname();
//            Long zongjianid=jyXm.getFzj();
//            String tze=jyXm.getFtze().toString();
//            String scale=jyXm.getFscale();
//            String address=jyXm.getFprovince()+jyXm.getFcity()+jyXm.getFkbaddress();
            pjXm.setFxmname(xmname);
//            pjXm.setFxmzongjianid(zongjianid);
//            pjXm.setFxmmoney(tze);
//            pjXm.setFjggm(scale);
//            pjXm.setFxmaddr(address);
        }

        model.addAttribute("model", pjXm);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("htMap", HtMapUtil.getHtMap());
       // 结束项目移交流程
        if(taskid!=null) {
            jyXmYjManager.completetask(taskid);
        }
        return "gcgl/jyXmYj-info-inputforShenpi";
    }




    @RequestMapping("pjXm-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "type", required = false) String type,
            Model model) {
        if (id != null) {
            PjXm pjXm = pjXmManager.get(id);
            model.addAttribute("model", pjXm);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("htMap", HtMapUtil.getHtMap());
        return "gcgl/pjXm-info-input";
    }
    
    
    @RequestMapping("pjXm-info-input-fromjy")
    public String inputfromjy(@RequestParam(value = "taskId", required = false) String taskId,
            Model model) {
        
    	model.addAttribute("model", pjXmManager.loadFromJy(taskId));
        model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
        model.addAttribute("taskId",taskId);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("htMap", HtMapUtil.getHtMap());
        return "gcgl/pjXm-info-inputfromjy";
    }
    
    @RequestMapping("pjXm-info-input1")
    public String input1(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "type", required = false) String type,
            Model model) {
        if (id != null) {
            PjXm pjXm = pjXmManager.get(id);
            model.addAttribute("model", pjXm);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("htMap", HtMapUtil.getHtMap());
        return "gcgl/pjXm-info-input1";
    }
    
    
    
    @RequestMapping("pjXm-manager-input")
    public String managerinput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjXm pjXm = pjXmManager.get(id);
            model.addAttribute("model", pjXm);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/pjXm-manager-input";
    }

    
    @RequestMapping("pjXm-manager-save")
    public String managersave(@ModelAttribute PjXm pjXm,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXm dest = null;

        Long id = pjXm.getFid();

        if (id != null) {
            dest = pjXmManager.get(id);
            beanMapper.copy(pjXm, dest);
        } else {
            dest = pjXm;
            dest.setFonline("1");
        }
        
        pjXmManager.save(dest);
        PjXmMapUtil.refreshRyMap(dest);
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        
        return "redirect:/gcgl/pjXm-manager-list.do";
    }
    
    
    @RequestMapping("pjXm-manager-savefromjy")
    public String savefromjy(@ModelAttribute PjXm pjXm,@RequestParam(value = "taskId", required = false) String taskId,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXm dest = null;

        Long id = pjXm.getFid();

        if (id != null) {
            dest = pjXmManager.get(id);
            beanMapper.copy(pjXm, dest);
        } else {
            dest = pjXm;
        }
        
        dest.setFstatus("已接收");
        pjXmManager.saveFromJy(dest,taskId);
        PjXmMapUtil.refreshRyMap(dest);
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        
        return "redirect:/gcgl/pjXm-manager-list.do";
    }
    

    @RequestMapping("pjXm-info-save")
    public String save(@ModelAttribute PjXm pjXm,@RequestParam(value = "type", required = false) String type,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXm dest = null;

        Long id = pjXm.getFid();

        if (id != null) {
            dest = pjXmManager.get(id);
            beanMapper.copy(pjXm, dest);
        } else {
            dest = pjXm;
        }
        
        pjXmManager.save(dest);
        PjXmMapUtil.refreshRyMap(dest);
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjXm-info-list.do";
    }
    
    
    

    @RequestMapping("pjXm-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjXm> pjXms = pjXmManager.findByIds(selectedItem);

        pjXmManager.removeAll(pjXms);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjXm-info-list.do";
    }
    

    @RequestMapping("pjXm-mamager-remove")
    public String mamagerremove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjXm> pjXms = pjXmManager.findByIds(selectedItem);

        pjXmManager.removeAll(pjXms);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjXm-mamager-list.do";
    }

    @RequestMapping("pjXm-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmManager.pagedQuery(page, propertyFilters);

        List<PjXm> pjXms = (List<PjXm>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjXm info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjXms);
        exportor.export(response, tableModel);
    }
    
    @RequestMapping("pjXm-simple-list")
    public void listXm(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,HttpServletResponse response) {
    	
    	List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmManager.pagedQuery(page, propertyFilters);
        JsonResponseUtil.write(response,page);
    }
    //根据项目编号 项目名称查询项目信息
    @RequestMapping("commRy-info-findUser")
    public void listBm(HttpServletResponse response,@RequestParam Map<String, Object> parameterMap) {
    	List<PropertyFilter> propertyFilters = PropertyFilter
              .buildFromMap(parameterMap);
    	List<PjXm> commRies=pjXmManager.find(propertyFilters);
    	JsonResponseUtil.write(response,commRies);
    }
    // ~ ======================================================================
    @Resource
    public void setPjXmManager(PjXmManager pjXmManager) {
        this.pjXmManager = pjXmManager;
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
