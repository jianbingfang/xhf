package  com.xthena.dzb.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
import com.xthena.dzb.domain.Hd;
import com.xthena.dzb.manager.HdManager;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

@Controller
@RequestMapping("dzb")
public class HdController {
    private HdManager hdManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hd-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "ftype", required = false) String ftype,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmemo1", ftype);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hdManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        if(ftype != null ){
        switch (ftype) {
		case "1":
			 return "dzb/hd-info-list";
		case "2":
			 return "dzb/hd-ywld-info-list";
		case "3":
			 return "dzb/hd-cgkc-info-list";
		default:
			break;
		}}
		return "dzb/hd-info-list";
       
    }

    @RequestMapping("hd-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ftype", required = false) String ftype,
            Model model) {
        if (id != null) {
            Hd hd = hdManager.get(id);
            model.addAttribute("model", hd);
        }
        if(ftype != null ){
        switch (ftype) {
		case "1":
			 return "dzb/hd-info-input";
		case "2":
			 return "dzb/hd-ywld-info-input";
		case "3":
			 return "dzb/hd-cgkc-info-input";
		default:
			break;
		}}
        return "dzb/hd-info-input";
    }

    @RequestMapping("hd-info-save")
    public String save(@ModelAttribute Hd hd,@RequestParam(value = "ftype", required = false) String ftype,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Hd dest = null;

        Long id = hd.getFid();

        if (id != null) {
            dest = hdManager.get(id);
            beanMapper.copy(hd, dest);
        } else {
            dest = hd;
        }
        if(ftype != null ){
         dest.setFmemo1(ftype);
        }
        hdManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/dzb/hd-info-list.do";
    }

    @RequestMapping("hd-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Hd> hds = hdManager.findByIds(selectedItem);

        hdManager.removeAll(hds);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/dzb/hd-info-list.do";
    }

    @RequestMapping("hd-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hdManager.pagedQuery(page, propertyFilters);

        List<Hd> hds = (List<Hd>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hd info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hds);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHdManager(HdManager hdManager) {
        this.hdManager = hdManager;
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
