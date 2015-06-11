package com.xthena.sckf.manager;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.cw.domain.CwBzj;
import com.xthena.sckf.domain.CommHt;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.xz.manager.XzZjDxlistManager;

@Service
public class CommHtManager extends HibernateEntityDao<CommHt> {
	
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	@Autowired
	private ProcessEngine processEngine;
	
	
	@Autowired
	private BpmProcessManager bpmProcessManager;
	
	
	public void mysave(CommHt entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}

	@Transactional
	public void saveAndStartWorkFlow(CommHt dest) {
		
	    BpmProcess bpmProcess = bpmProcessManager.findUniqueBy("name", "合同归档");
        String processDefinitionId = bpmProcess.getBpmConfBase()
                .getProcessDefinitionId();

        IdentityService identityService = processEngine.getIdentityService();
        identityService.setAuthenticatedUserId(SpringSecurityUtils
                .getCurrentUserId());
        
        Map<String, Object> processParameters = new HashMap<String, Object>();
        mysave(dest);
        
        ProcessInstance processInstance = processEngine.getRuntimeService()
                .startProcessInstanceById(processDefinitionId, dest.getFid().toString(),
                        processParameters);
        dest.setFtaskid(processInstance.getProcessInstanceId());
    	save(dest);
	}
	
	
	
	@Transactional
	public void dealBzj(CommHt commHt,String taskId){
		 BeanMapper beanMapper=new BeanMapper();
		 CommHt dest  = get(commHt.getFid());
	     beanMapper.copy(commHt, dest);
	     save(dest);
     	 processEngine.getTaskService().complete(taskId);
	}


	public CommHt loadBzj(String taskId) {
		String processInstanceId=processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
    	return findUniqueBy("ftaskid", processInstanceId);
	}
}
