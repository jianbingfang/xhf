package com.xthena.bpm.cmd;

import com.xthena.bpm.notice.TimeoutNotice;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.TaskEntity;

public class SendNoticeCmd implements Command<Void> {
    private String taskId;

    public SendNoticeCmd(String taskId) {
        this.taskId = taskId;
    }

    @Override
	public Void execute(CommandContext commandContext) {
        TaskEntity delegateTask = commandContext.getTaskEntityManager()
                .findTaskById(taskId);
        new TimeoutNotice().process(delegateTask);

        return null;
    }
}
