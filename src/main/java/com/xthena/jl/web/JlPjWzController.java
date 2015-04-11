package  com.xthena.jl.web;

import java.util.ArrayList;
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

import com.xthena.gcgl.domain.PjWz;
import com.xthena.gcgl.manager.PjWzManager;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.SessionUtil;
import com.xthena.util.WzMapUtil;
import com.xthena.xz.domain.WzKind;
import com.xthena.xz.manager.WzKindManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlPjWzController {
    private PjWzManager pjWzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private WzKindManager wzKindManager;


    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jl-pjWz-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "wzKind", required = false) Long wzKind,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	String wzKindStr=null;
    	
    	if(wzKind!=null && wzKind == 1){//1代表固定资产好了 URL传参还需要转码解码
    		wzKindStr="是";
    	}
    	
    	if(wzKind!=null && wzKind == 2){//2代表低值易耗品好了 URL传参还需要转码解码
    		wzKindStr="否";
    	}
    	
    	if(wzKindStr!=null){
    		parameterMap.put("filter_EQS_fisassets", wzKindStr);
    		parameterMap.put("filter_EQL_fxmid",jlDeptManager.getXmId(request));
    	}
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjWzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap",CommRyMapUtil.getRyMap());
        model.addAttribute("wzMap", WzMapUtil.getWzMap());
        return "jl/pjWz-info-list";
    }

    @RequestMapping("jl-pjWz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjWz pjWz = pjWzManager.get(id);
            model.addAttribute("model", pjWz);
        }
        model.addAttribute("wzMap", WzMapUtil.getWzMap());
        return "jl/pjWz-info-input";
    }

    @RequestMapping("jl-pjWz-info-ask")
    public String save(@ModelAttribute PjWz pjWz,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjWz dest = null;

        Long id = pjWz.getFid();

        if (id != null) {
            dest = pjWzManager.get(id);
            beanMapper.copy(pjWz, dest);
        } else {
            dest = pjWz;
            dest.setFstatus(1);//申请中，待审核
        }

        pjWzManager.save(dest);
        long wzKind=0;
        if(dest.getFisassets().equals("是")){
        	wzKind=1;
        }else{
        	wzKind=2;
        }

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-pjWz-info-list.do?wzKind="+wzKind;
    }
    
    @RequestMapping("jl-pjWz-info-bakask")
    public String bakask(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {

    	
    	String wzKind=pjWzManager.wzBack(selectedItem);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "归还申请已发出");

        return "redirect:/jl/jl-pjWz-info-list.do?wzKind="+wzKind;
    }
    

    @RequestMapping("jl-pjWz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjWz> pjWzs = pjWzManager.findByIds(selectedItem);

        pjWzManager.removeAll(pjWzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-pjWz-info-list.do";
    }

    @RequestMapping("jl-pjWz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjWzManager.pagedQuery(page, propertyFilters);

        List<PjWz> pjWzs = (List<PjWz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjWz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjWzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjWzManager(PjWzManager pjWzManager) {
        this.pjWzManager = pjWzManager;
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
