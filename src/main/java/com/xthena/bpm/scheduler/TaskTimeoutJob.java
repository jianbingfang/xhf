package com.xthena.bpm.scheduler;

import java.util.List;

import javax.annotation.Resource;

import com.xthena.bpm.cmd.SendNoticeCmd;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.bpm.persistence.manager.BpmTaskDefNoticeManager;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.task.Task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TaskTimeoutJob {
    private static Logger logger = LoggerFactory
            .getLogger(TaskTimeoutJob.class);
    public static final int TYPE_ARRIVAL = 0;
    public static final int TYPE_COMPLETE = 1;
    public static final int TYPE_TIMEOUT = 2;
    private ProcessEngine processEngine;
    private BpmProcessManager bpmProcessManager;
    private BpmTaskDefNoticeManager bpmTaskDefNoticeManager;

    public void execute() throws Exception {
        List<Task> tasks = processEngine.getTaskService().createTaskQuery()
                .list();
        for (Task task : tasks) {
            if (task.getDueDate() != null) {
                SendNoticeCmd sendNoticeCmd = new SendNoticeCmd(task.getId());
                processEngine.getManagementService().executeCommand(
                        sendNoticeCmd);
            }
        }
    }

    @Resource
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    @Resource
    public void setBpmProcessManager(BpmProcessManager bpmProcessManager) {
        this.bpmProcessManager = bpmProcessManager;
    }

    @Resource
    public void setBpmTaskDefNoticeManager(
            BpmTaskDefNoticeManager bpmTaskDefNoticeManager) {
        this.bpmTaskDefNoticeManager = bpmTaskDefNoticeManager;
    }
}
