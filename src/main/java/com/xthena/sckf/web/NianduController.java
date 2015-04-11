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
import com.xthena.sckf.domain.Niandu;
import com.xthena.sckf.domain.NianduGroup;
import com.xthena.sckf.manager.NdFileManager;
import com.xthena.sckf.manager.NianduManager;
import com.xthena.xz.domain.XzZjOrderGroup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class NianduController {
    private NianduManager nianduManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private NdFileManager ndFileManager;

    @RequestMapping("niandu-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = nianduManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/niandu-info-list";
    }

    @RequestMapping("niandu-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        
    	if (id != null) {
            Niandu niandu = nianduManager.get(id);
            model.addAttribute("model", niandu);
            model.addAttribute("fujians", ndFileManager.findBy("fyear", id));
        }

        return "sckf/niandu-info-input";
    }

    @InitBinder("niandu.")
    public void setBinderZjOrder(WebDataBinder webDataBinder){
    	webDataBinder.setFieldDefaultPrefix("niandu.");
    }
    
    @InitBinder("ndFiles.")
    public void setBinderFzjList(WebDataBinder webDataBinder){
    	webDataBinder.setFieldDefaultPrefix("ndFiles.");
    }
    
    
    
    @RequestMapping("niandu-info-save")
    public String save(@ModelAttribute NianduGroup nianduGroup,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
       

        nianduManager.saveGroup(nianduGroup);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/niandu-info-list.do";
    }

    @RequestMapping("niandu-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Niandu> niandus = nianduManager.findByIds(selectedItem);

        nianduManager.removeAll(niandus);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/niandu-info-list.do";
    }
    
    @RequestMapping("nianduFile-info-remove")
    public String removeFile(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "yearId", required = false) Long yearId, RedirectAttributes redirectAttributes,
            Model model) {
    	ndFileManager.removeById(id);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/niandu-info-input.do?id="+yearId;
    }

    @RequestMapping("niandu-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = nianduManager.pagedQuery(page, propertyFilters);

        List<Niandu> niandus = (List<Niandu>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("niandu info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(niandus);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setNianduManager(NianduManager nianduManager) {
        this.nianduManager = nianduManager;
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
