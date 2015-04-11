package  com.xthena.gcgl.web;

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

import com.xthena.jl.domain.JlfRecord;
import com.xthena.jl.manager.JlfRecordManager;
import com.xthena.util.PjXmMapUtil;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class GcglJlfRecordController {
    private JlfRecordManager jlfRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("gcgl-jlfRecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlfRecordManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());

        return "gcgl/jlfRecord-info-list";
    }

    @RequestMapping("gcgl-jlfRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlfRecord jlfRecord = jlfRecordManager.get(id);
            model.addAttribute("model", jlfRecord);
        }

        return "gcgl/jlfRecord-info-input";
    }

    @RequestMapping("gcgl-jlfRecord-info-save")
    public String save(@ModelAttribute JlfRecord jlfRecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlfRecord dest = null;

        Long id = jlfRecord.getFid();

        if (id != null) {
            dest = jlfRecordManager.get(id);
            beanMapper.copy(jlfRecord, dest);
        } else {
            dest = jlfRecord;
        }

        jlfRecordManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/gcgl-jlfRecord-info-list.do";
    }

    @RequestMapping("gcgl-jlfRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlfRecord> jlfRecords = jlfRecordManager.findByIds(selectedItem);

        jlfRecordManager.removeAll(jlfRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/gcgl-jlfRecord-info-list.do";
    }

    @RequestMapping("gcgl-jlfRecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlfRecordManager.pagedQuery(page, propertyFilters);

        List<JlfRecord> jlfRecords = (List<JlfRecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlfRecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlfRecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlfRecordManager(JlfRecordManager jlfRecordManager) {
        this.jlfRecordManager = jlfRecordManager;
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
