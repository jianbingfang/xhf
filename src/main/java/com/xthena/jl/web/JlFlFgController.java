package  com.xthena.jl.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.jl.domain.JlFlFg;
import com.xthena.jl.manager.JlFlFgManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlFlFgController {
    private JlFlFgManager jlFlFgManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlFlFg-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlFlFgManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlFlFg-info-list";
    }
    
    @RequestMapping("yifa3tiaoli-info")
    public String yifa3tiaolihome(Model model) {
    	List<JlFlFg> jlFlFgs=jlFlFgManager.getAll("forder",true);
    	LinkedHashMap<String, List<JlFlFg>> jlFlfgHashMap=new LinkedHashMap<String, List<JlFlFg>>();
    	for(JlFlFg jlFlFg:jlFlFgs){
    		if(jlFlfgHashMap.containsKey(jlFlFg.getFtype())){
    			jlFlfgHashMap.get(jlFlFg.getFtype()).add(jlFlFg);
    		}else{
    			List<JlFlFg> jlFgsForMap=new ArrayList<JlFlFg>();
    			jlFgsForMap.add(jlFlFg);
    			jlFlfgHashMap.put(jlFlFg.getFtype(), jlFgsForMap);
    		}
    	}
    	model.addAttribute("modal", jlFlfgHashMap);
        return "jl/yifa3tiaoli-info";
    }
    
    
    @RequestMapping("jlFlFg-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlFlFg jlFlFg = jlFlFgManager.get(id);
            model.addAttribute("model", jlFlFg);
        }

        return "jl/jlFlFg-info-input";
    }

    @RequestMapping("jlFlFg-info-save")
    public String save(@ModelAttribute JlFlFg jlFlFg,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlFlFg dest = null;

        Long id = jlFlFg.getFid();

        if (id != null) {
            dest = jlFlFgManager.get(id);
            beanMapper.copy(jlFlFg, dest);
        } else {
            dest = jlFlFg;
        }

        jlFlFgManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlFlFg-info-list.do";
    }

    @RequestMapping("jlFlFg-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlFlFg> jlFlFgs = jlFlFgManager.findByIds(selectedItem);

        jlFlFgManager.removeAll(jlFlFgs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlFlFg-info-list.do";
    }

    @RequestMapping("jlFlFg-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlFlFgManager.pagedQuery(page, propertyFilters);

        List<JlFlFg> jlFlFgs = (List<JlFlFg>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlFlFg info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlFlFgs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlFlFgManager(JlFlFgManager jlFlFgManager) {
        this.jlFlFgManager = jlFlFgManager;
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
