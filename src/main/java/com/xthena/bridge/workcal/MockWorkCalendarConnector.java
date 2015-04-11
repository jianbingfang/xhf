package com.xthena.bridge.workcal;

import java.util.Date;

import javax.xml.datatype.Duration;

import com.xthena.api.workcal.WorkCalendarConnector;

public class MockWorkCalendarConnector implements WorkCalendarConnector {
    @Override
	public Date processDate(Date date) {
        return date;
    }

    @Override
	public Date add(Date date, Duration duration) {
        duration.addTo(date);

        return date;
    }
}
