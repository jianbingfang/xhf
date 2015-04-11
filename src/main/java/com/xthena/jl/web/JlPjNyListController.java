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
import com.xthena.gcgl.manager.PjNyListManager;
import com.xthena.gcgl.manager.PjNyManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlPjNyListController {
    private PjNyListManager pjNyListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private PjNyManager pjNyManager;
    
    @RequestMapping("jl-pjNyList-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "mainid", required = false) Long mainid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQL_fnyid",mainid);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjNyListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/pjNyList-info-list";
    }

    @RequestMapping("jl-pjNyList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "mainid", required = false) Long mainid,
            Model model) {
    	
    	if(mainid==null&&id==null){
    		PjNy pjny=new PjNy();
    		pjNyManager.save(pjny);
    		PjNyList pjNyList =new PjNyList();
    		pjNyList.setFnyid(pjny.getFid());
    		mainid=pjny.getFid();
    		model.addAttribute("model", pjNyList);
    	}else if(mainid!=null&&id==null){
    		PjNyList pjNyList =new PjNyList();
    		pjNyList.setFnyid(mainid);
    		model.addAttribute("model", pjNyList);
    	}else if(mainid!=null&&id!=null){
            PjNyList pjNyList = pjNyListManager.get(id);
            model.addAttribute("model", pjNyList);
        }
    	
    	//mainid为空 id不为空理论上不存在

        return "/jl/pjNyList-info-input";
    }

    @RequestMapping("jl-pjNyList-info-save")
    public String save(@ModelAttribute PjNyList pjNyList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjNyList dest = null;

        Long id = pjNyList.getFid();

        if (id != null) {
            dest = pjNyListManager.get(id);
            beanMapper.copy(pjNyList, dest);
        } else {
            dest = pjNyList;
        }

        pjNyListManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-pjNy-info-input.do?id="+dest.getFnyid();
    }

    @RequestMapping("jl-pjNyList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,@RequestParam("mainid") Long mainid,
            RedirectAttributes redirectAttributes) {
        List<PjNyList> pjNyLists = pjNyListManager.findByIds(selectedItem);

        pjNyListManager.removeAll(pjNyLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-pjNy-info-input.do?id="+mainid;
    }

    @RequestMapping("jl-pjNyList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjNyListManager.pagedQuery(page, propertyFilters);

        List<PjNyList> pjNyLists = (List<PjNyList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjNyList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjNyLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjNyListManager(PjNyListManager pjNyListManager) {
        this.pjNyListManager = pjNyListManager;
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
