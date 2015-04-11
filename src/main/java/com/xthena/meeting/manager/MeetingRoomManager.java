package com.xthena.meeting.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.meeting.domain.MeetingRoom;

import org.springframework.stereotype.Service;

@Service
public class MeetingRoomManager extends HibernateEntityDao<MeetingRoom> {
}
