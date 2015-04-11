package com.xthena.gcgl.manager;

import com.xthena.gcgl.domain.PjXm;
import com.xthena.sckf.domain.JyXmYj;
import com.xthena.sckf.manager.JyXmYjManager;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.activiti.engine.ProcessEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PjXmManager extends HibernateEntityDao<PjXm> {
	
	@Autowired
	private JyXmYjManager jyXmYjManager;

	@Autowired
	private ProcessEngine processEngine;
	
	
	@Autowired
	private BpmProcessManager bpmProcessManager;
	
	@Transactional
	public void saveFromJy(PjXm dest, String taskId) {
		save(dest);
		String processInstanceId=processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
		JyXmYj jyXmYj=jyXmYjManager.findUniqueBy("ftaskid", processInstanceId);
		jyXmYj.setFyijiaostatus("已接收");
		jyXmYjManager.save(jyXmYj);
		processEngine.getTaskService().complete(taskId);
	}
	
	public Object loadFromJy(String taskId) {
		String processInstanceId=processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
    	return jyXmYjManager.findUniqueBy("ftaskid", processInstanceId);
	}
	
	
}
