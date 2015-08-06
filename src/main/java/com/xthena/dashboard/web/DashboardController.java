package com.xthena.dashboard.web;

import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.cms.manager.CmsArticleManager;
import com.xthena.common.manager.CommRemindManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.page.Page;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.JsonResponseUtil;
import com.xthena.xz.domain.XzCommNews;
import com.xthena.xz.manager.XzCommNewsManager;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("dashboard")
public class DashboardController {
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;
    private CmsArticleManager cmsArticleManager;



    @Autowired
    private JyXmManager jyXmManager;

    @Autowired
    private JyXmManager jyXmManager;

    @Autowired
    private CommRemindManager commRemindManager;

    @Autowired
    private XzCommNewsManager commNewsManager;

    @RequestMapping("dashboard")
    public String list(Model model) {
        String userId = SpringSecurityUtils.getCurrentUserId();
        List<Task> personalTasks = processEngine.getTaskService()
                .createTaskQuery().taskAssignee(userId).orderByTaskCreateTime().desc().list();
        List<HistoricProcessInstance> historicProcessInstances = processEngine
                .getHistoryService().createHistoricProcessInstanceQuery()
                .startedBy(userId).orderByProcessInstanceStartTime().desc().unfinished().list();
        List<BpmProcess> bpmProcesses = bpmProcessManager.getAll();
        HashMap<String, String> processKeyName = new HashMap<String, String>();
        for (BpmProcess bpmProcess : bpmProcesses) {
            processKeyName.put(bpmProcess.getBpmConfBase().getProcessDefinitionId(), bpmProcess.getName());
        }
//        List<CmsArticle> cmsArticles = cmsArticleManager.getAll();

        String hqlNews = "from XzCommNews news " +
                "order by case news.fitop when '是' then 0 else 1 end, news.fcreatedate desc";
        List<XzCommNews> commNews = commNewsManager.find(hqlNews);

        model.addAttribute("personalTasks", personalTasks);
        model.addAttribute("historicProcessInstances", historicProcessInstances);
        model.addAttribute("bpmProcesses", bpmProcesses);

        model.addAttribute("cmsArticles", commNews);
        model.addAttribute("processKeyName", processKeyName);
        String hql = "select commRemind from CommRemind commRemind" +
                " where commRemind.fremindtime < ?" +
                " and commRemind.fremindry = ?" +
                " and (commRemind.fstatus='未提醒' or commRemind.fstatus='已提醒' or commRemind.fstatus='已忽略' or commRemind.fstatus='已延迟')" +
                " order by commRemind.fremindtime desc";
        model.addAttribute("remindList", commRemindManager.find(hql, new Date(), Long.valueOf(userId)));

        return "dashboard/dashboard";
    }


    @RequestMapping("comm-news-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            XzCommNews xzcCommNews = commNewsManager.get(id);
            model.addAttribute("model", xzcCommNews);
        }

        return "comm/comm-news-info";
    }



    @ResponseBody
    @RequestMapping("get-remind-list")
    public Object remindList() {

        String userId = SpringSecurityUtils.getCurrentUserId();
        String hql = "select commRemind from CommRemind commRemind where commRemind.fremindtime< ? and commRemind.fremindry= ? and ( commRemind.fstatus='未提醒' or commRemind.fstatus='已提醒' or commRemind.fstatus='已忽略' or commRemind.fstatus='已延迟')";
        List remindList = commRemindManager.find(hql, new Date(), Long.valueOf(userId));

        return remindList;
    }

    // ~ ==================================================
    @Resource
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    @Resource
    public void setBpmProcessManager(BpmProcessManager bpmProcessManager) {
        this.bpmProcessManager = bpmProcessManager;
    }

    @Resource
    public void setCmsArticleManager(CmsArticleManager cmsArticleManager) {
        this.cmsArticleManager = cmsArticleManager;
    }
}
