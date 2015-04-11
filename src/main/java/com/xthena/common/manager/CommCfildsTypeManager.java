package com.xthena.common.manager;

import java.util.List;

import javax.transaction.Transactional;

import com.xthena.common.domain.CommCfilds;
import com.xthena.common.domain.CommCfildsType;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommCfildsTypeManager extends HibernateEntityDao<CommCfildsType> {

	@Autowired
	private CommCfildsManager commCfildsManager;
	
	@Transactional
	public void saveAndInit(CommCfildsType dest) {
		super.save(dest);
		List<CommCfilds> commCfilds= commCfildsManager.findBy("fcode",dest.getFcode() );
		commCfildsManager.removeAll(commCfilds);
		
		//加载表默认的字段 非主键且不以fextend开头的字段
		String sql="insert into t_comm_cfileds(fcode,fcname,fname,fissys,fisshow,fisgridshow,ftype) "
				+ " select '"+dest.getFcode()+"', COLUMN_NAME,COLUMN_COMMENT,1,1,1,case DATA_TYPE when 'varchar' then 1   "
						+ "  when 'bigint' then 2  when 'int' then 2  when 'date' then 5  when 'datetime' then 6 "
						+ "  when 'text' then 7 when 'mediumtext' then 7 end "
						+ "  from INFORMATION_SCHEMA.COLUMNS where LOWER(TABLE_NAME)='"
					+ dest.getFtname().toLowerCase()+"' and COLUMN_NAME not like 'fextend%' and LOWER(COLUMN_NAME)!='fid' and LOWER(COLUMN_NAME)!='fcode'";
		
		commCfildsManager.getJdbcTemplate().execute(sql);
		
		//加载表扩展
		sql="insert into t_comm_cfileds(fcode,fcname,fname,fissys,fisshow) "
				+ " select '"+dest.getFcode()+"', COLUMN_NAME,COLUMN_COMMENT,0,0 from INFORMATION_SCHEMA.COLUMNS where LOWER(TABLE_NAME)='"
					+ dest.getFtname().toLowerCase()+"' and COLUMN_NAME  like 'fextend%' ";
		
		commCfildsManager.getJdbcTemplate().execute(sql);
	}
}
