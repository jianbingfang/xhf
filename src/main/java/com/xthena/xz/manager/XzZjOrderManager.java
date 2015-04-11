package com.xthena.xz.manager;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.mysql.fabric.xmlrpc.base.Array;
import com.xthena.xz.domain.XzZjDxlist;
import com.xthena.xz.domain.XzZjOrder;
import com.xthena.xz.domain.XzZjOrderGroup;
import com.xthena.xz.domain.XzZjOrderList;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.mapper.BeanMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class XzZjOrderManager extends HibernateEntityDao<XzZjOrder> {

	@Autowired
	private XzZjOrderListManager xzZjOrderListManager;
	
	@Autowired
	private XzZjDxlistManager xzZjDxlistManager;
	
	
	private static final HashMap<Integer, String> zjHqlMap=new HashMap<Integer, String>();
	
	static{
		zjHqlMap.put(1, "update XzZj set fzkstate =? where fid=?");
		zjHqlMap.put(2, "update HrRyZj set fstatus =? where fid=?");
		zjHqlMap.put(3, "update XzRyzs set ffileno =? where fid=?");
		zjHqlMap.put(4, "update CommHt set fzkstate =? where fid=?");
		zjHqlMap.put(5, "update XzZbtzs set fzkstate =? where fid=?");
		zjHqlMap.put(6, "update XzJgysbg set fzkstate =? where fid=?");
		zjHqlMap.put(7, "update XzRedTape set fzkstate =? where fid=?");
		zjHqlMap.put(8, "update XzXjpy set fzkstate =? where fid=?");
	}
 	
	@Transactional
	public XzZjOrder saveOrderAndList(XzZjOrderGroup xzZjOrderGroup) {
    	
		XzZjOrder dest = null;
        Long id = xzZjOrderGroup.getXzZjOrder().getFid();
       
        if (id != null) {
            dest = get(id);
            BeanMapper beanMapper=new BeanMapper();
            beanMapper.copy(xzZjOrderGroup.getXzZjOrder(), dest);
        } else {
            dest = xzZjOrderGroup.getXzZjOrder();
            dest.setFstatus("已申请");
            dest.setFcreatetime(new Date());
        }
		
        save(dest);
        
        List<HashMap<String, Object>> orderList= xzZjOrderGroup.getFzjlist();
        
        for(HashMap<String, Object> orderListMap:orderList){
        	//更新最后显示时间，以防止多人选择，如果更新结果大于0才会继续
        	if(xzZjOrderListManager.batchUpdate("update XzZjDxlist xzZjDxlist set xzZjDxlist.fupdatetime=? where xzZjDxlist.fupdatetime=? and fid=?", System.currentTimeMillis(),Long.valueOf(String.valueOf(orderListMap.get("fupdatetime"))),Long.valueOf(String.valueOf(orderListMap.get("zjid"))))>0){
	        	
	        	if(orderListMap.get("fid")!=null&&!String.valueOf(orderListMap.get("fid")).trim().equals("")&&!String.valueOf(orderListMap.get("fid")).equalsIgnoreCase(("undefined"))){
	        		xzZjOrderListManager.removeById(Long.valueOf(String.valueOf(orderListMap.get("fid"))));
	        	}
	        	
	        	XzZjOrderList xzZjOrderList=new XzZjOrderList();
	        	xzZjOrderList.setFzjid(Long.valueOf(String.valueOf(orderListMap.get("zjid"))));
	        	xzZjOrderList.setFtype(String.valueOf(orderListMap.get("ftype")));
	        	xzZjOrderList.setForderid(dest.getFid());
	        	xzZjOrderListManager.save(xzZjOrderList);
        	}
        }
        
    	List<XzZjOrderList> xzZjOrderLists= xzZjOrderListManager.findBy("forderid", dest.getFid());
    	
    	
        	for(XzZjOrderList xzZjOrderList:xzZjOrderLists){
        		XzZjDxlist xzZjDxlist=xzZjDxlistManager.get(xzZjOrderList.getFzjid());
        			
        		  if(dest.getFstatus().equals("已领取")){
        			  xzZjDxlist.setFstate("2");
        			  xzZjDxlistManager.batchUpdate(zjHqlMap.get(Integer.parseInt(xzZjOrderList.getFtype())),"未在库",xzZjDxlist.getFzjid());
        		  }else{
        			  xzZjDxlist.setFstate("1");
        			  xzZjDxlistManager.batchUpdate(zjHqlMap.get(Integer.parseInt(xzZjOrderList.getFtype())),"在库",xzZjDxlist.getFzjid());
        	      }
        		  xzZjDxlistManager.save(xzZjDxlist);
        		  
        		 
        	}
        	
        	
      
        
     return dest;   
	}
	
	
}
