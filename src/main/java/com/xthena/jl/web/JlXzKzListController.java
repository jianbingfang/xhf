package  com.xthena.jl.web;

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
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.util.SessionUtil;
import com.xthena.xz.domain.XzKzList;
import com.xthena.xz.manager.XzKzListManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlXzKzListController {
    private XzKzListManager xzKzListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    @Autowired
   	private OrgDepartmentManager orgDepartmentManager;


    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jl-xzKzList-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzKzListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        //model.addAttribute("deptList",orgDepartmentManager.getAll());
        model.addAttribute("ryMap",CommRyMapUtil.getRyMap());
        model.addAttribute("xmMap",PjXmMapUtil.getXmMap());
        return "jl/xzKzList-info-list";
    }

    @RequestMapping("jl-xzKzList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzKzList xzKzList = xzKzListManager.get(id);
            model.addAttribute("model", xzKzList);
        }
      //  model.addAttribute("deptList",orgDepartmentManager.getAll());
        model.addAttribute("ryMap",CommRyMapUtil.getRyMap());
        model.addAttribute("xmMap",PjXmMapUtil.getXmMap());
        return "jl/xzKzList-info-input";
    }

    @RequestMapping("jl-xzKzList-info-save")
    public String save(@ModelAttribute XzKzList xzKzList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzKzList dest = null;

        Long id = xzKzList.getFid();

        if (id != null) {
            dest = xzKzListManager.get(id);
            beanMapper.copy(xzKzList, dest);
            
        } else {
            dest = xzKzList;
        }

        xzKzListManager.save(dest);
//        yinzhangManager.save(entity);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/jl/xzKzList-info-list.do";
    }

    @RequestMapping("jl-xzKzList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzKzList> xzKzLists = xzKzListManager.findByIds(selectedItem);

        xzKzListManager.removeAll(xzKzLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/xzKzList-info-list.do";
    }

    @RequestMapping("jl-xzKzList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzKzListManager.pagedQuery(page, propertyFilters);

        List<XzKzList> xzKzLists = (List<XzKzList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzKzList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzKzLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzKzListManager(XzKzListManager xzKzListManager) {
        this.xzKzListManager = xzKzListManager;
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
