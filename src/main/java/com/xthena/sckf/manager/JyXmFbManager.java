package com.xthena.sckf.manager;

import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.sckf.domain.JyXmFb;
import com.xthena.security.util.SpringSecurityUtils;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
public class JyXmFbManager extends HibernateEntityDao<JyXmFb> {



    @Autowired
    private PjXmManager pjXmManager;

    @Autowired
    private ProcessEngine processEngine;


    @Autowired
    private BpmProcessManager bpmProcessManager;

    @Transactional
    public void saveForFb(JyXmFb dest) {
        BpmProcess bpmProcess = bpmProcessManager.findUniqueBy("name", "��Ŀ�ƽ�");
        String processDefinitionId = bpmProcess.getBpmConfBase()
                .getProcessDefinitionId();

        IdentityService identityService = processEngine.getIdentityService();
        identityService.setAuthenticatedUserId(SpringSecurityUtils
                .getCurrentUserId());

        Map<String, Object> processParameters = new HashMap<String, Object>();

        save(dest);

        ProcessInstance processInstance = processEngine.getRuntimeService()
                .startProcessInstanceById(processDefinitionId, dest.getFid().toString(),
                        processParameters);
        //dest.setFtaskid(processInstance.getProcessInstanceId());
        save(dest);
    }


}
