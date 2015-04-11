package  com.xthena.cw.web;

import java.util.ArrayList;
import java.util.Date;
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
import com.xthena.util.JsonResponseUtil;
import com.xthena.cw.domain.Cwfujian;
import com.xthena.cw.manager.CwfujianManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwfujianController {
    private CwfujianManager cwfujianManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("cwfujian-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwfujianManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "cw/cwfujian-info-list";
    }

    @RequestMapping("cwfujian-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
            model.addAttribute("model", cwfujianManager.getAll());
        return "cw/cwfujian-info-input";
    }

    @RequestMapping("cwfujian-info-save")
    public String save(@ModelAttribute Cwfujian cwfujian,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Cwfujian dest = null;

        Long id = cwfujian.getFid();

        if (id != null) {
            dest = cwfujianManager.get(id);
            beanMapper.copy(cwfujian, dest);
        } else {
            dest = cwfujian;
        }

        cwfujianManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/cw/cwfujian-info-list.do";
    }
    
    
    @RequestMapping("cwfujian-info-save-ajax")
    public void saveajax(@ModelAttribute Cwfujian cwfujian,
            @RequestParam Map<String, Object> parameterMap,HttpServletResponse response,
            RedirectAttributes redirectAttributes) {
    	cwfujian.setFuploaddate(new Date());
        cwfujianManager.save(cwfujian);
    	JsonResponseUtil.write(response, cwfujian);
    }

    
    @RequestMapping("cwfujian-info-remove")
    public String remove(@RequestParam(value = "id", required = false) Long id,
            RedirectAttributes redirectAttributes) {
    	  cwfujianManager.removeById(id);
        return "redirect:/cw/cwfujian-info-input.do";
    }
    
    
    @RequestMapping("cwfujian-info-remove-ajax")
    public void removeajax(HttpServletResponse response,@RequestParam(value = "id", required = false) Long id,
            RedirectAttributes redirectAttributes) {
        cwfujianManager.removeById(id);
        JsonResponseUtil.write(response,"ok");
    }

    @RequestMapping("cwfujian-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwfujianManager.pagedQuery(page, propertyFilters);

        List<Cwfujian> cwfujians = (List<Cwfujian>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("cwfujian info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(cwfujians);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCwfujianManager(CwfujianManager cwfujianManager) {
        this.cwfujianManager = cwfujianManager;
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
