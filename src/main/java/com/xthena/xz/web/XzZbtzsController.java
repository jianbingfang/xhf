package  com.xthena.xz.web;

import java.text.NumberFormat;
import java.util.ArrayList;
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
import com.xthena.util.CommRyMapUtil;
import com.xthena.xz.domain.XzJgysbg;
import com.xthena.xz.domain.XzZbtzs;
import com.xthena.xz.manager.XzZbtzsManager;
import com.xthena.xz.manager.XzZjDxlistManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzZbtzsController {
    private XzZbtzsManager xzZbtzsManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    @Autowired
	private CommRyManager ryManager;
    @RequestMapping("xzZbtzs-info-list")
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
    					parameterMap.put("filter_EQL_fzongjian", rys.get(0).getFid());
    				}else
    				{
    					parameterMap.put("filter_EQL_fzongjian", 0);
    				}
    			}
    			parameterMap.remove("filter_LIKES_fzongjianname");
    			//**********************end 按总监查询
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrderBy("fcode");
        page = xzZbtzsManager.pagedQuery(page, propertyFilters);
    	//去除科学计数法
		ArrayList<XzZbtzs> arr = (ArrayList<XzZbtzs>) page.getResult();
		for (XzZbtzs xzJgysbg : arr) {
			Double ztz = xzJgysbg.getFzbje();
			if (ztz != null) {
				NumberFormat nf = java.text.NumberFormat.getInstance();   
		        nf.setGroupingUsed(false);
				String a = nf.format(ztz);
				xzJgysbg.setFmemo1(a);
			}
		}
        model.addAttribute("page", page);

    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "xz/xzZbtzs-info-list";
    }

    @RequestMapping("xzZbtzs-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzZbtzs xzZbtzs = xzZbtzsManager.get(id);
        	if (xzZbtzs.getFzbje() != null) {
				NumberFormat nf = java.text.NumberFormat.getInstance();   
		        nf.setGroupingUsed(false);
				String a = nf.format(xzZbtzs.getFzbje());
				xzZbtzs.setFmemo1(a);
			}
            model.addAttribute("model", xzZbtzs);
        }
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "xz/xzZbtzs-info-input";
    }

    @RequestMapping("xzZbtzs-info-save")
    public String save(@ModelAttribute XzZbtzs xzZbtzs,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzZbtzs dest = null;

        Long id = xzZbtzs.getFid();

        if (id != null) {
            dest = xzZbtzsManager.get(id);
            beanMapper.copy(xzZbtzs, dest);
        } else {
            dest = xzZbtzs;
        }

        xzZbtzsManager.mysave(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzZbtzs-info-list.do";
    }

    @RequestMapping("xzZbtzs-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzZbtzs> xzZbtzss = xzZbtzsManager.findByIds(selectedItem);

        xzZbtzsManager.removeAll(xzZbtzss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzZbtzs-info-list.do";
    }

    @RequestMapping("xzZbtzs-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzZbtzsManager.pagedQuery(page, propertyFilters);

        List<XzZbtzs> xzZbtzss = (List<XzZbtzs>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzZbtzs info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzZbtzss);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzZbtzsManager(XzZbtzsManager xzZbtzsManager) {
        this.xzZbtzsManager = xzZbtzsManager;
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
