package com.xthena.bpm.cmd;

import com.xthena.bpm.delegate.DelegateService;
import com.xthena.core.spring.ApplicationContextHelper;

import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 委托任务.
 */
public class DelegateTaskCmd implements Command<Void> {
    private static Logger logger = LoggerFactory
            .getLogger(DelegateTaskCmd.class);
    private String taskId;
    private String attorney;

    public DelegateTaskCmd(String taskId, String attorney) {
        this.taskId = taskId;
        this.attorney = attorney;
    }

    /**
     * 委托任务.
     * 
     */
    @Override
	public Void execute(CommandContext commandContext) {
        TaskEntity task = Context.getCommandContext().getTaskEntityManager()
                .findTaskById(taskId);

        String assignee = task.getAssignee();

        if (task.getOwner() == null) {
            task.setOwner(assignee);
        }

        task.setAssignee(attorney);
        ApplicationContextHelper.getBean(DelegateService.class).saveRecord(
                assignee, attorney, taskId);

        return null;
    }
}
