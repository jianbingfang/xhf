package com.xthena.common.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.transaction.annotation.Transactional;

import com.xthena.api.user.UserConnector;
import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.common.domain.XhfCommonPlain;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.ConstValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

@Service
public class XhfCommonPlainManager extends HibernateEntityDao<XhfCommonPlain> implements TaskListener{
	
	@Autowired
	private UserConnector userConnector;
	
	@Autowired
	private BpmProcessManager bpmProcessManager;
	

	@Autowired
    private ProcessEngine processEngine;
	
	
    @Transactional(readOnly = true)
	@Override
	public Page pagedQuery(Page  page,List<PropertyFilter> propertyFilters ){
		Page page1=super.pagedQuery(page, propertyFilters);
		List<XhfCommonPlain> xhfCommonPlains= (List<XhfCommonPlain>) page1.getResult();
		for(XhfCommonPlain xhfCommonPlain:xhfCommonPlains){
			xhfCommonPlain.setFmemo5(userConnector.findById(String.valueOf(xhfCommonPlain.getFuserid())).getDisplayName());
		}
		page1.setResult(xhfCommonPlains);
		return page1;
	}
    
   
    //保存工作计划 发起流程
    @Transactional
    public void savePlain(XhfCommonPlain xhfCommonPlain){
    	   
 	    BpmProcess bpmProcess = bpmProcessManager.findUniqueBy("name", "计划申报");
        String processDefinitionId = bpmProcess.getBpmConfBase()
                .getProcessDefinitionId();

        IdentityService identityService = processEngine.getIdentityService();
        identityService.setAuthenticatedUserId(SpringSecurityUtils
                .getCurrentUserId());
        
        Map<String, Object> processParameters = new HashMap<String, Object>();
        xhfCommonPlain.setFuserid(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        xhfCommonPlain.setFstatus("未审阅");
        save(xhfCommonPlain);
        
        ProcessInstance processInstance = processEngine.getRuntimeService()
                .startProcessInstanceById(processDefinitionId, xhfCommonPlain.getFid().toString(),
                        processParameters);
    	xhfCommonPlain.setFtaskid(processInstance.getProcessInstanceId());
    	save(xhfCommonPlain);
    	
    }
    
    
    
    @Transactional
    public XhfCommonPlain loadPlain(String taskId){
    	String processInstanceId=processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
    	XhfCommonPlain xhfCommonPlain=findUniqueBy("ftaskid", processInstanceId);
    	return xhfCommonPlain;
    }
    
    
    
    @Transactional
    public void savePlain(XhfCommonPlain xhfCommonPlain,String taskId){
    	 
    	 BeanMapper beanMapper=new BeanMapper();
		 XhfCommonPlain dest  = get(xhfCommonPlain.getFid());
	     beanMapper.copy(xhfCommonPlain, dest);
         
	     dest.setFstatus("已审阅");
    	save(dest);
    	
    	processEngine.getTaskService().complete(taskId);
    }  
    
    
    
 /*   //保存工作计划 发起流程
    @Transactional
    public XhfCommonPlain newPlain(DelegateExecution execution){
    	
    }*/
    


	@Override
	public void notify(DelegateTask delegateTask) {
		XhfCommonPlain xhfCommonPlain=findUniqueBy("fmemo", delegateTask.getProcessInstanceId());
    	xhfCommonPlain.setFmemo1("2");
    	save(xhfCommonPlain);
		
	}
    
    
}
