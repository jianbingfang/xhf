package  com.xthena.jl.web;

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
import com.xthena.gcgl.domain.PjNy;
import com.xthena.gcgl.domain.PjNyList;

import com.xthena.jl.domain.JlWzbackAsk;
import com.xthena.jl.domain.JlWzbackaskList;
import com.xthena.jl.manager.JlWzbackAskManager;
import com.xthena.jl.manager.JlWzbackaskListManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlWzbackaskListController {
    private JlWzbackaskListManager jlWzbackaskListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private JlWzbackAskManager jlWzbackAskManager;

    @RequestMapping("jlWzbackaskList-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "mainid", required = false) Long mainid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQL_fbackid",mainid);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlWzbackaskListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlWzbackaskList-info-list";
    }

    @RequestMapping("jlWzbackaskList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "mainid", required = false) Long mainid,
            Model model) {
        if (id != null) {
            JlWzbackaskList jlWzbackaskList = jlWzbackaskListManager.get(id);
            model.addAttribute("model", jlWzbackaskList);
        }
        if(mainid==null&&id==null){
        	JlWzbackAsk jlWzbackAsk=new JlWzbackAsk();
        	jlWzbackAskManager.save(jlWzbackAsk);
        	JlWzbackaskList jlWzbackaskList =new JlWzbackaskList();
    		jlWzbackaskList.setFbackid(mainid);
    		mainid=jlWzbackAsk.getFid();
    		model.addAttribute("model", jlWzbackaskList);
    	}else if(mainid!=null&&id==null){
    		JlWzbackaskList jlWzbackaskList =new JlWzbackaskList();
    		jlWzbackaskList.setFbackid(mainid);
    		model.addAttribute("model", jlWzbackaskList);
    	}else if(mainid!=null&&id!=null){
    		JlWzbackaskList jlWzbackaskList = jlWzbackaskListManager.get(id);
            model.addAttribute("model", jlWzbackaskList);
        }
    	
        
        return "jl/jlWzbackaskList-info-input";
    }

    @RequestMapping("jlWzbackaskList-info-save")
    public String save(@ModelAttribute JlWzbackaskList jlWzbackaskList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlWzbackaskList dest = null;

        Long id = jlWzbackaskList.getFid();

        if (id != null) {
            dest = jlWzbackaskListManager.get(id);
            beanMapper.copy(jlWzbackaskList, dest);
        } else {
            dest = jlWzbackaskList;
        }

        jlWzbackaskListManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        
        return "redirect:/jl/jlWzbackAsk-info-input.do?id="+dest.getFbackid();
    }

    @RequestMapping("jlWzbackaskList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,@RequestParam("mainid") Long mainid,
            RedirectAttributes redirectAttributes) {
        List<JlWzbackaskList> jlWzbackaskLists = jlWzbackaskListManager.findByIds(selectedItem);

        jlWzbackaskListManager.removeAll(jlWzbackaskLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        
        return "redirect:/jl/jlWzbackAsk-info-input.do?id="+mainid;
    }

    @RequestMapping("jlWzbackaskList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlWzbackaskListManager.pagedQuery(page, propertyFilters);

        List<JlWzbackaskList> jlWzbackaskLists = (List<JlWzbackaskList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlWzbackaskList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlWzbackaskLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlWzbackaskListManager(JlWzbackaskListManager jlWzbackaskListManager) {
        this.jlWzbackaskListManager = jlWzbackaskListManager;
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
