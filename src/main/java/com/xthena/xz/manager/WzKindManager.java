package com.xthena.xz.manager;

import java.util.HashMap;
import java.util.List;
import com.xthena.xz.domain.WzKind;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class WzKindManager extends HibernateEntityDao<WzKind> {
	
	//目测代理级别不会太多 利用递归多查几遍吧 懒得写存储过程哦
	public List<HashMap<String, Object>> findKindAndSub(WzKind wzKind,List<HashMap<String,Object>> wzkHashMaps) {
		HashMap<String, Object> wzkHashMap=new HashMap<String, Object>();
		wzkHashMap.put("kind", wzKind);
		List<WzKind> wzKinds=findBy("fpid", wzKind.getFid());
		if(!wzKinds.isEmpty())
			wzkHashMap.put("subList",wzKinds);
		wzkHashMaps.add(wzkHashMap);
		for(WzKind wzKind2:wzKinds){
			if(wzKind2.getFisleaf()==0){
				List<HashMap<String, Object>> subList=findKindAndSub(wzKind2,wzkHashMaps);
			}
		}
		
		return wzkHashMaps;
	}
	
	
	
}
