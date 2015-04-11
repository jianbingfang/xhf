package  com.xthena.sckf.web;

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
import com.xthena.sckf.domain.JyBmRecord;
import com.xthena.sckf.manager.JyBmRecordManager;
import com.xthena.sckf.manager.JyXmManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyBmRecordController {
	private JyXmManager jyXmManager;
	private JyBmRecordManager jyBmRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyBmRecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyBmRecordManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/jyBmRecord-info-list";
    }

    @RequestMapping("jyBmRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyBmRecord jyBmRecord = jyBmRecordManager.get(id);
            model.addAttribute("model", jyBmRecord);
        }

        return "sckf/jyBmRecord-info-input";
    }

    @RequestMapping("jyBmRecord-info-save")
    public String save(@ModelAttribute JyBmRecord jyBmRecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyBmRecord dest = null;

        Long id = jyBmRecord.getFid();

        if (id != null) {
            dest = jyBmRecordManager.get(id);
            beanMapper.copy(jyBmRecord, dest);
        } else {
            dest = jyBmRecord;
        }

        jyXmManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyBmRecord-info-list.do";
    }

    @RequestMapping("jyBmRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyBmRecord> jyBmRecords = jyBmRecordManager.findByIds(selectedItem);

        jyBmRecordManager.removeAll(jyBmRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyBmRecord-info-list.do";
    }

    @RequestMapping("jyBmRecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyBmRecordManager.pagedQuery(page, propertyFilters);

        List<JyBmRecord> jyBmRecords = (List<JyBmRecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyBmRecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyBmRecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyBmRecordManager(JyBmRecordManager jyBmRecordManager) {
        this.jyBmRecordManager = jyBmRecordManager;
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
