package com.xthena.bpm.web;

import java.util.List;
import javax.annotation.Resource;

import com.xthena.bpm.persistence.domain.BpmConfNode;
import com.xthena.bpm.persistence.domain.BpmConfNotice;
import com.xthena.bpm.persistence.domain.BpmMailTemplate;
import com.xthena.bpm.persistence.manager.BpmConfNodeManager;
import com.xthena.bpm.persistence.manager.BpmConfNoticeManager;
import com.xthena.bpm.persistence.manager.BpmMailTemplateManager;
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
public class BpmConfNoticeController {
    private BpmConfNodeManager bpmConfNodeManager;
    private BpmConfNoticeManager bpmConfNoticeManager;
    private BpmMailTemplateManager bpmMailTemplateManager;
    private BeanMapper beanMapper = new BeanMapper();
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;

    @RequestMapping("bpm-conf-notice-list")
    public String list(@RequestParam("bpmConfNodeId") Long bpmConfNodeId,
            Model model) {
        BpmConfNode bpmConfNode = bpmConfNodeManager.get(bpmConfNodeId);
        Long bpmConfBaseId = bpmConfNode.getBpmConfBase().getId();
        List<BpmConfNotice> bpmConfNotices = bpmConfNoticeManager.findBy(
                "bpmConfNode", bpmConfNode);
        List<BpmMailTemplate> bpmMailTemplates = bpmMailTemplateManager
                .getAll();

        model.addAttribute("bpmConfBaseId", bpmConfBaseId);
        model.addAttribute("bpmConfNotices", bpmConfNotices);
        model.addAttribute("bpmMailTemplates", bpmMailTemplates);

        return "bpm/bpm-conf-notice-list";
    }

    @RequestMapping("bpm-conf-notice-input")
    public String input(Model model) {
        List<BpmMailTemplate> bpmMailTemplates = bpmMailTemplateManager
                .getAll();
        model.addAttribute("bpmMailTemplates", bpmMailTemplates);

        return "bpm/bpm-conf-notice-input";
    }

    @RequestMapping("bpm-conf-notice-save")
    public String save(@ModelAttribute BpmConfNotice bpmConfNotice,
            @RequestParam("bpmConfNodeId") Long bpmConfNodeId,
            @RequestParam("bpmMailTemplateId") Long bpmMailTemplateId) {
        bpmConfNotice.setBpmConfNode(bpmConfNodeManager.get(bpmConfNodeId));
        bpmConfNotice.setBpmMailTemplate(bpmMailTemplateManager
                .get(bpmMailTemplateId));
        bpmConfNoticeManager.save(bpmConfNotice);

        return "redirect:/bpm/bpm-conf-notice-list.do?bpmConfNodeId="
                + bpmConfNodeId;
    }

    @RequestMapping("bpm-conf-notice-remove")
    public String remove(@RequestParam("id") Long id) {
        BpmConfNotice bpmConfNotice = bpmConfNoticeManager.get(id);
        Long bpmConfNodeId = bpmConfNotice.getBpmConfNode().getId();
        bpmConfNoticeManager.remove(bpmConfNotice);

        return "redirect:/bpm/bpm-conf-notice-list.do?bpmConfNodeId="
                + bpmConfNodeId;
    }

    // ~ ======================================================================
    @Resource
    public void setBpmConfNodeManager(BpmConfNodeManager bpmConfNodeManager) {
        this.bpmConfNodeManager = bpmConfNodeManager;
    }

    @Resource
    public void setBpmConfNoticeManager(
            BpmConfNoticeManager bpmConfNoticeManager) {
        this.bpmConfNoticeManager = bpmConfNoticeManager;
    }

    @Resource
    public void setBpmProcessManager(BpmProcessManager bpmProcessManager) {
        this.bpmProcessManager = bpmProcessManager;
    }

    @Resource
    public void setBpmMailTemplateManager(
            BpmMailTemplateManager bpmMailTemplateManager) {
        this.bpmMailTemplateManager = bpmMailTemplateManager;
    }

    @Resource
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }
}
