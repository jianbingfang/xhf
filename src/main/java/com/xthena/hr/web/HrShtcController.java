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
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.domain.HrShtc;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrShtcManager;
import com.xthena.util.CommRyMapUtil;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrShtcController {
	@Autowired
	private CommRyManager commRyManager;
	
    private HrShtcManager hrShtcManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrShtc-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        String hql="select a from HrShtc a,CommRy b where a.fryid=b.fid ";
        
        
        if(parameterMap.get("filter_LIKES_fmemo1")!=null&&!parameterMap.get("filter_LIKES_fmemo1").equals("")){
        	hql+=" and b.fname like '%"+parameterMap.get("filter_LIKES_fmemo1")+"%'";
        }
        
      /*  List<CommRy> commRies=commRyManager.find(propertyFilters);
        List<Long> ryids=new ArrayList<Long>();
        for(CommRy commRy:commRies){
        	ryids.add(commRy.getFid());
        }
        
        if(!ryids.isEmpty()){
        	Criterion criterion=Restrictions.in("fryid", ryids);
        	page = hrShtcManager.pagedQuery(page.getPageNo(), page.getPageSize(),criterion);
        }else if(parameterMap.isEmpty()){
        	page = hrShtcManager.pagedQuery(page.getPageNo(), page.getPageSize());
        }
        
        List<HrShtc> hrShtcs=(List<HrShtc>) page.getResult();
        for(HrShtc hrShtc:hrShtcs){
        	hrShtc.setFmemo1(commRyManager.get(hrShtc.getFryid()).getFname());
        }
        */
        
        page = hrShtcManager.pagedQuery(hql, page.getPageNo(), page.getPageSize());
        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "hr/hrShtc-info-list";
    }

    @RequestMapping("hrShtc-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ryid", required = false) Long ryid,
            Model model) {
    	
    	if(ryid!=null){
    		
    		List<HrShtc> hrShtcs= hrShtcManager.findBy("fryid", ryid);
    		if(!hrShtcs.isEmpty()){
    			hrShtcs.get(0).setFryid(ryid);
    			model.addAttribute("model", hrShtcs.get(0));
    		}else{
    			HrShtc hrShtc=new HrShtc();
    			hrShtc.setFryid(ryid);
    			model.addAttribute("model",hrShtc);
    		}
    		model.addAttribute("userName", commRyManager.get(ryid).getFname());
    		model.addAttribute("fryno", commRyManager.get(ryid).getFcardno());
    	}
        
    	if (id != null) {
    		HrShtc hrShtc=hrShtcManager.get(id);
            model.addAttribute("model", hrShtc);
            model.addAttribute("userName", commRyManager.get(hrShtc.getFryid()).getFname());
            model.addAttribute("fryno", commRyManager.get(hrShtc.getFryid()).getFcardno());
        }
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "hr/hrShtc-info-input";
    }

    @RequestMapping("hrShtc-info-save")
    public String save(@ModelAttribute HrShtc hrShtc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrShtc dest = null;

        Long id = hrShtc.getFid();

        if (id != null) {
            dest = hrShtcManager.get(id);
            beanMapper.copy(hrShtc, dest);
        } else {
            dest = hrShtc;
        }

        hrShtcManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrShtc-info-list.do";
    }
    
    @RequestMapping("hrShtc-info-batchUpdate")
    public String batchSave(@ModelAttribute HrShtc hrShtc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	
    //	hrShtcManager.
    		
        hrShtcManager.save(hrShtc);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrShtc-info-list.do";
    }
    
    

    @RequestMapping("hrShtc-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrShtc> hrShtcs = hrShtcManager.findByIds(selectedItem);

        hrShtcManager.removeAll(hrShtcs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrShtc-info-list.do";
    }

    @RequestMapping("hrShtc-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrShtcManager.pagedQuery(page, propertyFilters);

        List<HrShtc> hrShtcs = (List<HrShtc>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrShtc info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrShtcs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrShtcManager(HrShtcManager hrShtcManager) {
        this.hrShtcManager = hrShtcManager;
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
