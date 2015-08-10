package com.xthena.dashboard.web;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by xi on 2015/8/10.
 */

public class TaskProcessClass {

    private String taskid;
    private String taskname;
    //public Task task;

    private Date createTime;
    private String processInstance;

    public String getProcessInstance() {
        return processInstance;
    }

    public void setProcessInstance(String processInstance) {
        this.processInstance = processInstance;
    }
    //    public TaskProcessClass(String taskid, String taskname, Date createTime, String processStr) {
//        this.taskid = taskid;
//        this.taskname = taskname;
//        this.createTime = createTime;
//        ProcessStr = processStr;
//    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


}
