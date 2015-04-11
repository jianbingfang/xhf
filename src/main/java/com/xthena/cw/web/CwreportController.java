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
import com.xthena.util.CommRyMapUtil;
import com.xthena.cw.domain.Cwreport;
import com.xthena.cw.manager.CwreportManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwreportController {
    private CwreportManager cwreportManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("cwreport-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwreportManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "cw/cwreport-info-list";
    }

    @RequestMapping("cwreport-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Cwreport cwreport = cwreportManager.get(id);
            model.addAttribute("model", cwreport);
        }
        return "cw/cwreport-info-input";
    }

    @RequestMapping("cwreport-info-save")
    public String save(@ModelAttribute Cwreport cwreport,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Cwreport dest = null;

        Long id = cwreport.getFid();

        if (id != null) {
            dest = cwreportManager.get(id);
            beanMapper.copy(cwreport, dest);
        } else {
            dest = cwreport;
        }
        dest.setFupdatedate(new Date());
        dest.setFupdatery(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        
        cwreportManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/cw/cwreport-info-list.do";
    }

    @RequestMapping("cwreport-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Cwreport> cwreports = cwreportManager.findByIds(selectedItem);

        cwreportManager.removeAll(cwreports);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cwreport-info-list.do";
    }

    @RequestMapping("cwreport-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwreportManager.pagedQuery(page, propertyFilters);

        List<Cwreport> cwreports = (List<Cwreport>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("cwreport info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(cwreports);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCwreportManager(CwreportManager cwreportManager) {
        this.cwreportManager = cwreportManager;
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
