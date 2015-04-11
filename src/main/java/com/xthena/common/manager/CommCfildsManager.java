package com.xthena.common.manager;

import java.util.List;

import com.xthena.common.domain.CommCfilds;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class CommCfildsManager extends HibernateEntityDao<CommCfilds> {
	
	
	public List<CommCfilds> findCommCfildsByCode(String code){
		String hql="select cc from CommCfilds cc where fcode=? order by forderstr";
		return find(hql, code);
	}
}
