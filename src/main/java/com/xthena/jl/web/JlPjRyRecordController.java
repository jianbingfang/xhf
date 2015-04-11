package  com.xthena.jl.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjRyRecord;
import com.xthena.gcgl.manager.PjRyRecordManager;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.util.SessionUtil;

@Controller
@RequestMapping("jl")
public class JlPjRyRecordController {
	@Autowired
    private PjRyRecordManager pjRyRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private CommRyManager commRyManager;
    
    @Autowired
    private PjXmManager pjXmManager;


    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jl-pjRyRecord-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        //只查询调入和调出项目是本项目的调拨台账
        page=  pjRyRecordManager.pagedQuery("select pjryRecord from PjRyRecord pjryRecord "
        								+" where (fdcxm="+jlDeptManager.getXmId(request)+" or fdrxm="+jlDeptManager.getXmId(request)+") "
        									,page.getPageNo(),page.getPageSize(), propertyFilters);
        
        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "jl/pjRyRecord-info-list";
    }

    @RequestMapping("jl-pjRyRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjRyRecord pjRyRecord = pjRyRecordManager.get(id);
            model.addAttribute("model", pjRyRecord);
        }

        return "jl/pjRyRecord-info-input";
    }

    @RequestMapping("jl-pjRyRecord-info-save")
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

        pjRyRecordManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-pjRyRecord-info-list.do";
    }

    @RequestMapping("jl-pjRyRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjRyRecord> pjRyRecords = pjRyRecordManager.findByIds(selectedItem);

        pjRyRecordManager.removeAll(pjRyRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-pjRyRecord-info-list.do";
    }

    @RequestMapping("jl-pjRyRecord-info-export")
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
