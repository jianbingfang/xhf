package com.xthena.common.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.form.StartFormData;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.fabric.xmlrpc.base.Data;
import com.xthena.api.user.UserConnector;
import com.xthena.bpm.FormInfo;
import com.xthena.bpm.cmd.FindStartFormCmd;
import com.xthena.bpm.persistence.domain.BpmProcess;
import com.xthena.bpm.persistence.manager.BpmConfFormManager;
import com.xthena.bpm.persistence.manager.BpmConfOperationManager;
import com.xthena.bpm.persistence.manager.BpmProcessManager;
import com.xthena.bpm.persistence.manager.BpmTaskConfManager;
import com.xthena.common.domain.XhfCommonDoc;
import com.xthena.common.manager.XhfCommonDocManager;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.mapper.JsonMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.form.domain.FormTemplate;
import com.xthena.form.keyvalue.KeyValue;
import com.xthena.form.keyvalue.Prop;
import com.xthena.form.keyvalue.Record;
import com.xthena.form.keyvalue.RecordBuilder;
import com.xthena.form.manager.FormTemplateManager;
import com.xthena.form.operation.ConfAssigneeOperation;
import com.xthena.form.web.FormController;
import com.xthena.security.util.SpringSecurityUtils;


@Controller
@RequestMapping("comm")
public class BpmTestController {
	
	private static Logger logger = LoggerFactory
            .getLogger(FormController.class);
    public static final int STATUS_DRAFT_PROCESS = 0;
    public static final int STATUS_DRAFT_TASK = 1;
    public static final int STATUS_RUNNING = 2;
    
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    private BpmProcessManager bpmProcessManager;
    private BpmTaskConfManager bpmTaskConfManager;
    private BpmConfOperationManager bpmConfOperationManager;
    private BpmConfFormManager bpmConfFormManager;
    private FormTemplateManager formTemplateManager;
    private JsonMapper jsonMapper = new JsonMapper();
    private KeyValue keyValue;
    private MessageHelper messageHelper;
    
    
   @RequestMapping("bpmTest")
    public void bpmTest(@RequestParam MultiValueMap<String, String> multiValueMap,
            @RequestParam(value = "bpmProcessId", required = false) Long bpmProcessId,
            //@RequestParam(value = "businessKey", required = false) String businessKey,
           // @RequestParam(value = "nextStep", required = false) String nextStep,
            Model model) {
	   
	   BpmProcess bpmProcess = bpmProcessManager.get(bpmProcessId);
       String processDefinitionId = bpmProcess.getBpmConfBase()
               .getProcessDefinitionId();

       IdentityService identityService = processEngine.getIdentityService();
       identityService.setAuthenticatedUserId(SpringSecurityUtils
               .getCurrentUserId());
       
       Map<String, Object> processParameters = new HashMap<String, Object>();

       ProcessInstance processInstance = processEngine.getRuntimeService()
               .startProcessInstanceById(processDefinitionId, "1",
                       processParameters);
       
       
		System.out.println(processInstance);
    }
   
   @RequestMapping("bpmQry")
   public void bpmQry(@RequestParam MultiValueMap<String, String> multiValueMap,
           @RequestParam(value = "bpmProcessId", required = false) Long bpmProcessId,
           @RequestParam(value = "businessKey", required = false) String businessKey,
           @RequestParam(value = "nextStep", required = false) String nextStep,
           Model model) {
	   
	 Task task= processEngine.getTaskService().createTaskQuery().taskAssignee(SpringSecurityUtils.getCurrentUserId()).singleResult();
	// TaskFormData taskDate=processEngine.getTaskService().createTaskQuery().processInstanceBusinessKey("1");//.getRuntimeService().startProcessInstanceById("process:13:2051");
   //  System.out.println(taskDate);
   }
}
