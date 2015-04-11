package com.xthena.car.manager;

import com.xthena.car.domain.CarInfo;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class CarInfoManager extends HibernateEntityDao<CarInfo> {
}
