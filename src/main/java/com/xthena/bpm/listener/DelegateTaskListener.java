package com.xthena.bpm.listener;

import javax.annotation.Resource;

import com.xthena.bpm.cmd.DelegateTaskCmd;
import com.xthena.bpm.delegate.DelegateInfo;
import com.xthena.bpm.delegate.DelegateService;
import com.xthena.bpm.support.DefaultTaskListener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.impl.context.Context;

public class DelegateTaskListener extends DefaultTaskListener {
    private DelegateService delegateService;

    @Override
    public void onAssignment(DelegateTask delegateTask) throws Exception {
        String assignee = delegateTask.getAssignee();
        String processDefinitionId = delegateTask.getProcessDefinitionId();
        DelegateInfo delegateInfo = delegateService.getDelegateInfo(assignee,
                processDefinitionId);

        if (delegateInfo == null) {
            return;
        }

        String attorney = delegateInfo.getAttorney();
        new DelegateTaskCmd(delegateTask.getId(), attorney).execute(Context
                .getCommandContext());
    }

    @Resource
    public void setDelegateService(DelegateService delegateService) {
        this.delegateService = delegateService;
    }
}
