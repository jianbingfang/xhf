package  com.xthena.xz.web;

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

import com.xthena.xz.domain.WzKind;
import com.xthena.xz.manager.WzKindManager;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class WzKindController {
    private WzKindManager wzKindManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("wzKind-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzKindManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("kindList", wzKindManager.getAll());

        return "xz/wzKind-info-list";
    }

    @RequestMapping("wzKind-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            WzKind wzKind = wzKindManager.get(id);
            model.addAttribute("model", wzKind);
        }
        model.addAttribute("kindList", wzKindManager.getAll());
       /* WzKind wzKind=wzKindManager.get(1L);
        ArrayList<HashMap<String, Object>> result=new ArrayList<HashMap<String, Object>>();
        model.addAttribute("kindList", wzKindManager.findKindAndSub(wzKind,result));
       System.out.println(JSONArray.fromObject(wzKindManager.findKindAndSub(wzKind,result)).toString());*/
        return "xz/wzKind-info-input";
    }

    @RequestMapping("wzKind-info-save")
    public String save(@ModelAttribute WzKind wzKind,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        WzKind dest = null;

        Long id = wzKind.getFid();

        if (id != null) {
            dest = wzKindManager.get(id);
            beanMapper.copy(wzKind, dest);
        } else {
            dest = wzKind;
        }
        
        if(dest.getFpid()!=null){
        	WzKind wzKind2=wzKindManager.get(dest.getFpid());
        	wzKind2.setFisleaf(0);//设置为非叶子节点
        	wzKindManager.save(wzKind2);
        }
        wzKindManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/wzKind-info-list.do";
    }

    @RequestMapping("wzKind-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<WzKind> wzKinds = wzKindManager.findByIds(selectedItem);

        wzKindManager.removeAll(wzKinds);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/wzKind-info-list.do";
    }

    @RequestMapping("wzKind-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzKindManager.pagedQuery(page, propertyFilters);

        List<WzKind> wzKinds = (List<WzKind>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("wzKind info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(wzKinds);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setWzKindManager(WzKindManager wzKindManager) {
        this.wzKindManager = wzKindManager;
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
