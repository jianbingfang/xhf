package  com.xthena.jl.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.jl.domain.JlWzbackAsk;
import com.xthena.jl.domain.JlWzbackaskList;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlWzbackAskManager;
import com.xthena.jl.manager.JlWzbackaskListManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.SessionUtil;
import com.xthena.util.WzMapUtil;
import com.xthena.xz.domain.WzTable;
import com.xthena.xz.manager.WzTableManager;

@Controller
@RequestMapping("jl")
public class JlWzbackAskController {
    private JlWzbackAskManager jlWzbackAskManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private JlWzbackaskListManager jlWzbackaskListManager;
    
    @Autowired
    private WzTableManager wzTableManager;
    
    @Autowired
    private CommRyManager commRyManager;


    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jlWzbackAsk-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQL_fxmid",jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlWzbackAskManager.pagedQuery(page, propertyFilters);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("page", page);

        return "jl/jlWzbackAsk-info-list";
    }

    @RequestMapping("jlWzbackAsk-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@ModelAttribute Page page,
            Model model) {
        if (id != null) {
        	
            JlWzbackAsk jlWzbackAsk = jlWzbackAskManager.get(id);
            model.addAttribute("model", jlWzbackAsk);
            Map<String, Object> parameterMap=new HashMap<String, Object>();
            parameterMap.put("filter_EQL_fbackid",jlWzbackAsk.getFid());
            List<PropertyFilter> propertyFilters = PropertyFilter
                    .buildFromMap(parameterMap);
            page = jlWzbackaskListManager.pagedQuery(page, propertyFilters);
           
            model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
            model.addAttribute("wzMap", WzMapUtil.getWzMap());
            model.addAttribute("page", page);
        }

        return "jl/jlWzbackAsk-info-input";
    }

    @RequestMapping("jlWzbackAsk-info-save")
    public String save(@ModelAttribute JlWzbackAsk jlWzbackAsk,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlWzbackAsk dest = null;

        Long id = jlWzbackAsk.getFid();

        if (id != null) {
            dest = jlWzbackAskManager.get(id);
            beanMapper.copy(jlWzbackAsk, dest);
        } else {
            dest = jlWzbackAsk;
        }
        dest.setFxmid(jlDeptManager.getXmId(request));
        jlWzbackAskManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlWzbackAsk-info-list.do";
    }

    @RequestMapping("jlWzbackAsk-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlWzbackAsk> jlWzbackAsks = jlWzbackAskManager.findByIds(selectedItem);

        jlWzbackAskManager.removeAll(jlWzbackAsks);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlWzbackAsk-info-list.do";
    }

    @RequestMapping("jlWzbackAsk-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlWzbackAskManager.pagedQuery(page, propertyFilters);

        List<JlWzbackAsk> jlWzbackAsks = (List<JlWzbackAsk>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlWzbackAsk info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlWzbackAsks);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlWzbackAskManager(JlWzbackAskManager jlWzbackAskManager) {
        this.jlWzbackAskManager = jlWzbackAskManager;
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
