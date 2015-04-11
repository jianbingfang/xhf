package  com.xthena.xz.web;

import java.util.HashMap;
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
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.xz.domain.XzRyzs;
import com.xthena.xz.manager.XzRyzsManager;
import com.xthena.xz.manager.XzZjDxlistManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
@Controller
@RequestMapping("xz")
public class XzRyzsController {
    private XzRyzsManager xzRyzsManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    @Autowired
	private CommRyManager ryManager;
	
    @RequestMapping("xzRyzs-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	//*******************start 按总监查询
		Object zjname = parameterMap.get("filter_LIKES_fzongjianname");
		if (zjname != null && !zjname.equals("")) {
			String zj  = zjname.toString();
			Map<String, Object> ryparameterMap = new HashMap<String, Object>();
			ryparameterMap.put("filter_LIKES_fname", zj);
			List<PropertyFilter> rypropertyFilters = PropertyFilter
					.buildFromMap(ryparameterMap);
			List<CommRy> rys = ryManager.find(rypropertyFilters);
			if (rys.size() > 0) {
				parameterMap.put("filter_EQL_fhuojiangr", rys.get(0).getFid());
			}else
			{
				parameterMap.put("filter_EQL_fhuojiangr", 0);
			}
		}
		parameterMap.remove("filter_LIKES_fzongjianname");
		//**********************end 按总监查询
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrderBy("fzstype");
        page = xzRyzsManager.pagedQuery(page, propertyFilters);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("page", page);
        return "xz/xzRyzs-info-list";
    }

    @RequestMapping("xzRyzs-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzRyzs xzRyzs = xzRyzsManager.get(id);
            model.addAttribute("model", xzRyzs);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/xzRyzs-info-input";
    }

    @RequestMapping("xzRyzs-info-save")
    public String save(@ModelAttribute XzRyzs xzRyzs,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzRyzs dest = null;

        Long id = xzRyzs.getFid();

        if (id != null) {
            dest = xzRyzsManager.get(id);
            beanMapper.copy(xzRyzs, dest);
        } else {
            dest = xzRyzs;
        }
        xzRyzsManager.mysave(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzRyzs-info-input.do";
    }

    @RequestMapping("xzRyzs-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzRyzs> xzRyzss = xzRyzsManager.findByIds(selectedItem);

        xzRyzsManager.removeAll(xzRyzss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzRyzs-info-list.do";
    }

    @RequestMapping("xzRyzs-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzRyzsManager.pagedQuery(page, propertyFilters);

        List<XzRyzs> xzRyzss = (List<XzRyzs>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzRyzs info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzRyzss);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzRyzsManager(XzRyzsManager xzRyzsManager) {
        this.xzRyzsManager = xzRyzsManager;
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
