package  com.xthena.jl.web;

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
import com.xthena.jl.manager.JlDeptManager;

import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.SessionUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlCommHtController {
    private CommHtManager commHtManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired 
    private PjXmManager pjXmManager;
    
    @Autowired 
    private JlDeptManager jlDeptManager;
    
    @RequestMapping("jl-commHt-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commHtManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/commHt-info-list";
    }

    @RequestMapping("jl-commHt-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,HttpServletRequest request,
            Model model) {
    		PjXm pjXm=pjXmManager.get(jlDeptManager.getXmId(request));
            CommHt commHt = commHtManager.get(pjXm.getFhtid());
            model.addAttribute("model", commHt);

        return "jl/commHt-info-input";
    }

    @RequestMapping("jl-commHt-info-save")
    public String save(@ModelAttribute CommHt commHt,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommHt dest = null;

        Long id = commHt.getFid();

        if (id != null) {
            dest = commHtManager.get(id);
            beanMapper.copy(commHt, dest);
        } else {
            dest = commHt;
        }

        commHtManager.mysave(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-commHt-info-list.do";
    }

    @RequestMapping("jl-commHt-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommHt> commHts = commHtManager.findByIds(selectedItem);

        commHtManager.removeAll(commHts);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-commHt-info-list.do";
    }

    @RequestMapping("jl-commHt-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commHtManager.pagedQuery(page, propertyFilters);

        List<CommHt> commHts = (List<CommHt>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commHt info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commHts);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommHtManager(CommHtManager commHtManager) {
        this.commHtManager = commHtManager;
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
