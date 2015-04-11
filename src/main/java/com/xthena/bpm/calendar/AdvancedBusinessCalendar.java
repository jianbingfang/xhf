package com.xthena.bpm.calendar;

import java.util.Calendar;
import java.util.Date;
import javax.xml.datatype.Duration;

import com.xthena.api.workcal.WorkCalendarConnector;

import org.activiti.engine.impl.calendar.BusinessCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class AdvancedBusinessCalendar implements BusinessCalendar {
    private static Logger logger = LoggerFactory
            .getLogger(AdvancedBusinessCalendar.class);
    private WorkCalendarConnector workCalendarConnector;

    public Date processDate(Date date, boolean useBusinessTime) {
        if (!useBusinessTime) {
            return date;
        }

        return workCalendarConnector.processDate(date);
    }

    public Date add(Date date, Duration duration, boolean useBusinessTime) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        if (!useBusinessTime) {
            duration.addTo(calendar);

            return calendar.getTime();
        }

        return workCalendarConnector.add(date, duration);
    }

    public void setWorkCalendarConnector(
            WorkCalendarConnector workCalendarConnector) {
        this.workCalendarConnector = workCalendarConnector;
    }

    // ~ ======================================================================
    public abstract String getName();
}
