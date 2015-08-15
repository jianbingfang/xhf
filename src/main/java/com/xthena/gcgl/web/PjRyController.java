package com.xthena.gcgl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjRy;
import com.xthena.gcgl.domain.PjRyRecord;
import com.xthena.gcgl.manager.PjRyManager;
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.domain.HrLz;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrLzManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.PjXmMapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("gcgl")
public class PjRyController {
    private PjRyManager pjRyManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CommRyManager commRyManager;

    @Autowired
    private HrLzManager hrLzManager;

    @RequestMapping("pjRy-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fstatus", "在岗");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrderBy("fxmid");
        page = pjRyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/pjRy-info-list";
    }

    @RequestMapping("pjRy-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id, @RequestParam(value = "fxmid", required = false) Long fxmid,
                        Model model) {
        if (id != null) {
            PjRy pjRy = pjRyManager.get(id);
            model.addAttribute("model", pjRy);
        }

        if (id == null && fxmid != null) {
            PjRy pjRy = new PjRy();
            pjRy.setFxmid(fxmid);

            model.addAttribute("model", pjRy);
        }

        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/pjRy-info-input";
    }


    @RequestMapping("pjRy-info-add")
    public String add(@RequestParam(value = "id", required = false) Long id, @RequestParam(value = "fxmid", required = false) Long fxmid,
                      Model model) {

        if (id != null) {
            PjRy pjRy = pjRyManager.get(id);
            model.addAttribute("model", pjRy);
        }

        if (id == null && fxmid != null) {
            PjRy pjRy = new PjRy();
            pjRy.setFxmid(fxmid);

            model.addAttribute("model", pjRy);
        }

        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());

        return "gcgl/pjRy-info-add";
    }

    @RequestMapping("pjRy-info-addsave")
    public String addsave(@ModelAttribute PjRy pjRy,
                          @RequestParam Map<String, Object> parameterMap,
                          RedirectAttributes redirectAttributes) {
        PjRy dest = null;

        Long id = pjRy.getFid();

        if (id != null) {
            dest = pjRyManager.get(id);
            beanMapper.copy(pjRy, dest);
        } else {
            dest = pjRy;
        }

        PjRyRecord pjRyRecord = new PjRyRecord();
        pjRyRecord.setFdrxm(dest.getFxmid());
        pjRyRecord.setFdrgw(dest.getFgangwei());
        pjRyRecord.setFjingbanrenid(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        pjRyRecord.setFryid(dest.getFryid());
        pjRyRecord.setFdbdate(dest.getFstartdate());
        dest.setFstatus("在岗");
        pjRyManager.saveAndRecord(dest, pjRyRecord);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjRyRecord-info-list.do";
    }


    @RequestMapping("pjRy-info-sub")
    public String sub(@RequestParam(value = "id", required = false) Long id, @RequestParam(value = "fxmid", required = false) Long fxmid,
                      Model model) {
        if (id != null) {
            PjRy pjRy = pjRyManager.get(id);
            model.addAttribute("model", pjRy);
        }

        if (id == null && fxmid != null) {
            PjRy pjRy = new PjRy();
            pjRy.setFxmid(fxmid);

            model.addAttribute("model", pjRy);
        }

        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());

        return "gcgl/pjRy-info-sub";
    }


    @RequestMapping("pjRy-info-subsave")
    public String subsave(@ModelAttribute PjRy pjRy,
                          @RequestParam Map<String, Object> parameterMap,
                          RedirectAttributes redirectAttributes) {
        PjRy dest = null;

        Long id = pjRy.getFid();

        if (id != null) {
            dest = pjRyManager.get(id);
            beanMapper.copy(pjRy, dest);
        } else {
            dest = pjRy;
        }

   /*    PjRyRecord pjRyRecord=new PjRyRecord();
        pjRyRecord.setFdrxm(dest.getFxmid());
        pjRyRecord.setFdrgw(dest.getFgangwei());
        pjRyRecord.setFjingbanrenid(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        pjRyRecord.setFryid(dest.getFryid());
        pjRyRecord.setFdbdate(dest.getFstartdate());*/


        pjRyManager.saveSub(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjRyRecord-info-list.do";
    }


    @RequestMapping("pjXmRy-simple-list-ajax")
    public void listAjax(@ModelAttribute Page page, @RequestParam(value = "fxmid", required = false) Long fxmid,
                         @RequestParam Map<String, Object> parameterMap, Model model, HttpServletResponse response) {
        List<PjRy> pjRies = pjRyManager.find("select pjry from PjRy pjry where fxmid=? and fstatus='在岗'", fxmid);
        List<Long> ryids = new ArrayList<Long>();
        for (PjRy pjRy : pjRies) {
            ryids.add(pjRy.getFryid());
        }
        List<CommRy> commRies = commRyManager.findByIds(ryids);
        JsonResponseUtil.write(response, commRies);
    }

    @RequestMapping("hrLz-simple-list-ajax")
    public void listhrLzAjax(@ModelAttribute Page page, @RequestParam(value = "fxmid", required = false) Long fxmid,
                             @RequestParam Map<String, Object> parameterMap, Model model, HttpServletResponse response) {
        List<HrLz> pjRies = hrLzManager.find("select hrlz from HrLz hrlz ");
        List<Long> ryids = new ArrayList<Long>();

        for (HrLz pjRy : pjRies) {
            ryids.add(pjRy.getFry());
        }

        List<CommRy> commRies = new ArrayList<CommRy>();
        if (!ryids.isEmpty()) {
            commRies = commRyManager.findByIds(ryids);
        }
        JsonResponseUtil.write(response, commRies);
    }


    @RequestMapping("pjRy-info-save")
    public String save(@ModelAttribute PjRy pjRy,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        PjRy dest = null;

        Long id = pjRy.getFid();

        if (id != null) {
            dest = pjRyManager.get(id);
            beanMapper.copy(pjRy, dest);
        } else {
            dest = pjRy;
        }

        PjRyRecord pjRyRecord = new PjRyRecord();
        pjRyRecord.setFdrxm(dest.getFxmid());
        pjRyRecord.setFdrgw(dest.getFgangwei());
        pjRyRecord.setFjingbanrenid(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        pjRyRecord.setFryid(dest.getFryid());
        pjRyRecord.setFdbdate(dest.getFstartdate());
        dest.setFstatus("在岗");
        pjRyManager.saveAndRecord(dest, pjRyRecord);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/jlDept-info-input.do?fxmid=" + dest.getFxmid();
    }

    @RequestMapping("pjRy-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<PjRy> pjRys = pjRyManager.findByIds(selectedItem);

        pjRyManager.removeAll(pjRys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

//        return "redirect:/gcgl/jlDept-info-input.do?fxmid="+pjRys.get(0).getFxmid();
        return "redirect:/gcgl/pjRy-info-list.do";
    }

    @RequestMapping("pjRy-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjRyManager.pagedQuery(page, propertyFilters);

        List<PjRy> pjRys = (List<PjRy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjRy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjRys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjRyManager(PjRyManager pjRyManager) {
        this.pjRyManager = pjRyManager;
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
