package com.xthena.bpm.web;

import java.util.List;
import javax.annotation.Resource;

import com.xthena.bpm.persistence.domain.BpmConfNode;
import com.xthena.bpm.persistence.domain.BpmConfUser;
import com.xthena.bpm.persistence.manager.BpmConfCountersignManager;
import com.xthena.bpm.persistence.manager.BpmConfNodeManager;
import com.xthena.bpm.persistence.manager.BpmConfUserManager;
import com.xthena.bpm.persistence.manager.BpmProcessManager;

import com.xthena.core.mapper.BeanMapper;
import org.activiti.engine.ProcessEngine;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("bpm")
public class BpmConfUserController {
    private BpmConfNodeManager bpmConfNodeManager;
    private BpmConfUserManager bpmConfUserManager;
    private BeanMapper beanMapper = new BeanMapper();
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;
    private BpmConfCountersignManager bpmConfCountersignManager;

    @RequestMapping("bpm-conf-user-list")
    public String list(@RequestParam("bpmConfNodeId") Long bpmConfNodeId,
            Model model) {
        BpmConfNode bpmConfNode = bpmConfNodeManager.get(bpmConfNodeId);
        Long bpmConfBaseId = bpmConfNode.getBpmConfBase().getId();
        List<BpmConfUser> bpmConfUsers = bpmConfUserManager.findBy(
                "bpmConfNode", bpmConfNode);

        model.addAttribute("bpmConfBaseId", bpmConfBaseId);
        model.addAttribute("bpmConfUsers", bpmConfUsers);
        model.addAttribute("bpmConfCountersign", bpmConfCountersignManager
                .findUniqueBy("bpmConfNode", bpmConfNode));

        return "bpm/bpm-conf-user-list";
    }

    @RequestMapping("bpm-conf-user-save")
    public String save(@ModelAttribute BpmConfUser bpmConfUser,
            @RequestParam("bpmConfNodeId") Long bpmConfNodeId) {
        bpmConfUser.setPriority(0);
        bpmConfUser.setStatus(1);
        bpmConfUser.setBpmConfNode(bpmConfNodeManager.get(bpmConfNodeId));
        bpmConfUserManager.save(bpmConfUser);

        return "redirect:/bpm/bpm-conf-user-list.do?bpmConfNodeId="
                + bpmConfNodeId;
    }

    @RequestMapping("bpm-conf-user-remove")
    public String remove(@RequestParam("id") Long id) {
        BpmConfUser bpmConfUser = bpmConfUserManager.get(id);
        Long bpmConfNodeId = bpmConfUser.getBpmConfNode().getId();

        if (bpmConfUser.getStatus() == 0) {
            bpmConfUser.setStatus(2);
            bpmConfUserManager.save(bpmConfUser);
        } else if (bpmConfUser.getStatus() == 1) {
            bpmConfUserManager.remove(bpmConfUser);
        } else if (bpmConfUser.getStatus() == 2) {
            bpmConfUser.setStatus(0);
            bpmConfUserManager.save(bpmConfUser);
        }

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
