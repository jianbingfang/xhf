package com.xthena.sckf.manager;

import java.util.Date;

import com.xthena.sckf.domain.NdFile;
import com.xthena.sckf.domain.Niandu;
import com.xthena.sckf.domain.NianduGroup;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.jl.domain.JlFujian;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NianduManager extends HibernateEntityDao<Niandu> {

	@Autowired
	private NdFileManager ndFileManager;
	
	public void saveGroup(NianduGroup nianduGroup) {
		 Niandu dest = null;

        Long id = nianduGroup.getNiandu().getFid();
       
        BeanMapper beanMapper=new BeanMapper();
        if (id != null) {
            dest = get(id);
            beanMapper.copy(nianduGroup.getNiandu(), dest);
        } else {
            dest = nianduGroup.getNiandu();
            dest.setFcreatedate(new Date());
        }
		
        save(dest);
        
        NdFile[] ndFiles=nianduGroup.getNdFiles();
        if(ndFiles!=null){
	        for(NdFile ndFile:ndFiles){
	        	if(ndFile.getFid()!=null){
	        		ndFileManager.removeById(ndFile.getFid());
	        	}
	        	ndFile.setFyear(dest.getFid());
	        	ndFileManager.save(ndFile);
	        }
        }
	}
}
