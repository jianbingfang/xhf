package  com.xthena.gcgl.domain;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;

import com.xthena.jl.domain.JlfRecord;
import com.xthena.jl.domain.PjXmJd;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlfRecordManager;
import com.xthena.jl.manager.PjXmJdManager;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.SessionUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjJlfRecordController {
    private JlfRecordManager jlfRecordManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private PjXmManager pjXmManager;
    
    @Autowired
    private CommHtManager commHtManager;
    
    @Autowired
    private PjXmJdManager pjXmJdManager;
    

    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jlfRecord-info-list")
    public String list(@ModelAttribute Page page, @RequestParam(value = "fxmid", required = false) Long fxmid,
            @RequestParam Map<String, Object> parameterMap, Model model) {

        if(parameterMap.containsKey("fxmid")){
            parameterMap.put("filter_EQL_fxmid",fxmid);
        }
        
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);

        page = jlfRecordManager.pagedQuery(page, propertyFilters);
        model.addAttribute("fxmid", fxmid);
        model.addAttribute("page", page);

        return "gcgl/jlfRecord-info-list";
    }

    @RequestMapping("jlfRecord-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        @RequestParam(value="fxmid", required = false) Long fxmid,
            Model model) {
        if (id != null) {
            JlfRecord jlfRecord = jlfRecordManager.get(id);
            jlfRecord.setFxmid(fxmid);
            model.addAttribute("model", jlfRecord);
        }
        else{
            JlfRecord jlfRecord= new JlfRecord();
            jlfRecord.setFxmid(fxmid);
            model.addAttribute("model", jlfRecord);
        }
        return "gcgl/jlfRecord-info-input";
    }
    

    @RequestMapping("jlfRecord-info-save")
    public String save(@ModelAttribute JlfRecord jlfRecord,
                       @RequestParam(value = "fxmid", required = false) String fxmid,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        JlfRecord dest = null;
        Long id = jlfRecord.getFid();
        if (id != null) {
            dest = jlfRecordManager.get(id);
            beanMapper.copy(jlfRecord, dest);
        } else {
            dest = jlfRecord;
            dest.setFshouqudate(new Date());
        }
        dest.setFxmid(Long.parseLong(fxmid));
        jlfRecordManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/jl-ny-jlf-input.do?fxmid="+fxmid;
    }

    @RequestMapping("jlfRecord-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem, @RequestParam(value = "fxmid",
            required = false) Long fxmid,
            RedirectAttributes redirectAttributes) {
        List<JlfRecord> jlfRecords = jlfRecordManager.findByIds(selectedItem);

        jlfRecordManager.removeAll(jlfRecords);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/jlfRecord-info-list.do?fxmid="+fxmid;
    }

    @RequestMapping("jlfRecord-info-export")
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
