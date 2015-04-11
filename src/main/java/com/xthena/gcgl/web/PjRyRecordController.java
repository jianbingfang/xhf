package  com.xthena.gcgl.web;

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

import com.xthena.gcgl.domain.PjRy;
import com.xthena.gcgl.domain.PjRyRecord;
import com.xthena.gcgl.manager.PjRyManager;
import com.xthena.gcgl.manager.PjRyRecordManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjRyRecordController {
    private PjRyRecordManager pjRyRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    

    @Autowired
    private PjRyManager pjRyManager;
    
    @RequestMapping("pjRyRecord-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjRyRecordManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/pjRyRecord-info-list";
    }

    @RequestMapping("pjRyRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjRyRecord pjRyRecord = pjRyRecordManager.get(id);
            model.addAttribute("model", pjRyRecord);
            model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        }

      
        return "gcgl/pjRyRecord-info-input";
    }

    @RequestMapping("pjRyRecord-info-save")
    public String save(@ModelAttribute PjRyRecord pjRyRecord,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjRyRecord dest = null;

        Long id = pjRyRecord.getFid();

        if (id != null) {
            dest = pjRyRecordManager.get(id);
            beanMapper.copy(pjRyRecord, dest);
        } else {
            dest = pjRyRecord;
        }
        
       
        pjRyRecordManager.saveAndPjRy(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjRyRecord-info-list.do";
    }

    @RequestMapping("pjRyRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjRyRecord> pjRyRecords = pjRyRecordManager.findByIds(selectedItem);

        pjRyRecordManager.removeAll(pjRyRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjRyRecord-info-list.do";
    }

    @RequestMapping("pjRyRecord-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjRyRecordManager.pagedQuery(page, propertyFilters);

        List<PjRyRecord> pjRyRecords = (List<PjRyRecord>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjRyRecord info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjRyRecords);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjRyRecordManager(PjRyRecordManager pjRyRecordManager) {
        this.pjRyRecordManager = pjRyRecordManager;
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
