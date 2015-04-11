package com.xthena.form.operation;

import java.util.List;
import com.xthena.bpm.persistence.domain.BpmTaskConf;
import com.xthena.bpm.persistence.manager.BpmTaskConfManager;

import com.xthena.core.spring.ApplicationContextHelper;

import org.activiti.engine.impl.interceptor.CommandContext;

/**
 * 配置任务负责人.
 */
public class ConfAssigneeOperation extends AbstractOperation<String> {
    public static final String OPERATION_TASK_DEFINITION_KEYS = "taskDefinitionKeys";
    public static final String OPERATION_TASK_ASSIGNEES = "taskAssignees";
    public static final String OPERATION_BUSINESS_KEY = "businessKey";

    @Override
	public String execute(CommandContext commandContext) {
        List<String> taskDefinitionKeys = getParameterValues("taskDefinitionKeys");
        List<String> taskAssignees = getParameterValues("taskAssignees");
        String businessKey = new SaveDraftOperation().execute(getParameters());
        BpmTaskConfManager bpmTaskConfManager = getBpmTaskConfManager();

        if (taskDefinitionKeys != null) {
            // 如果是从配置任务负责人的页面过来，就保存TaskConf，再从草稿中得到数据启动流程
            int index = 0;

            for (String taskDefinitionKey : taskDefinitionKeys) {
                String taskAssignee = taskAssignees.get(index++);
                BpmTaskConf bpmTaskConf = new BpmTaskConf();
                bpmTaskConf.setBusinessKey(businessKey);
                bpmTaskConf.setTaskDefinitionKey(taskDefinitionKey);
                bpmTaskConf.setAssignee(taskAssignee);
                bpmTaskConfManager.save(bpmTaskConf);
            }
        }

        return businessKey;
    }

    public BpmTaskConfManager getBpmTaskConfManager() {
        return ApplicationContextHelper.getBean(BpmTaskConfManager.class);
    }
}
