package com.xthena.xz.manager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.xz.domain.XzCar;

@Service
public class XzCarManager extends HibernateEntityDao<XzCar> {

	private static Logger logger = LoggerFactory.getLogger(XzCarManager.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Map<String, Object>> getCarCost() {
		List<XzCar> xzcars = this.getAll();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (XzCar car : xzcars) {
			String sql = "select t.fid,t.fcarno,t.fmemo1,IFNULL(sum(tt.fbxmoney),0) bxMoney,IFNULL(SUM(ttt.foilmoney),0) oilmoney,IFNULL(sum(tttt.fscmoney),0) scmoney,"
					+ " IFNULL(sum(ttttt.fwbmoney),0) wbmoney from t_xz_car t "
					+ " LEFT JOIN (select fcarid,IFNULL(sum(fbxmoney),0) fbxmoney from t_xz_car_bx_recore group by fcarid) tt on t.fid=tt.fcarid "
					+ " LEFT JOIN  (select fcarid,IFNULL(sum(foilmoney),0) foilmoney from t_xz_car_oil_recode group by fcarid)  ttt on t.fid=ttt.fcarid "
					+ " LEFT JOIN  (select fcarid,IFNULL(sum(fscmoney),0) fscmoney from t_xz_car_sc group by fcarid)  tttt on t.fid=tttt.fcarid "
					+ " LEFT JOIN  (select fcarid,IFNULL(sum(fwbmoney),0) fwbmoney from t_xz_car_wbrecord group by fcarid)  ttttt on t.fid=ttttt.fcarid WHERE t.fid="
					+ car.getFid();
			list.add(jdbcTemplate.queryForList(sql).get(0));
		}
		return list;
	}
}
