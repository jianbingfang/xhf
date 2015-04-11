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
import com.xthena.sckf.domain.NdFile;
import com.xthena.sckf.manager.NdFileManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class NdFileController {
    private NdFileManager ndFileManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("ndFile-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = ndFileManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/ndFile-info-list";
    }

    @RequestMapping("ndFile-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            NdFile ndFile = ndFileManager.get(id);
            model.addAttribute("model", ndFile);
        }

        return "sckf/ndFile-info-input";
    }

    @RequestMapping("ndFile-info-save")
    public String save(@ModelAttribute NdFile ndFile,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        NdFile dest = null;

        Long id = ndFile.getFid();

        if (id != null) {
            dest = ndFileManager.get(id);
            beanMapper.copy(ndFile, dest);
        } else {
            dest = ndFile;
        }

        ndFileManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/ndFile-info-list.do";
    }

    @RequestMapping("ndFile-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<NdFile> ndFiles = ndFileManager.findByIds(selectedItem);

        ndFileManager.removeAll(ndFiles);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/ndFile-info-list.do";
    }

    @RequestMapping("ndFile-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = ndFileManager.pagedQuery(page, propertyFilters);

        List<NdFile> ndFiles = (List<NdFile>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("ndFile info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(ndFiles);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setNdFileManager(NdFileManager ndFileManager) {
        this.ndFileManager = ndFileManager;
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
