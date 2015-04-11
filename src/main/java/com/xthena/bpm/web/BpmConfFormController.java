package com.xthena.bpm.web;

import java.util.List;
import javax.annotation.Resource;

import com.xthena.bpm.persistence.domain.BpmConfForm;
import com.xthena.bpm.persistence.domain.BpmConfNode;
import com.xthena.bpm.persistence.manager.BpmConfFormManager;
import com.xthena.bpm.persistence.manager.BpmConfNodeManager;
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
public class BpmConfFormController {
    private BpmConfNodeManager bpmConfNodeManager;
    private BpmConfFormManager bpmConfFormManager;
    private BeanMapper beanMapper = new BeanMapper();
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;

    @RequestMapping("bpm-conf-form-list")
    public String list(@RequestParam("bpmConfNodeId") Long bpmConfNodeId,
            Model model) {
        BpmConfNode bpmConfNode = bpmConfNodeManager.get(bpmConfNodeId);
        Long bpmConfBaseId = bpmConfNode.getBpmConfBase().getId();
        List<BpmConfForm> bpmConfForms = bpmConfFormManager.findBy(
                "bpmConfNode", bpmConfNode);
        model.addAttribute("bpmConfBaseId", bpmConfBaseId);
        model.addAttribute("bpmConfForms", bpmConfForms);

        return "bpm/bpm-conf-form-list";
    }

    @RequestMapping("bpm-conf-form-save")
    public String save(@ModelAttribute BpmConfForm bpmConfForm,
            @RequestParam("bpmConfNodeId") Long bpmConfNodeId) {
        BpmConfForm dest = bpmConfFormManager.findUnique(
                "from BpmConfForm where bpmConfNode.id=?", bpmConfNodeId);

        if (dest == null) {
            // 如果不存在，就创建一个
            bpmConfForm.setBpmConfNode(bpmConfNodeManager.get(bpmConfNodeId));
            bpmConfForm.setStatus(1);
            bpmConfFormManager.save(bpmConfForm);
        } else {
            dest.setValue(bpmConfForm.getValue());
            dest.setType(bpmConfForm.getType());
            dest.setStatus(1);
            bpmConfFormManager.save(dest);
        }

        return "redirect:/bpm/bpm-conf-form-list.do?bpmConfNodeId="
                + bpmConfNodeId;
    }

    @RequestMapping("bpm-conf-form-remove")
    public String remove(@RequestParam("id") Long id) {
        BpmConfForm bpmConfForm = bpmConfFormManager.get(id);
        Long bpmConfNodeId = bpmConfForm.getBpmConfNode().getId();

        if (bpmConfForm.getStatus() == 0) {
            bpmConfForm.setStatus(2);
            bpmConfFormManager.save(bpmConfForm);
        } else if (bpmConfForm.getStatus() == 2) {
            bpmConfForm.setStatus(1);
            bpmConfFormManager.save(bpmConfForm);
        } else if (bpmConfForm.getStatus() == 1) {
            if (bpmConfForm.getOriginValue() == null) {
                bpmConfFormManager.remove(bpmConfForm);
            } else {
                bpmConfForm.setStatus(0);
                bpmConfForm.setValue(bpmConfForm.getOriginValue());
                bpmConfForm.setType(bpmConfForm.getOriginType());
                bpmConfFormManager.save(bpmConfForm);
            }
        }

        return "redirect:/bpm/bpm-conf-form-list.do?bpmConfNodeId="
                + bpmConfNodeId;
    }

    // ~ ======================================================================
    @Resource
    public void setBpmConfNodeManager(BpmConfNodeManager bpmConfNodeManager) {
        this.bpmConfNodeManager = bpmConfNodeManager;
    }

    @Resource
    public void setBpmConfFormManager(BpmConfFormManager bpmConfFormManager) {
        this.bpmConfFormManager = bpmConfFormManager;
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
