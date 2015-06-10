package com.xthena.sckf.manager;

import java.util.HashMap;
import java.util.Map;

import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.domain.JyXmYj;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;

import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class JyXmYjManager extends HibernateEntityDao<JyXmYj> {
	@Autowired
	private PjXmManager pjXmManager;
	@Autowired
	private ProcessEngine processEngine;
	@Autowired
	private BpmProcessManager bpmProcessManager;

    @Transactional
    public void newXmyj(JyXmYj jyXmYj){

            BpmProcess bpmProcess = bpmProcessManager.findUniqueBy("name", "项目移交");
            String processDefinitionId = bpmProcess.getBpmConfBase()
                    .getProcessDefinitionId();

            IdentityService identityService = processEngine.getIdentityService();
            identityService.setAuthenticatedUserId(SpringSecurityUtils
                    .getCurrentUserId());

            Map<String, Object> processParameters = new HashMap<String, Object>();
            //jyXmYj.setFmemo4("已申请");
            save(jyXmYj);

            ProcessInstance processInstance = processEngine.getRuntimeService()
                    .startProcessInstanceById(processDefinitionId, jyXmYj.getFid().toString(),
                            processParameters);
            jyXmYj.setFtaskid(processInstance.getProcessInstanceId());
            save(jyXmYj);
    }

	@Transactional
	public void saveForYj(JyXmYj dest) {
	    BpmProcess bpmProcess = bpmProcessManager.findUniqueBy("name", "项目移交");
        String processDefinitionId = bpmProcess.getBpmConfBase()
                .getProcessDefinitionId();

        IdentityService identityService = processEngine.getIdentityService();
        identityService.setAuthenticatedUserId(SpringSecurityUtils
                .getCurrentUserId());
        Map<String, Object> processParameters = new HashMap<String, Object>();
        dest.setFyijiaostatus("已申请");
        save(dest);
        String dest_id=dest.getFid().toString();
        RuntimeService runtimeService=processEngine.getRuntimeService();
        ProcessInstance processInstance = runtimeService.startProcessInstanceById(processDefinitionId, dest_id,
                        processParameters);
        dest.setFtaskid(processInstance.getProcessInstanceId());
    	save(dest);
	}

}
