package com.xthena.common.web;

import com.xthena.api.user.UserConnector;
import com.xthena.common.domain.CommRemind;
import com.xthena.common.domain.CommRemindConf;
import com.xthena.common.manager.CommRemindConfManager;
import com.xthena.common.manager.CommRemindManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
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
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("comm")
public class CommRemindController {
    private CommRemindManager commRemindManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CommRemindConfManager commRemindConfManager;

    @RequestMapping("commRemind-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "comm/commRemind-info-list";
    }

    @ResponseBody
    @RequestMapping("remind-info-ajax")
    public Object remind(@RequestParam long fid) {
        return commRemindManager.get(fid);
    }

    @ResponseBody
    @RequestMapping("remind-done-ajax")
    public Object done(@RequestParam long fid) {
        CommRemind commRemind = commRemindManager.get(fid);
        commRemind.setFstatus("已处理");
        commRemindManager.save(commRemind);
        return true;
    }


    @ResponseBody
    @RequestMapping("remind-delay-ajax")
    public Object delay(@RequestParam long fid, @RequestParam String nextRemindDate) {

        CommRemind commRemind = commRemindManager.get(fid);

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date date;
        try {
            date = sf.parse(nextRemindDate);
            commRemind.setFremindtime(new Timestamp(date.getTime()));
        } catch (ParseException e) {
            e.printStackTrace();
            return false;
        }
        commRemind.setFstatus("已延迟");
        commRemindManager.save(commRemind);

        return true;
    }

    @ResponseBody
    @RequestMapping("remind-ignore-ajax")
    public Object ignore(@RequestParam long fid) {
        CommRemind commRemind = commRemindManager.get(fid);
        CommRemindConf commRemindConf = commRemindConfManager.get(commRemind.getFconfid());
        if (commRemind.getFtimes() < commRemindConf.getFtimes()) {
            String unit = commRemindConf.getFintervalunit();
            Calendar now = Calendar.getInstance();
            if (unit.equals("年")) {
                now.add(Calendar.YEAR, commRemindConf.getFinterval());
            } else if (unit.equals("月")) {
                now.add(Calendar.MONTH, commRemindConf.getFinterval());
            } else if (unit.equals("天")) {
                now.add(Calendar.DATE, commRemindConf.getFinterval());
            } else if (unit.equals("小时")) {
                now.add(Calendar.HOUR_OF_DAY, commRemindConf.getFinterval());
            } else if (unit.equals("分钟")) {
                now.add(Calendar.MINUTE, commRemindConf.getFinterval());
            }
            commRemind.setFstatus("已忽略");
            commRemind.setFremindtime(new Timestamp(now.getTimeInMillis()));
            commRemindManager.save(commRemind);
        } else {
            commRemind.setFstatus("已逾期");
            commRemindManager.save(commRemind);
        }

        return true;
    }

    @RequestMapping("commRemind-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            CommRemind commRemind = commRemindManager.get(id);
            model.addAttribute("model", commRemind);
        }

        return "comm/commRemind-info-input";
    }

    @RequestMapping("commRemind-info-save")
    public String save(@ModelAttribute CommRemind commRemind,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        CommRemind dest = null;

        Long id = commRemind.getFid();

        if (id != null) {
            dest = commRemindManager.get(id);
            beanMapper.copy(commRemind, dest);
        } else {
            dest = commRemind;
        }

        commRemindManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/comm/commRemind-info-list.do";
    }

    @RequestMapping("commRemind-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<CommRemind> commReminds = commRemindManager.findByIds(selectedItem);

        commRemindManager.removeAll(commReminds);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/comm/commRemind-info-list.do";
    }

    @RequestMapping("commRemind-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindManager.pagedQuery(page, propertyFilters);

        List<CommRemind> commReminds = (List<CommRemind>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commRemind info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commReminds);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommRemindManager(CommRemindManager commRemindManager) {
        this.commRemindManager = commRemindManager;
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
