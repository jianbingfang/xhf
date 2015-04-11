package  com.xthena.jl.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;

import com.xthena.jl.domain.JlKqFujian;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlKqFujianManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.PjXmMapUtil;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlKqFujianController {
    private JlKqFujianManager jlKqFujianManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private PjXmManager pjXmManager;
    
    @Autowired
    private JlDeptManager jlDeptManager;
    
    @RequestMapping("jlKqFujian-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fxmid", required = false) Long fxmid,
    		@RequestParam(value = "fkqid", required = false) Long fkqid,
            @RequestParam Map<String, Object> parameterMap, Model model,HttpServletRequest request) {
    	
    	parameterMap.put("filter_EQL_fkqid",fkqid);
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
		page= jlKqFujianManager.pagedQuery(page, propertyFilters);
		
        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	
        return "jl/jlKqFujian-info-list";
    }

    @RequestMapping("jlKqFujian-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
        if (id != null) {
            JlKqFujian jlKqFujian = jlKqFujianManager.get(id);
            model.addAttribute("model", jlKqFujian);
        }
        
        if(id==null&fxmid!=null){
	       		JlKqFujian jlKqFujian =new JlKqFujian();
	       		jlKqFujian.setFxmid(fxmid);
       	 	model.addAttribute("model", jlKqFujian);
        }
        
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	
        return "jl/jlKqFujian-info-input";
    }

    @RequestMapping("jlKqFujian-info-save")
    public String save(@ModelAttribute JlKqFujian jlKqFujian,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlKqFujian dest = null;

        Long id = jlKqFujian.getFid();

        if (id != null) {
            dest = jlKqFujianManager.get(id);
            beanMapper.copy(jlKqFujian, dest);
        } else {
            dest = jlKqFujian;
        }

        jlKqFujianManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlKqFujian-info-list.do";
    }
    
    @RequestMapping("jl-kq-fujian-save-ajax")
    public void saveajax(@RequestParam(value = "fileName", required = false) String fileName,
    		@RequestParam(value = "fileUrl", required = false) String fileUrl,
    		@RequestParam(value = "kqId", required = false) Long fkqid,
    		HttpServletResponse response){
    	JlKqFujian jlFujian=new JlKqFujian();
    	jlFujian.setFkqname(fileName);
    	jlFujian.setFkqurl(fileUrl);
    	jlFujian.setFuploaddate(new Date());
    	jlFujian.setFkqid(fkqid);
    	
    	jlKqFujianManager.save(jlFujian);
    	JsonResponseUtil.write(response, "上传成功！");
    }

    @RequestMapping("jlKqFujian-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlKqFujian> jlKqFujians = jlKqFujianManager.findByIds(selectedItem);

        jlKqFujianManager.removeAll(jlKqFujians);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-kq-input.do?id="+jlKqFujians.get(0).getFkqid();
    }

    @RequestMapping("jlKqFujian-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlKqFujianManager.pagedQuery(page, propertyFilters);

        List<JlKqFujian> jlKqFujians = (List<JlKqFujian>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("JlKqFujian info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlKqFujians);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlKqFujianManager(JlKqFujianManager jlKqFujianManager) {
        this.jlKqFujianManager = jlKqFujianManager;
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
