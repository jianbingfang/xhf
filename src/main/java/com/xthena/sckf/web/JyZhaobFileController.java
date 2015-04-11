package  com.xthena.sckf.web;

import java.util.ArrayList;
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
import com.xthena.sckf.domain.JyZhaobFile;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.sckf.manager.JyZhaobFileManager;
import com.xthena.util.JyXmMapUtil;

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
public class JyZhaobFileController {
    private JyZhaobFileManager jyZhaobFileManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JyXmManager jyXmManager;
    
    @RequestMapping("jyZhaobFile-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyZhaobFileManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
        return "sckf/jyZhaobFile-info-list";
    }

    @RequestMapping("jyZhaobFile-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
            Model model) {
        if (id != null) {
            JyZhaobFile jyZhaobFile = jyZhaobFileManager.get(id);
            model.addAttribute("model", jyZhaobFile);
            model.addAttribute("xm", jyXmManager.get(jyZhaobFile.getFxmid()));
        }else{
        	model.addAttribute("xm", jyXmManager.get(xmid));
        }
        return "sckf/jyZhaobFile-info-input";
    }

    @RequestMapping("jyZhaobFile-info-save")
    public String save(@ModelAttribute JyZhaobFile jyZhaobFile,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyZhaobFile dest = null;

        Long id = jyZhaobFile.getFid();

        if (id != null) {
            dest = jyZhaobFileManager.get(id);
            beanMapper.copy(jyZhaobFile, dest);
        } else {
            dest = jyZhaobFile;
        }

        jyZhaobFileManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyZhaobFile-info-list.do";
    }

    @RequestMapping("jyZhaobFile-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyZhaobFile> jyZhaobFiles = jyZhaobFileManager.findByIds(selectedItem);

        jyZhaobFileManager.removeAll(jyZhaobFiles);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyZhaobFile-info-list.do";
    }

    @RequestMapping("jyZhaobFile-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyZhaobFileManager.pagedQuery(page, propertyFilters);

        List<JyZhaobFile> jyZhaobFiles = (List<JyZhaobFile>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyZhaobFile info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyZhaobFiles);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyZhaobFileManager(JyZhaobFileManager jyZhaobFileManager) {
        this.jyZhaobFileManager = jyZhaobFileManager;
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
