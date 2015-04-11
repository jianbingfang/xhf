package com.xthena.dashboard.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;

import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.cms.domain.*;
import com.xthena.cms.manager.*;
import com.xthena.common.domain.CommRemind;
import com.xthena.common.domain.XhfCommonDoc;
import com.xthena.common.manager.CommRemindManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.xz.domain.XzCommNews;
import com.xthena.xz.manager.XzCommNewsManager;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.*;
import org.activiti.engine.task.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("dashboard")
public class DashboardController {
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;
    private CmsArticleManager cmsArticleManager;
    
    
    @Autowired
    private CommRemindManager commRemindManager;
    
    @Autowired
    private XzCommNewsManager commNewsManager;

    @RequestMapping("dashboard")
    public String list(Model model) {
        String userId = SpringSecurityUtils.getCurrentUserId();
        List<Task> personalTasks = processEngine.getTaskService()
                .createTaskQuery().taskAssignee(userId).list();
        List<HistoricProcessInstance> historicProcessInstances = processEngine
                .getHistoryService().createHistoricProcessInstanceQuery()
                .startedBy(userId).unfinished().list();
        List<BpmProcess> bpmProcesses = bpmProcessManager.getAll();
        HashMap<String, String> processKeyName=new HashMap<String, String>();
        for(BpmProcess bpmProcess:bpmProcesses){
        	processKeyName.put(bpmProcess.getBpmConfBase().getProcessDefinitionId(), bpmProcess.getName());
        }
        //List<CmsArticle> cmsArticles = cmsArticleManager.getAll();
        model.addAttribute("personalTasks", personalTasks);
        model.addAttribute("historicProcessInstances", historicProcessInstances);
        model.addAttribute("bpmProcesses", bpmProcesses);
        model.addAttribute("cmsArticles", commNewsManager.getAll());
        model.addAttribute("processKeyName", processKeyName);
        String hql="select commRemind from CommRemind commRemind where commRemind.fremindtime< ? and commRemind.fremindry= ? and ( commRemind.fstatus='未提醒' or commRemind.fstatus='已提醒' or commRemind.fstatus='已忽略' or commRemind.fstatus='已延迟')";
        model.addAttribute("remindList", commRemindManager.find(hql, new Date(),Long.valueOf(userId)));
        
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
