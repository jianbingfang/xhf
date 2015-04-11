package com.xthena.meeting.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.meeting.domain.MeetingInfo;

import org.springframework.stereotype.Service;

@Service
public class MeetingInfoManager extends HibernateEntityDao<MeetingInfo> {
}
