package com.xthena.cw.manager;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xthena.cw.domain.CwHtFx;
import com.xthena.cw.domain.CwHtfxlist;
import com.xthena.cw.domain.CwXmhs;
import com.xthena.cw.domain.CwYingShou;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.gcgl.domain.PjHtly;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjHtlyManager;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;

import org.hibernate.mapping.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class CwHtfxManager extends HibernateEntityDao<CwHtFx> {
	@Autowired
	private CwYingShouManager yingShouManager;
	@Autowired
	private CommHtManager htManager;
	@Autowired
	private PjHtlyManager pjHtlyManager;

	public RedirectAttributes newList(CwHtfxlist htfxList,
			RedirectAttributes redirectAttributes) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		if (htfxList.getFjsstate() != "")
			parameterMap.put("filter_EQS_fjsstate", htfxList.getFjsstate());
		parameterMap.put("filter_EQS_fmemo4", htfxList.getFsx());

		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		List<CommHt> hts = htManager.find(propertyFilters);
		// ArrayList<CwHtFx> results = new ArrayList<CwHtFx>();

		for (CommHt ht : hts) {
			CwHtFx htfx = new CwHtFx();
			// listId
			htfx.setFlistid(htfxList.getFid());
			// 合同ID
			htfx.setFhetongid(ht.getFid());
			// 合同名称
			if (ht.getFhtname() != null) {
				htfx.setFhetongname(ht.getFhtname());
			}
			// 合同金额
			Double zje = 0.0;
			if (ht.getFjianlifei() != null) {
				zje = ht.getFjianlifei() * 10000;
			}
			htfx.setFhetongjine(String.format("%.2f", zje));

			// 实际总收入
			Long xmid = ht.getFid();
			List yingshous = yingShouManager.find(
					"select sum(fcreditor) from CwYingShou where fxmid=?", xmid);

			Double sjzsr = 0.0;
			if (yingshous.size() > 0 && yingshous.get(0) != null) {
				sjzsr = (Double) yingshous.get(0);
			}
			htfx.setFsjzsr(sjzsr.toString());
            //
			List list = yingShouManager
					.find("select ys from CwYingShou ys where ys.fxmid=? order by ys.fid desc",
							xmid);
			CwYingShou ys1 = new CwYingShou();
			if (list.size() > 0) {
				ys1 = (CwYingShou) list.get(0);
				if (ys1.getFhjjdfx().equals("贷方")) {
					htfx.setFyszk("");
				} else {
					htfx.setFyszk(ys1.getFhjje());
				}
				if(zje>0){
					htfx.setFhsl(String.format("%.2f", sjzsr / zje));
				}
			}

			List pjhtlys = pjHtlyManager.findBy("fxmid", ht.getFid());
			PjHtly pjhtly = new PjHtly();
			if (pjhtlys.size() > 0) {
				pjhtly = (PjHtly) pjhtlys.get(0);
				// 履约率
				htfx.setFlyl(pjhtly.getFlvyuelv());
				// 工程进度
				htfx.setFgcjd(pjhtly.getFpjjd());
				// 备注
				htfx.setFmemo(pjhtly.getFmemo());
			}
			this.save(htfx);
		}

		/*
		 * messageHelper.addFlashMessage(redirectAttributes, "报表生成成功");
		 */
		return redirectAttributes;
	}

	public RedirectAttributes removeList(Long htfxListId,
			RedirectAttributes redirectAttributes) {
		List<CwHtFx> fxlist = this.findBy("flistid", htfxListId);
		for (CwHtFx htfx : fxlist) {
			this.remove(htfx);
		}
		return redirectAttributes;
	}
}
