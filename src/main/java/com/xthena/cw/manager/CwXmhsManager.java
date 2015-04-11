package com.xthena.cw.manager;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.cw.domain.CwXmhs;
import com.xthena.cw.domain.CwXmhslist;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;

@Service
public class CwXmhsManager extends HibernateEntityDao<CwXmhs> {
	/*
	 * @Autowired private CwXmhslistManager xmhslistManager ;
	 */
	@Autowired
	private CommHtManager htManager;
	@Autowired
	private CwYingShouManager yingshouManager;
	@Autowired
	private CwCbManager cbManager;
	@Autowired
	private PjXmManager pjXmManager;

	public RedirectAttributes newList(CwXmhslist cwXmhslist,
			 RedirectAttributes redirectAttributes) {
		/* ArrayList<CwXmhs> hsList = new ArrayList<CwXmhs>(); */

/*		Map<String, Object> filterParamMap = new HashMap<String, Object>();
		//filterParamMap.put("filter_EQS_fjsstate", cwXmhslist.getFjsstate());
		filterParamMap.put("filter_LIKES_fmemo4", cwXmhslist.getFsx());
		List<PropertyFilter> propertyFilters = PropertyFilter.build(filterParamMap);*/
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar c=	Calendar.getInstance();
		c.setTime(cwXmhslist.getFstartdate());
		c.set(Calendar.DAY_OF_YEAR, 1);
		c.set(Calendar.HOUR, 0);
		c.set(Calendar.MINUTE, 0);
		Date yearStart = c.getTime();
		c.add(Calendar.YEAR, 1);
		Date yearEnd =c.getTime();
		
		String sql=
				" insert into t_cw_xmhs(flistid,fhetongid,fhetongname,fhetongjine,fbjdsr,fbndzsr,fzsr,fbjdzcb,fbnzcb,fzcb,fglf,flr,ffpkjwdz) "+
				" SELECT "+cwXmhslist.getFid()+",a.fid,a.fhtname,a.fjianlifei,jidushouru,niandushouru,zongshouru,jiduchengben,nianduchengb,zongchengben,zongshouru*0.125,IFNULL(zongshouru,0)-IFNULL(zongchengben,0)-IFNULL(zongshouru,0)*0.125,fpkuwdz from  t_comm_hetong a LEFT JOIN "+
				" (select sum(fcreditor) as jidushouru,fxmid from t_cw_yingshou    "+
				" where fdzdate>'"+sdf.format(cwXmhslist.getFstartdate())+"' and fdzdate<='"+ sdf.format(cwXmhslist.getFenddate())+"' group by fxmid) b on a.fid=b.fxmid LEFT JOIN "+
				" (select sum(fcreditor) as niandushouru,fxmid from t_cw_yingshou  "+  
				" where fdzdate>'"+sdf.format(yearStart)+"' and fdzdate<'"+sdf.format(yearEnd)+"' group by fxmid) c on a.fid=c.fxmid left JOIN "+
				" (select sum(fcreditor) as zongshouru,fxmid from t_cw_yingshou    "+
				"  group by fxmid) d on a.fid=d.fxmid LEFT JOIN  "+
				" (select sum(fchengben) as jiduchengben ,fxmid from t_cw_cb    "+
						" where fdate>'"+sdf.format(cwXmhslist.getFstartdate())+"' and fdate<='"+sdf.format( cwXmhslist.getFenddate())+"' group by fxmid) f on a.fid=f.fxmid LEFT JOIN "+
				" (select sum(fchengben) as nianduchengb,fxmid from t_cw_cb    "+
				" where fdate>'"+sdf.format(yearStart)+"' and fdate<'"+sdf.format(yearEnd)+"' group by fxmid) g on a.fid=g.fxmid LEFT JOIN  "+
				" (select sum(fchengben) as zongchengben,fxmid from t_cw_cb    "+  
				"  group by fxmid) h on a.fid=h.fxmid LEFT JOIN "+
				" (select sum(fdebit)-sum(fcreditor) as fpkuwdz ,fxmid from t_cw_yingshou  group by fxmid) i on a.fid=i.fxmid "+
				" where  a.fisf='0' and a.fjsstate like '%"+cwXmhslist.getFjsstate()+"%' and a.fmemo4 like '%"+cwXmhslist.getFsx()+"%'";
		
		htManager.getJdbcTemplate().execute(sql);
		
		/*List<CommHt> htlist = htManager.find("from CommHt where fisf='0' and fjsstate like '%"+cwXmhslist.getFjsstate()+"%' and fmemo4 like '%"+cwXmhslist.getFsx()+"%'");//.findByLike("fxmstatus", "在建");
		for (CommHt ht : htlist) {

			CwXmhs hs = new CwXmhs();
			hs.setFlistid(cwXmhslist.getFid());
			hs.setFhetongname(ht.getFhtname());
			hs.setFhetongjine(ht.getFjianlifei());
		
			// 季度收入
			List jdhj = yingshouManager
					.find("select sum(ys.fcreditor) from CwYingShou as ys where ys.fxmid=? and ys.fdzdate>=? and ys.fdzdate<=?",
							ht.getFid(), cwXmhslist.getFstartdate(), cwXmhslist.getFenddate());
			if (jdhj.size() > 0) {
				hs.setFbjdsr((Double) jdhj.get(0));
			} else {
				hs.setFbjdsr(0.0);
			}

			// 年度收入
			@SuppressWarnings("deprecation")
			Date yearStart = new Date(cwXmhslist.getFstartdate().getYear(), 1, 1);
			@SuppressWarnings("deprecation")
			Date yearEnd = new Date(cwXmhslist.getFenddate().getYear(), 12, 31);
			List ndhj = yingshouManager
					.find("select sum(ys.fcreditor) from CwYingShou as ys where ys.fxmid=? and ys.fdzdate>=? and ys.fdzdate<=?",
							ht.getFid(), yearStart, yearEnd);
			if (ndhj.size() > 0) {
				hs.setFbndzsr((Double) ndhj.get(0));
			} else {
				hs.setFbndzsr(0.0);
			}
			// 总收入
			List zsr = yingshouManager
					.find("select sum(ys.fcreditor) from CwYingShou as ys where ys.fxmid=?",
							ht.getFid());
			if (zsr.size() > 0 && zsr.get(0) != null) {
				hs.setFzsr((Double) zsr.get(0));
			}

			// 季度成本
			List jbcb = cbManager
					.find("select sum(cb.fchengben) from CwCb as cb where cb.fxmid=? and cb.fdate>=? and cb.fdate<=?",
							ht.getFid(), cwXmhslist.getFstartdate(), cwXmhslist.getFenddate());
			if (jbcb.size() > 0) {
				hs.setFbjdzcb((Double) jbcb.get(0));
			} else {
				hs.setFbjdzcb(0.0);
			}

			// 年度成本
			List ndcb = cbManager
					.find("select sum(cb.fchengben) from CwCb as cb where cb.fxmid=? and cb.fdate>=? and cb.fdate<=?",
							ht.getFid(), yearStart, yearEnd);
			if (ndcb.size() > 0) {
				hs.setFbnzcb((Double) ndcb.get(0));
			} else {
				hs.setFbnzcb(0.0);
			}

			// 总成本
			List zcb = cbManager
					.find("select sum(cb.fchengben) from CwCb as cb where cb.fxmid=? ",
							ht.getFid());
			if (zcb.size() > 0) {
				hs.setFzcb((Double) zcb.get(0));
			} else {
				hs.setFzcb(0.0);
			}

			// 管理费 = 总收入*12.5%
			if (hs.getFzsr() != null) {
				Double glf = hs.getFzsr() * 0.125;
				hs.setFglf(glf);
			}

			// 利润
			if (hs.getFzsr() != null && hs.getFzcb() != null
					&& hs.getFglf() != null) {
				Double lr = hs.getFzsr() - hs.getFzcb() - hs.getFglf();
				hs.setFlr(lr);
			}

			// 发票开具未到账
			List fpkj = yingshouManager
					.find("select sum(ys.fdebit) from CwYingShou as ys where ys.fxmid=?",
							ht.getFid());
			if (fpkj.size() > 0 && hs.getFzsr() != null &&  fpkj.get(0)!=null) {
				Double jiefangheji = (Double) fpkj.get(0);
				Double cha = jiefangheji - hs.getFzsr();
				if (cha > 0) {
					hs.setFfpkjwdz(cha);
				}
			}
			this.save(hs);
			 hsList.add(hs); 
		}*/
		/*
		 * messageHelper.addFlashMessage(redirectAttributes, "报表生成成功");
		 */
		return redirectAttributes;
	}
}
