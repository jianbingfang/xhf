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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.SessionUtil;
import com.xthena.jl.domain.JlTouzi;
import com.xthena.jl.domain.JlTouziCount;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlTouziCountManager;
import com.xthena.jl.manager.JlTouziManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlTouziController {
    private JlTouziManager jlTouziManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlTouziCountManager jlTouziCountManager;
    
    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jlTouzi-info-list2")
    public String list2(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
      
    	JlTouziCount jlTouziCount= jlTouziCountManager.findUniqueBy("fxmid", jlDeptManager.getXmId(request));
        model.addAttribute("jlTouziCount", jlTouziCount);
        return "jl/jlTouzi-info-list2";
    }
    
    @RequestMapping("jlTouzi-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,@RequestParam(value = "ftype", required = false) Integer ftype,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	parameterMap.put("filter_EQI_ftype", ftype);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlTouziManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlTouzi-info-list";
    }


    @RequestMapping("jlTouzi-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ftype", required = false) Integer ftype,
            Model model) {
        if (id != null) {
            JlTouzi jlTouzi = jlTouziManager.get(id);
            model.addAttribute("model", jlTouzi);
        }

        model.addAttribute("ftype", ftype);
        return "jl/jlTouzi-info-input";
    }
    
    @RequestMapping("jlTouziCount-info-save-ajax")
    public void saveCountAjax(@ModelAttribute JlTouziCount jlTouziCount,@RequestParam(value = "fid", required = false) Long fid,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            @RequestParam(value = "fgstze", required = false) String fgstze,
            @RequestParam(value = "fgcjsj", required = false) String fgcjsj,
            HttpServletResponse response,
            RedirectAttributes redirectAttributes) {
       
        	JlTouziCount dest = new JlTouziCount();

        	dest.setFid(fid);
            dest.setFgstze(fgstze);
        	dest.setFgcjsj(fgcjsj);
            dest.setFxmid(jlDeptManager.getXmId(request));

            jlTouziCountManager.save(dest);

            JsonResponseUtil.write(response, dest);
    }

    @RequestMapping("jlTouzi-info-save")
    public String save(@ModelAttribute JlTouzi jlTouzi,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        JlTouzi dest = null;

        Long id = jlTouzi.getFid();

        if (id != null) {
            dest = jlTouziManager.get(id);
            beanMapper.copy(jlTouzi, dest);
        } else {
            dest = jlTouzi;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        jlTouziManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlTouzi-info-list.do?ftype="+dest.getFtype();
    }

    @RequestMapping("jlTouzi-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlTouzi> jlTouzis = jlTouziManager.findByIds(selectedItem);

        jlTouziManager.removeAll(jlTouzis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlTouzi-info-list.do";
    }

    @RequestMapping("jlTouzi-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlTouziManager.pagedQuery(page, propertyFilters);

        List<JlTouzi> jlTouzis = (List<JlTouzi>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlTouzi info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlTouzis);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlTouziManager(JlTouziManager jlTouziManager) {
        this.jlTouziManager = jlTouziManager;
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
