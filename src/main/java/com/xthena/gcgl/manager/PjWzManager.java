package com.xthena.gcgl.manager;

import java.util.List;

import com.xthena.gcgl.domain.PjWz;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class PjWzManager extends HibernateEntityDao<PjWz> {

	public String wzBack(List<Long> selectedItem) {
		String kind="";
		
		for(Long id:selectedItem){
			if(id!=null){
				PjWz pjWz=get(id);
				
				//状态是已审批的才行
				if(pjWz.getFstatus()==2){
					pjWz.setFstatus(4);
					save(pjWz);
				}
				if(pjWz.getFisassets().equals("是")){
					kind="1";
				}else{
					kind="2";
				}
			}
		}
		
		return kind;
		
	}
}
