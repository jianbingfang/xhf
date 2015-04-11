package com.xthena.bpm.calendar;

import java.util.Date;

import org.activiti.engine.ActivitiException;

public class DueDateBusinessCalendar extends AdvancedBusinessCalendar {
    @Override
	public Date resolveDuedate(String duedate) {
        try {
            return new DurationUtil(duedate, this).getDateAfter();
        } catch (Exception e) {
            throw new ActivitiException("couldn't resolve duedate: "
                    + e.getMessage(), e);
        }
    }

    @Override
	public String getName() {
        return "dueDate";
    }
}
