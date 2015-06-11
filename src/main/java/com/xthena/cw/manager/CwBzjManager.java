package com.xthena.cw.manager;

import java.util.HashMap;
import java.util.Map;

import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.cw.domain.CwBzj;
import com.xthena.common.domain.XhfCommonPlain;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.security.util.SpringSecurityUtils;

import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CwBzjManager extends HibernateEntityDao<CwBzj> {
	
	@Autowired
	private ProcessEngine processEngine;
	
	
	@Autowired
	private BpmProcessManager bpmProcessManager;
	
	
	@Transactional
	public void newBzj(CwBzj cwBzj){

		BpmProcess bpmProcess = bpmProcessManager.findUniqueBy("name", "投标保证金申请");
		String processDefinitionId = bpmProcess.getBpmConfBase()
				.getProcessDefinitionId();

        IdentityService identityService = processEngine.getIdentityService();
        identityService.setAuthenticatedUserId(SpringSecurityUtils
                .getCurrentUserId());
        
        Map<String, Object> processParameters = new HashMap<String, Object>();
        cwBzj.setFmemo4("已申请");
        save(cwBzj);
        
        ProcessInstance processInstance = processEngine.getRuntimeService()
				.startProcessInstanceById(processDefinitionId, cwBzj.getFid().toString(),
						processParameters);
		cwBzj.setFtaskid(processInstance.getProcessInstanceId());
		save(cwBzj);
    	
	}
	

	
	@Transactional
	 public void dealBzj(CwBzj cwBzj,String taskId){
		BeanMapper beanMapper=new BeanMapper();
		CwBzj dest  = get(cwBzj.getFid());
		beanMapper.copy(cwBzj, dest);
		Map<String, Object> processParameters = new HashMap<String, Object>();
		processParameters.put("fshenpistatus", dest.getFstatus());
		save(dest);
		processEngine.getTaskService().complete(taskId,processParameters);
	}


	public CwBzj loadBzj(String taskId) {
		String processInstanceId=processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
    	return findUniqueBy("ftaskid", processInstanceId);
	}
	
}
