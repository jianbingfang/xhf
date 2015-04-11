package com.xthena.bpm.behavior;

import java.util.Map;

import org.activiti.engine.ProcessEngines;
import org.activiti.engine.impl.ProcessEngineImpl;

public class ProcessEngineBeanFactory {
    private static Map beanFactory;

    static {
        if (beanFactory == null) {
            ProcessEngineImpl processEngine = (ProcessEngineImpl) ProcessEngines
                    .getDefaultProcessEngine();
            beanFactory = processEngine.getProcessEngineConfiguration()
                    .getBeans();
        }
    }

    public static <T> T getBean(String beanName) {
        return (T) beanFactory.get(beanName);
    }
}
