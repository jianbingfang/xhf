package com.xthena.jl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.jl.domain.JlJindugenzong;
import com.xthena.jl.domain.JlJindugenzongDetail;
import com.xthena.jl.manager.JlJindugenzongDetailManager;
import com.xthena.jl.manager.JlJindugenzongManager;
import com.xthena.util.JsonResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("jl")
public class JlJindugenzongDetailController {
    private JlJindugenzongDetailManager jljindugenzongDetailManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlJindugenzongManager jindugenzongManager;

    @RequestMapping("jljindugenzongDetail-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jljindugenzongDetailManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jljindugenzongDetail-info-list";
    }

    @RequestMapping("jljindugenzongDetail-info-input")
    public String input(@RequestParam(value = "fgzid", required = false) Long fgzid,
                        @RequestParam(value = "type", required = false) String type,
                        @RequestParam Map<String, Object> parameterMap,
                        Model model) {

        List<JlJindugenzongDetail> jlJindugenzongDetails = jljindugenzongDetailManager.findBy("fgzid", fgzid);
        model.addAttribute("list", jlJindugenzongDetails);
        model.addAttribute("ftype", type);

        return "jl/jljindugenzongDetail-info-input";
    }

    @RequestMapping("jljindugenzongDetail-info-save")
    public String save(@ModelAttribute JlJindugenzongDetail jljindugenzongDetail,
                       @RequestParam Map<String, Object> parameterMap, @RequestParam(value = "type", required = false) String type,
                       RedirectAttributes redirectAttributes) {
        JlJindugenzongDetail dest = null;

        Long id = jljindugenzongDetail.getFid();

        if (id != null) {
            dest = jljindugenzongDetailManager.get(id);
            beanMapper.copy(jljindugenzongDetail, dest);
        } else {
            dest = jljindugenzongDetail;
            dest.setFeditdate(new Date());
        }
        dest.setFtype(type);
        jljindugenzongDetailManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jljindugenzongDetail-info-input.do?fgzid=" + dest.getFgzid() + "&type=" + dest.getFtype();
    }

    @ResponseBody
    @RequestMapping("jljindugenzongDetail-list-ajax")
    public Object detailListAjax(@RequestParam(value = "fgzid", required = false) Long fgzid, HttpServletResponse response) {
        HashMap<String, Object> result = new HashMap<>();
        JlJindugenzong jlJindugenzong = jindugenzongManager.get(fgzid);

        //得到起始值
        //long startTime=jlJindugenzong.getFstartdate().getTime();
        Calendar c = Calendar.getInstance();
        if (jlJindugenzong.getFstartdate() != null) {
            c.setTime(jlJindugenzong.getFstartdate());
        }
        int startYear = c.get(Calendar.YEAR);
        int startMonth = c.get(Calendar.MONTH);
        result.put("startYear", startYear);
        result.put("startMonth", startMonth);

        //起始月的时间值，依次来计算后面的时间偏移量
        c.set(startYear, startMonth, 1);
        Date plainStartMonth = c.getTime();

        List<HashMap<String, Object>> detailList = new ArrayList<>();
        List<JlJindugenzongDetail> jlJindugenzongDetails = jljindugenzongDetailManager.findBy("fgzid", fgzid);
        for (JlJindugenzongDetail jindugenzongDetail : jlJindugenzongDetails) {
            HashMap<String, Object> detailMap = new HashMap<>();
            detailMap.put("fname", jindugenzongDetail.getFname());
            if (jindugenzongDetail.getFstartdate() != null && jindugenzongDetail.getFenddate() != null) {
                detailMap.put("fstart", getSubDay(jindugenzongDetail.getFstartdate(), plainStartMonth));
                detailMap.put("fend", getSubDay(jindugenzongDetail.getFenddate(), plainStartMonth));
            }
            if (jindugenzongDetail.getFrealstart() != null && jindugenzongDetail.getFrealend() != null) {
                detailMap.put("frealstart", getSubDay(jindugenzongDetail.getFrealstart(), plainStartMonth));
                detailMap.put("frealend", getSubDay(jindugenzongDetail.getFrealend(), plainStartMonth));
            }
            detailList.add(detailMap);
        }
        result.put("taskList", detailList);

        return result;
    }


    @RequestMapping("jljindugenzongDetail-load-ajax")
    public void detailloadAjax(@RequestParam(value = "fid", required = false) Long fid, HttpServletResponse response) {
        JsonResponseUtil.write(response, jljindugenzongDetailManager.get(fid));
    }


    private long getSubDay(Date endDate, Date startDate) {
        return (endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24);
    }

    private long getSubMonth(Date endDate, Date startDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(endDate);

        Calendar c1 = Calendar.getInstance();
        c1.setTime(startDate);

        return (c.get(Calendar.YEAR) - c1.get(Calendar.YEAR)) * 12 + c.get(Calendar.MONTH) - c1.get(Calendar.MONTH);
    }

    @RequestMapping("jljindugenzongDetail-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes, @RequestParam Map<String, Object> parameterMap, @RequestParam(value = "type", required = false) String type) {
        List<JlJindugenzongDetail> jljindugenzongDetails = jljindugenzongDetailManager.findByIds(selectedItem);

        jljindugenzongDetailManager.removeAll(jljindugenzongDetails);

        String ftype = "";
        if (parameterMap.containsKey("filter_EQS_ftype")) {
            String pagetype = parameterMap.get("filter_EQS_ftype").toString();
            ftype = pagetype;
        } else if (type != null) {
            ftype = type;
        }

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jljindugenzongDetail-info-input.do?fgzid=" + jljindugenzongDetails.get(0).getFgzid()
                + "&type=" + ftype;
    }

    @RequestMapping("jljindugenzongDetail-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jljindugenzongDetailManager.pagedQuery(page, propertyFilters);

        List<JlJindugenzongDetail> jljindugenzongDetails = (List<JlJindugenzongDetail>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jljindugenzongDetail info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jljindugenzongDetails);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlJindugenzongDetailManager(JlJindugenzongDetailManager jljindugenzongDetailManager) {
        this.jljindugenzongDetailManager = jljindugenzongDetailManager;
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
