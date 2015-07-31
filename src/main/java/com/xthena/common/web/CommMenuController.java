package  com.xthena.common.web;

import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.xthena.sckf.manager.JyXmManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.common.domain.CommMenu;
import com.xthena.common.manager.CommMenuManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.cw.domain.CwCb;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.util.DateJsonValueProcessor;
import com.xthena.util.JsonResponseUtil;

@Controller
@RequestMapping("sysconf")
public class CommMenuController {
    private CommMenuManager commMenuManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JyXmManager jyXmManager;

    @RequestMapping("demo-menu-ajax")
    public void demoMenu(@RequestParam(value = "pid", required = false) Long pid,
            @RequestParam Map<String, Object> parameterMap, Model model,HttpServletResponse response){
    	//pid=Long.valueOf(1);
        String hql = "from CommMenu where fpid=1 order by forder ";
    	
        List<CommMenu> zNodes = new ArrayList<CommMenu>();
        zNodes = commMenuManager.find(hql);
        //model.addAttribute("page", JSONArray.fromObject(zNodes));
    		JsonResponseUtil.write(response, zNodes);
    	}




    @RequestMapping("commMenu-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
   /*     List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);*/
        //page = commMenuManager.pagedQuery(page, propertyFilters);
        
       // model.addAttribute("page", page);
    	String hql = "from CommMenu order by forder ";
    	
        List<CommMenu> zNodes = new ArrayList<CommMenu>();
        zNodes = commMenuManager.find(hql);
        model.addAttribute("page", JSONArray.fromObject(zNodes));
        return "comm/commMenu-info-list";
    }

    @RequestMapping("commMenu-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommMenu commMenu = commMenuManager.get(id);
            model.addAttribute("model", commMenu);
        }

        return "comm/commMenu-info-input";
    }

  /*  @RequestMapping("commMenu-info-save")
    public String save(@RequestParam(value = "fid", required = false) Long fid,@RequestParam(value = "fpid", required = false) Long fpid,
    		@RequestParam(value = "fname", required = false) String fname,
    		@RequestParam(value = "furl", required = false) String furl,
    		@RequestParam(value = "fmenucode", required = false) String fmenucode,
    		@RequestParam(value = "fmemo", required = false) String fmemo,
    		@RequestParam(value = "forder", required = false) Integer forder,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	 CommMenu dest = null;
        CommMenu commMenu = new CommMenu();
        commMenu.setFid(fid);
        commMenu.setFname(fname);
        commMenu.setFurl(furl);
        commMenu.setFpid(fpid);
        commMenu.setFmemo(fmemo);
        commMenu.setForder(forder);
        commMenu.setFmenucode(fmenucode);
        
        Long id = fid;

        if (id != null) {
            dest = commMenuManager.get(id);
            beanMapper.copy(commMenu, dest);
        } else {
            dest = commMenu;
        }
        commMenuManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
    return "redirect:/sysconf/commMenu-info-list.do";
    }
*/
    
    @RequestMapping("commMenu-info-save")
	public String save(@ModelAttribute CommMenu commMenu,
			@RequestParam Map<String, Object> parameterMap,
			RedirectAttributes redirectAttributes) {
    	CommMenu dest = null;

		Long id = commMenu.getFid();

		if (id != null) {
			dest = commMenuManager.get(id);
			beanMapper.copy(commMenu, dest);
		} else {
			dest = commMenu;
		}

		commMenuManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
				"保存成功");

		 return "redirect:/sysconf/commMenu-info-list.do";
	}
    
    
    
    @RequestMapping("commMenu-info-remove")
    public String remove(@RequestParam("id") Long  id,
    		
            RedirectAttributes redirectAttributes) {
        List<CommMenu> commMenus = commMenuManager.findBy("fid", id);

        commMenuManager.removeAll(commMenus);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        //return "redirect:/sysconf/commMenu-info-list.do";
        return null;
    }
    
/*    @RequestMapping("commMenu-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommMenu> commMenus = commMenuManager.findByIds(selectedItem);

        commMenuManager.removeAll(commMenus);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        //return "redirect:/sysconf/commMenu-info-list.do";
        return "#";
    }*/

    @RequestMapping("commMenu-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commMenuManager.pagedQuery(page, propertyFilters);

        List<CommMenu> commMenus = (List<CommMenu>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commMenu info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commMenus);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommMenuManager(CommMenuManager commMenuManager) {
        this.commMenuManager = commMenuManager;
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
