package  com.xthena.jl.web;

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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CodeUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.PjXmMapUtil;
import com.xthena.util.SessionUtil;
import com.xthena.util.manager.CodeGenManager;
import com.xthena.gcgl.domain.PjKq;
import com.xthena.gcgl.manager.PjKqManager;
import com.xthena.gcgl.manager.PjRyManager;
import com.xthena.jl.domain.JlKqFujian;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlKqFujianManager;
import com.xthena.jl.manager.JlKqRyManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class jlPjKqController {
    private PjKqManager pjKqManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CodeGenManager codeGenManager;
    
    @Autowired
    private JlKqRyManager jlKqRyManager;
    

    @Autowired 
    private JlDeptManager jlDeptManager;
    
    @Autowired
    private JlKqFujianManager jlKqFujianManager;
    
    @RequestMapping("jl-kq-input")
    public String kqinput(Model model,@RequestParam(value = "id", required = false) Long id,@ModelAttribute Page page) {
    	model.addAttribute("kqid", id);
    	PjKq pjKq=pjKqManager.get(id);
    	List<JlKqFujian> jlKqFujians=jlKqFujianManager.findBy("fkqid", id);
    	model.addAttribute("fxmName", PjXmMapUtil.getXmMap().get(pjKq.getFxmid()).getFxmname());
    	model.addAttribute("jlfujians",jlKqFujians);
    	model.addAttribute("kq", pjKq);
    	model.addAttribute("page", page);
        return "jl/jl-kq-input";
    }
    
    
    @RequestMapping("jl-pjKq-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
       page.setOrderBy("fyearmonth");
       page.setOrder("DESC");
        page = pjKqManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);

        return "jl/pjKq-info-list";
    }

    @RequestMapping("jl-pjKq-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjKq pjKq = pjKqManager.get(id);
            pjKq.setFuploadry(userConnector.findById(String.valueOf(pjKq.getFuploadid())).getUsername());
            model.addAttribute("model", pjKq);
        }

        return "jl/pjKq-info-input";
    }

    @RequestMapping("jl-pjKq-info-save")
    public String save(@ModelAttribute PjKq pjKq,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        PjKq dest = null;

        Long id = pjKq.getFid();

        if (id != null) {
            dest = pjKqManager.get(id);
            beanMapper.copy(pjKq, dest);
        } else {
            dest = pjKq;
            dest.setFuploaddate(new Date());
            dest.setFuploadid(Long.parseLong(SpringSecurityUtils.getCurrentUserId()));
            dest.setFxmid(jlDeptManager.getXmId(request));
            dest.setFkqno(CodeUtil.getSysYearCode(ConstValue.SYS_CODE_XM+jlDeptManager.getXmId(request), 6, codeGenManager));
        }
        

        pjKqManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-kq-input.do?id="+dest.getFid();
    }

    @RequestMapping("jl-pjKq-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjKq> pjKqs = pjKqManager.findByIds(selectedItem);

        pjKqManager.removeAll(pjKqs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-pjKq-info-list.do";
    }

    @RequestMapping("jl-pjKq-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjKqManager.pagedQuery(page, propertyFilters);

        List<PjKq> pjKqs = (List<PjKq>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjKq info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjKqs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjKqManager(PjKqManager pjKqManager) {
        this.pjKqManager = pjKqManager;
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
