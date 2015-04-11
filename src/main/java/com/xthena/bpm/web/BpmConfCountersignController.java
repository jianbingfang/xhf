package com.xthena.bpm.web;

import javax.annotation.Resource;

import com.xthena.bpm.persistence.domain.BpmConfCountersign;
import com.xthena.bpm.persistence.manager.BpmConfCountersignManager;
import com.xthena.bpm.persistence.manager.BpmConfNodeManager;
import com.xthena.bpm.persistence.manager.BpmConfUserManager;
import com.xthena.bpm.persistence.manager.BpmProcessManager;

import com.xthena.core.mapper.BeanMapper;
import org.activiti.engine.ProcessEngine;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("bpm")
public class BpmConfCountersignController {
    private BpmConfNodeManager bpmConfNodeManager;
    private BpmConfUserManager bpmConfUserManager;
    private BeanMapper beanMapper = new BeanMapper();
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;
    private BpmConfCountersignManager bpmConfCountersignManager;

    @RequestMapping("bpm-conf-countersign-save")
    public String save(@ModelAttribute BpmConfCountersign bpmConfCountersign,
            @RequestParam("bpmConfNodeId") Long bpmConfNodeId) {
        BpmConfCountersign dest = bpmConfCountersignManager
                .get(bpmConfCountersign.getId());
        beanMapper.copy(bpmConfCountersign, dest);
        bpmConfCountersignManager.save(dest);

        return "redirect:/bpm/bpm-conf-user-list.do?bpmConfNodeId="
                + bpmConfNodeId;
    }

    // ~ ======================================================================
    @Resource
    public void setBpmConfNodeManager(BpmConfNodeManager bpmConfNodeManager) {
        this.bpmConfNodeManager = bpmConfNodeManager;
    }

    @Resource
    public void setBpmConfUserManager(BpmConfUserManager bpmConfUserManager) {
        this.bpmConfUserManager = bpmConfUserManager;
    }

    @Resource
    public void setBpmProcessManager(BpmProcessManager bpmProcessManager) {
        this.bpmProcessManager = bpmProcessManager;
    }

    @Resource
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    @Resource
    public void setBpmConfCountersignManager(
            BpmConfCountersignManager bpmConfCountersignManager) {
        this.bpmConfCountersignManager = bpmConfCountersignManager;
    }
}
