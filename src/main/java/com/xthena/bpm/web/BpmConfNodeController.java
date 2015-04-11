package com.xthena.bpm.web;

import java.util.List;
import javax.annotation.Resource;

import com.xthena.bpm.persistence.domain.BpmConfBase;
import com.xthena.bpm.persistence.domain.BpmConfNode;
import com.xthena.bpm.persistence.manager.BpmConfBaseManager;
import com.xthena.bpm.persistence.manager.BpmConfNodeManager;
import com.xthena.bpm.persistence.manager.BpmConfUserManager;
import com.xthena.bpm.persistence.manager.BpmProcessManager;

import com.xthena.core.mapper.BeanMapper;
import org.activiti.engine.ProcessEngine;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("bpm")
public class BpmConfNodeController {
    private BpmConfUserManager bpmConfUserManager;
    private BpmConfNodeManager bpmConfNodeManager;
    private BpmConfBaseManager bpmConfBaseManager;
    private BeanMapper beanMapper = new BeanMapper();
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;

    @RequestMapping("bpm-conf-node-list")
    public String list(@RequestParam("bpmConfBaseId") Long bpmConfBaseId,
            Model model) {
        BpmConfBase bpmConfBase = bpmConfBaseManager.get(bpmConfBaseId);
        List<BpmConfNode> bpmConfNodes = bpmConfNodeManager.findBy(
                "bpmConfBase", bpmConfBase);

        model.addAttribute("bpmConfNodes", bpmConfNodes);

        return "bpm/bpm-conf-node-list";
    }

    // ~ ======================================================================
    @Resource
    public void setBpmConfUserManager(BpmConfUserManager bpmConfUserManager) {
        this.bpmConfUserManager = bpmConfUserManager;
    }

    @Resource
    public void setBpmConfNodeManager(BpmConfNodeManager bpmConfNodeManager) {
        this.bpmConfNodeManager = bpmConfNodeManager;
    }

    @Resource
    public void setBpmConfBaseManager(BpmConfBaseManager bpmConfBaseManager) {
        this.bpmConfBaseManager = bpmConfBaseManager;
    }

    @Resource
    public void setBpmProcessManager(BpmProcessManager bpmProcessManager) {
        this.bpmProcessManager = bpmProcessManager;
    }

    @Resource
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }
}
