package com.xthena.bpm.listener;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;

import com.xthena.bpm.persistence.domain.BpmConfUser;
import com.xthena.bpm.persistence.manager.BpmConfUserManager;
import com.xthena.bpm.support.DefaultTaskListener;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.el.ExpressionManager;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CopyTaskListener extends DefaultTaskListener {
    public static final int TYPE_COPY = 3;
    private static Logger logger = LoggerFactory
            .getLogger(CopyTaskListener.class);
    private BpmConfUserManager bpmConfUserManager;

    @Override
    public void onCreate(DelegateTask delegateTask) throws Exception {
        List<BpmConfUser> bpmConfUsers = bpmConfUserManager
                .find("from BpmConfUser where bpmConfNode.bpmConfBase.processDefinitionId=? and bpmConfNode.code=?",
                        delegateTask.getProcessDefinitionId(), delegateTask
                                .getExecution().getCurrentActivityId());
        logger.debug("{}", bpmConfUsers);

        ExpressionManager expressionManager = Context
                .getProcessEngineConfiguration().getExpressionManager();

        try {
            for (BpmConfUser bpmConfUser : bpmConfUsers) {
                logger.debug("status : {}, type: {}", bpmConfUser.getStatus(),
                        bpmConfUser.getType());
                logger.debug("value : {}", bpmConfUser.getValue());

                String value = expressionManager
                        .createExpression(bpmConfUser.getValue())
                        .getValue(delegateTask).toString();

                if (bpmConfUser.getStatus() == 1) {
                    if (bpmConfUser.getType() == TYPE_COPY) {
                        this.copyTask(delegateTask, value);
                    }
                }
            }
        } catch (Exception ex) {
            logger.debug(ex.getMessage(), ex);
        }
    }

    public void copyTask(DelegateTask delegateTask, String userId) {
        // 创建新任务
        TaskEntity task = TaskEntity.create(new Date());
        task.setProcessDefinitionId(delegateTask.getProcessDefinitionId());

        task.setAssigneeWithoutCascade(userId);
        // task.setParentTaskIdWithoutCascade(delegateTask.getParentTaskId());
        task.setNameWithoutCascade(delegateTask.getName());
        task.setTaskDefinitionKey(delegateTask.getTaskDefinitionKey());
        task.setExecutionId(delegateTask.getExecutionId());
        task.setPriority(delegateTask.getPriority());
        task.setProcessInstanceId(delegateTask.getProcessInstanceId());
        task.setExecutionId(delegateTask.getExecutionId());
        task.setDescriptionWithoutCascade(delegateTask.getDescription());
        task.setCategory("copy");

        Context.getCommandContext().getTaskEntityManager().insert(task);
    }

    @Resource
    public void setBpmConfUserManager(BpmConfUserManager bpmConfUserManager) {
        this.bpmConfUserManager = bpmConfUserManager;
    }
}
