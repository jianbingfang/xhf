package com.xthena.bpm.calendar;

import com.xthena.api.workcal.WorkCalendarConnector;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.InitializingBean;

public class AdvancedBusinessCalendarManagerFactoryBean implements
        InitializingBean, FactoryBean<AdvancedBusinessCalendarManager> {
    private AdvancedBusinessCalendarManager advancedBusinessCalendarManager;
    private WorkCalendarConnector workCalendarConnector;

    @Override
	public AdvancedBusinessCalendarManager getObject() {
        return advancedBusinessCalendarManager;
    }

    @Override
	public Class<AdvancedBusinessCalendarManager> getObjectType() {
        return AdvancedBusinessCalendarManager.class;
    }

    @Override
	public boolean isSingleton() {
        return true;
    }

    @Override
	public void afterPropertiesSet() throws Exception {
        this.advancedBusinessCalendarManager = new AdvancedBusinessCalendarManager();
        this.addBusinessCalendar(new DueDateBusinessCalendar());
        this.addBusinessCalendar(new DurationBusinessCalendar());
        this.addBusinessCalendar(new CycleBusinessCalendar());
    }

    public void addBusinessCalendar(AdvancedBusinessCalendar businessCalendar) {
        businessCalendar.setWorkCalendarConnector(workCalendarConnector);
        this.advancedBusinessCalendarManager
                .addBusinessCalendar(businessCalendar);
    }

    public void setWorkCalendarConnector(
            WorkCalendarConnector workCalendarConnector) {
        this.workCalendarConnector = workCalendarConnector;
    }
}
