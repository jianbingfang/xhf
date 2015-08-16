package  com.xthena.gcgl.web;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.gcgl.domain.PjWz;
import com.xthena.gcgl.manager.PjWzManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.util.WzMapUtil;
import com.xthena.xz.manager.WzTableManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjWzController {
    private PjWzManager pjWzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjWz-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fxmid", required = false) Long fxmid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	if(fxmid!=null){
    		parameterMap.put("filter_EQL_fxmid", fxmid);
    	}
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjWzManager.pagedQuery(page, propertyFilters);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("wzMap", WzMapUtil.getWzMap());
        model.addAttribute("page", page);

        return "gcgl/pjWz-info-list";
    }

    @RequestMapping("pjWz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
        if (id != null) {
            PjWz pjWz = pjWzManager.get(id);
            model.addAttribute("model", pjWz);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        return "gcgl/pjWz-info-input";
    }

    @RequestMapping("pjWz-info-save")
    public String save(@ModelAttribute PjWz pjWz,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjWz dest = null;

        Long id = pjWz.getFid();

        if (id != null) {
            dest = pjWzManager.get(id);
            beanMapper.copy(pjWz, dest);
        } else {
            dest = pjWz;
        }

        pjWzManager.save(dest);
        dest.setFstatus(1);//申请中

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjWz-info-list.do";
    }

    @RequestMapping("pjWz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjWz> pjWzs = pjWzManager.findByIds(selectedItem);

        pjWzManager.removeAll(pjWzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjWz-info-list.do";
    }

    @RequestMapping("pjWz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjWzManager.pagedQuery(page, propertyFilters);

        List<PjWz> pjWzs = (List<PjWz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjWz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjWzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjWzManager(PjWzManager pjWzManager) {
        this.pjWzManager = pjWzManager;
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
