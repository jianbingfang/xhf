package com.xthena.hr.manager;

import org.springframework.stereotype.Service;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.hr.domain.HrLz;

@Service
public class HrLzManager extends HibernateEntityDao<HrLz> {
/*	@Autowired
	private RuntimeService runtimeService;

  	@Transactional
    @Override
    public void save(Object object) {
  	  super.save(object);
  	  HrLz hrLz= (HrLz) object;
  	  runtimeService.startProcessInstanceById("vacation:1:12",hrLz.getFid().toString(), new HashMap<String,Object>());
  	}*/
}
