package com.xthena.hr.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.hibernate.MatchType;
import com.xthena.group.domain.OrgDepartment;
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.domain.HrGwbm;

@Service
public class HrGwbmManager extends HibernateEntityDao<HrGwbm> {
	
	@Autowired
	private OrgDepartmentManager orgDepartmentManager;
	@Autowired
	private CommRyManager commRyManager;
	
	public void find(long deptId, Model model) {
		
		OrgDepartment orgDepartment= orgDepartmentManager.get(deptId);
		 
		 model.addAttribute("fbmze", orgDepartment.getFduty());
		 
		 List<HrGwbm> hrGwbms= super.findBy("fbmid", deptId);
		 List<Long> jobs=new ArrayList<Long>();
		
		 HashMap<Long, String> gwBm=new HashMap<Long, String>();
		 HashMap<String,String> gwzes=new  HashMap<String,String> ();
		 for(HrGwbm hrGwbm:hrGwbms){
			 jobs.add(hrGwbm.getFid()); 
			 gwBm.put(hrGwbm.getFid(), hrGwbm.getFname());
			 gwzes.put(hrGwbm.getFname(),hrGwbm.getFgwzz());
		 }
		 
		 model.addAttribute("gwlist", gwzes);
		 
		 if(!jobs.isEmpty()){
			 List<CommRy> commRies=commRyManager.findBy("fjobid", jobs, MatchType.IN);
			 
			 HashMap<String,String> gwrys=new  HashMap<String,String> ();
			 for(CommRy commRy:commRies){
				 if(gwrys.containsKey(gwBm.get(commRy.getFjobid()))){
					String rys= gwrys.get(gwBm.get(commRy.getFjobid()));
					rys+=commRy.getFname()+" ";
					gwrys.put(gwBm.get(commRy.getFjobid()),rys);
				 }else{
					 gwrys.put(gwBm.get(commRy.getFjobid()),commRy.getFname());
				 }
			 }
			 
			 model.addAttribute("rylist", gwrys);
		 }
		 
	}
}
