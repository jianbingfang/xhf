package  com.xthena.sckf.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
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
import com.xthena.sckf.domain.JyXmYj;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.sckf.manager.JyXmYjManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JyXmMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyXmYjController {
    private JyXmYjManager jyXmYjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JyXmManager jyXmManager;
    
    
    @PostConstruct
    public void intRmMap(){
    	JyXmMapUtil.initRyMap(jyXmManager);
    }
    
    @RequestMapping("jyXmYj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmYjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "sckf/jyXmYj-info-list";
    }

    @RequestMapping("jyXmYj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
            Model model) {
        if (id != null) {
            JyXmYj jyXmYj = jyXmYjManager.get(id);
            model.addAttribute("model", jyXmYj);
        }
        model.addAttribute("xm", jyXmManager.get(xmid));
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXmYj-info-input";
    }

    @RequestMapping("jyXmYj-info-save")
    public String save(@ModelAttribute JyXmYj jyXmYj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyXmYj dest = null;

        Long id = jyXmYj.getFid();

        if (id != null) {
            dest = jyXmYjManager.get(id);
            beanMapper.copy(jyXmYj, dest);
        } else {
            dest = jyXmYj;
        }

        jyXmYjManager.saveForYj(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyXmYj-info-list.do";
    }

    @RequestMapping("jyXmYj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyXmYj> jyXmYjs = jyXmYjManager.findByIds(selectedItem);

        jyXmYjManager.removeAll(jyXmYjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyXmYj-info-list.do";
    }

    @RequestMapping("jyXmYj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmYjManager.pagedQuery(page, propertyFilters);

        List<JyXmYj> jyXmYjs = (List<JyXmYj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyXmYj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyXmYjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyXmYjManager(JyXmYjManager jyXmYjManager) {
        this.jyXmYjManager = jyXmYjManager;
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
