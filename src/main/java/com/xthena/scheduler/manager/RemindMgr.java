package com.xthena.scheduler.manager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.xthena.common.domain.CommRemindConf;
import com.xthena.common.manager.CommRemindConfManager;
import com.xthena.common.manager.CommRemindLogManager;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.scheduler.task.RemindTask;
import com.xthena.util.ConfUtil;


@Component
public class RemindMgr {
	
	
	private static ThreadPoolExecutor remindPool  = new ThreadPoolExecutor(Integer.valueOf(
			ConfUtil.getProperty("remind.pool.corePoolSize")).intValue(),
			Integer.valueOf(
					ConfUtil.getProperty("remind.pool.maximumPoolSize"))
					.intValue(), Integer.valueOf(
					ConfUtil.getProperty("remind.pool.keepAliveTime"))
					.intValue(), TimeUnit.SECONDS,
			new LinkedBlockingQueue<Runnable>());
	
	
	/*@Autowired 岗位 console-doUpdateProcess
	private CommRemindLogManager commRemindLogManager;
	*/
	@Autowired
	private CommRemindConfManager commRemindConfManager;
	
	@Autowired
	private  ApplicationContext applicationContext;
	
	@Scheduled(cron = "0/60 * * * * ?")
    private void exRemindMgr() throws SQLException {
		
		//查出需要提醒的数据 插入到待提醒列表
		List<CommRemindConf> commRemindConfs=commRemindConfManager.getAll();
		DataSource dataSource=commRemindConfManager.getJdbcTemplate().getDataSource();
		for(CommRemindConf commRemindConf:commRemindConfs){
			Connection conn=dataSource.getConnection();
			conn.setAutoCommit(false);
			RemindTask remindTask=new RemindTask();
			remindTask.setCommRemindConf(commRemindConf);
			remindTask.setConn(conn);
			remindPool.execute(remindTask);
		}
		
	}
	

}
