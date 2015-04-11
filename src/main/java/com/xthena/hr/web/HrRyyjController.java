package  com.xthena.hr.web;

import java.util.ArrayList;
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
import com.xthena.sckf.domain.CommHt;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.xz.domain.XzRyzs;
import com.xthena.hr.domain.HrRyyj;
import com.xthena.hr.manager.HrRyZjManager;
import com.xthena.hr.manager.HrRyyjManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrRyyjController {
    private HrRyyjManager hrRyyjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private HrRyZjManager hrRyZjManager; 
    
    @RequestMapping("hrRyyj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrRyyjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "hr/hrRyyj-info-list";
    }
    

    @RequestMapping("hrRyyj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ryid", required = false) Long ryid,
            Model model) {
    	List<CommHt> commHts=null;
    	List<XzRyzs> xzRyZses=null;
        if (id != null) {
            HrRyyj hrRyyj = hrRyyjManager.get(id);
            model.addAttribute("model", hrRyyj);
            model.addAttribute("zjList",hrRyZjManager.find("select hrryzj from HrRyZj hrryzj where fname like '%注册%' and userid= ?", hrRyyj.getFryid())); 
            commHts=hrRyZjManager.find("select commht from CommHt commht where commht.fzongjian= ?", hrRyyj.getFryid()); 
            xzRyZses=hrRyZjManager.find("select xzRyzs from XzRyzs xzRyzs where xzRyzs.fhuojiangr= ?", hrRyyj.getFryid()); 
            
            StringBuffer sb=new StringBuffer();
            for(CommHt commHt:commHts){
            	sb.append(commHt.getFqiandingdate()).append(" ").append(commHt.getFhtname()).append("\n");
            }
            
            StringBuffer sb1=new StringBuffer();
            for(XzRyzs xzRyzs:xzRyZses){
            	sb1.append(xzRyzs.getFyear()).append(" ").append(xzRyzs.getFhjname()).append(" ").append(xzRyzs.getFtype()).append("\n");	
            }
            
            model.addAttribute("htInfo",sb.toString());
            model.addAttribute("xzRyzs",sb1.toString());
        }else if(ryid!=null){
            model.addAttribute("zjList",hrRyZjManager.find("select hrryzj from HrRyZj hrryzj where hrryzj.fname like '%注册%' and userid= ?", ryid)); 
            commHts=hrRyZjManager.find("select commht from CommHt commht where commht.fzongjian= ?",ryid); 
            xzRyZses=hrRyZjManager.find("select xzRyzs from XzRyzs xzRyzs where xzRyzs.fhuojiangr= ?", ryid); 
            HrRyyj hrRyyj=new HrRyyj();
            hrRyyj.setFryid(ryid);
            model.addAttribute("model", hrRyyj);
            
            StringBuffer sb=new StringBuffer();
            for(CommHt commHt:commHts){
            	sb.append(commHt.getFqiandingdate()).append(" ").append(commHt.getFhtname()).append("\n");
            }
            
            StringBuffer sb1=new StringBuffer();
            for(XzRyzs xzRyzs:xzRyZses){
            	sb1.append(xzRyzs.getFyear()).append(" ").append(xzRyzs.getFhjname()).append(" ").append(xzRyzs.getFtype()).append("\n");	
            }
            
            model.addAttribute("htInfo",sb.toString());
            model.addAttribute("xzRyzs",sb1.toString());
        }
        
      
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "hr/hrRyyj-info-input";
    }
    

    @RequestMapping("hrRyyj-info-input-ajax")
    public void input(@RequestParam(value = "id", required = false) Long id,HttpServletResponse response,
            Model model) {
    	JsonResponseUtil.write(response, hrRyZjManager.findBy("userid", id));
    }

    
    @RequestMapping("hrRyyj-info-save")
    public String save(@ModelAttribute HrRyyj hrRyyj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrRyyj dest = null;

        Long id = hrRyyj.getFid();

        if (id != null) {
            dest = hrRyyjManager.get(id);
            beanMapper.copy(hrRyyj, dest);
        } else {
            dest = hrRyyj;
        }

        hrRyyjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrRyyj-info-list.do";
    }

    @RequestMapping("hrRyyj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrRyyj> hrRyyjs = hrRyyjManager.findByIds(selectedItem);

        hrRyyjManager.removeAll(hrRyyjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrRyyj-info-list.do";
    }

    @RequestMapping("hrRyyj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrRyyjManager.pagedQuery(page, propertyFilters);

        List<HrRyyj> hrRyyjs = (List<HrRyyj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrRyyj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrRyyjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrRyyjManager(HrRyyjManager hrRyyjManager) {
        this.hrRyyjManager = hrRyyjManager;
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
