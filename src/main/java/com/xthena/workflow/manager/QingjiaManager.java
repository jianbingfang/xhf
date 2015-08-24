package com.xthena.workflow.manager;

import java.util.HashMap;
import java.util.Map;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.cw.domain.CwBzj;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.domain.JyXmYj;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;

import com.xthena.workflow.domain.QingjiaEntity;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class QingjiaManager extends HibernateEntityDao<QingjiaEntity> {

    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    private BpmProcessManager bpmProcessManager;

    @Transactional
    public void SaveForQingjia(QingjiaEntity qingjiaEntity) {
        BpmProcess bpmProcess = bpmProcessManager.findUniqueBy("name", "请假流程");
        String processDefinitionId = bpmProcess.getBpmConfBase()
                .getProcessDefinitionId();
        IdentityService identityService = processEngine.getIdentityService();
        identityService.setAuthenticatedUserId(SpringSecurityUtils
                .getCurrentUserId());
        Map<String, Object> processParameters = new HashMap<String, Object>();
        qingjiaEntity.setFmemo("已申请");
        save(qingjiaEntity);
        String dest_id=qingjiaEntity.getFid().toString();
        RuntimeService runtimeService=processEngine.getRuntimeService();
        ProcessInstance processInstance = runtimeService.startProcessInstanceById(processDefinitionId, dest_id,
                processParameters);
        qingjiaEntity.setFtaskid(processInstance.getProcessInstanceId());
        save(qingjiaEntity);
    }


    @Transactional
    public void completetask(String taskId){
//        BeanMapper beanMapper=new BeanMapper();
//        JyXmYj dest  = get(jyXmYj.getFid());
//        beanMapper.copy(jyXmYj, dest);
//        Map<String, Object> processParameters = new HashMap<String, Object>();
//        //processParameters.put("fshenpistatus", dest.getFstatus());
//        save(dest);
        processEngine.getTaskService().complete(taskId);
        //processEngine.getTaskService().complete(taskId, processParameters);
    }


    public QingjiaEntity loadQingjiaEntity(String taskId) {
        String processInstanceId=processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
        return findUniqueBy("ftaskid", processInstanceId);
    }


}
