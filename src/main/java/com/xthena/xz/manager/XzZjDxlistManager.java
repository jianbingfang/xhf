package com.xthena.xz.manager;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xthena.sckf.domain.CommHt;
import com.xthena.util.CommRyMapUtil;
import com.xthena.xz.domain.XzJgysbg;
import com.xthena.xz.domain.XzRedTape;
import com.xthena.xz.domain.XzRyzs;
import com.xthena.xz.domain.XzXjpy;
import com.xthena.xz.domain.XzZbtzs;
import com.xthena.xz.domain.XzZj;
import com.xthena.xz.domain.XzZjDxlist;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.domain.HrRyZj;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class XzZjDxlistManager extends HibernateEntityDao<XzZjDxlist> {

	/**
	 * 公司证件变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, XzZj xzZj) {
		dx.setFname((xzZj.getFname() == null ? "" : xzZj.getFname())
				+ "---" + (xzZj.getFcode() == null ? "" : xzZj.getFcode()));
		dx.setFzjid(xzZj.getFid());
		dx.setFtype(Zj.XZZJ_CODE);
		// dx.setFstate(xzZj.getFzkstate());
		dx.setFstate("1");
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../xz/xzZj-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	/**
	 * 人员证件变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, HrRyZj hrRyZj) {
		// List<CommRy> rys = commRyManager.findBy("fid", hrRyZj.getUserid());
		CommRy ry = CommRyMapUtil.getRyById(hrRyZj.getUserid());
		if (ry == null) {
			ry = new CommRy();
		}
		// 计算年龄
		int age = 0;
		if (ry.getFbirdate() != null) {
			int ryyear = Integer.valueOf(DateFormatUtils.format(
					ry.getFbirdate(), "yyyy"));
			int nowyear = Integer.valueOf(DateFormatUtils.format(new Date(),
					"yyyy"));
			age = nowyear - ryyear;
		}
		dx.setFname((hrRyZj.getFzhengjianno() == null ? "" : hrRyZj
				.getFzhengjianno())
				+ "---"
				+ (ry.getFname() == null ? "" : ry.getFname())
				+ "---"
				+ age
				+ "---"
				+ (hrRyZj.getFname() == null ? "" : hrRyZj.getFname())
				+ "---"
				+ (hrRyZj.getFzhuanye() == null ? "" : hrRyZj.getFzhuanye()));
		dx.setFzjid(hrRyZj.getFid());
		dx.setFtype(Zj.HRRYZJ_CODE);
		// dx.setFstate(hrRyZj.getFstatus2());
		dx.setFstate("1");
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../hr/hrRyZj-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	/**
	 * 获奖证书变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, XzRyzs xzRyzs) {
		dx.setFname((xzRyzs.getFcode() == null ? "" : xzRyzs.getFcode())
				+ "---"
				+ (xzRyzs.getFtype() == null ? "" : xzRyzs.getFtype())
				+ "---"
				+ (xzRyzs.getFfilename() == null ? "" : xzRyzs.getFfilename())
				+ "---"
				+ (xzRyzs.getFhjname() == null ? "" : xzRyzs.getFhjname())
				+ "---"
				+ (CommRyMapUtil.getRyById(xzRyzs.getFhuojiangr()).getFname() == null ? ""
						: CommRyMapUtil.getRyById(xzRyzs.getFhuojiangr())
								.getFname()) + "---"
				+ (xzRyzs.getFyear() == null ? "" : xzRyzs.getFyear()));

		dx.setFzjid(xzRyzs.getFid());
		dx.setFtype(Zj.XZRYZS_CODE);
		// dx.setFstate(xzRyzs.getFfileno());
		dx.setFstate("1");
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../xz/xzRyzs-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	/**
	 * 合同变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, CommHt ht) {
		dx.setFname((ht.getFhetongno() == null ? "" : ht.getFhetongno())
				+ "---"
				+ (ht.getFhtname() == null ? "" : ht.getFhtname())
				+ "---"
				+ (ht.getFqiandingdate() == null ? "" : DateFormatUtils.format(ht.getFqiandingdate(),"yyyy-MM-dd"))
				+ "---"
				+ (ht.getFzongjian() == null ? "" : CommRyMapUtil.getRyById(
						ht.getFzongjian()).getFname()) + "---"
				+ (ht.getFjianlifei() == null ? "" : ht.getFjianlifei())
				+ "---"
				+ (ht.getFtotalMoney() == null ? "" : ht.getFtotalMoney())
				+ "---" + (ht.getFguimo() == null ? "" : ht.getFguimo()));
		dx.setFzjid(ht.getFid());
		dx.setFtype(Zj.COMMHT_CODE);
		// dx.setFstate(ht.getFzkstate());
		dx.setFstate("1");
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../xz/commHt-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	/**
	 * 中标通知书变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, XzZbtzs zb) {
		dx.setFname((zb.getFcode() == null ? "" : zb.getFcode())
				+ " - 项目名称："
				+ (zb.getFxmname() == null ? "" : zb.getFxmname())
				+ " - 时间："
				+ (zb.getFfzrq() == null ? "" : DateFormatUtils.format(zb.getFfzrq(),"yyyy-MM-dd"))
				+ " - 总监："
				+ (zb.getFzongjian() == null ? "" : CommRyMapUtil.getRyById(
						zb.getFzongjian()).getFname()));
		dx.setFzjid(zb.getFid());
		dx.setFtype(Zj.XZZBTZS_CODE);
		// dx.setFstate(zb.getFzkstate());
		dx.setFstate("1");
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../xz/xzZbtzs-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	/**
	 * 竣工验收报告变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, XzJgysbg jg) {
		dx.setFname((jg.getFcode() == null ? "" : jg.getFcode())
				+ "---"
				+ (jg.getFxmname() == null ? "" : jg.getFxmname())
				+ "---"
				+ (jg.getFenddate() == null ? "" : DateFormatUtils.format(jg.getFenddate(),"yyyy-MM-dd"))
				+ "---"
				+ (CommRyMapUtil.getRyById(jg.getFzongjian()).getFname() == null ? ""
						: CommRyMapUtil.getRyById(jg.getFzongjian()).getFname()));
		dx.setFzjid(jg.getFid());
		dx.setFtype(Zj.XZJGYSBG_CODE);
		dx.setFstate("1");
		// dx.setFstate(jg.getFzkstate());
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../xz/xzJgysbg-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	/**
	 * 红头文件变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, XzRedTape red) {
		dx.setFname((red.getFtapeno() == null ? "" : red.getFtapeno())
				+ "---"
				+ (red.getFtaptitle() == null ? "" : red.getFtaptitle())
				+ "---"
				+ (red.getFcreatedate() == null ? "" : DateFormatUtils.format(red.getFcreatedate(),"yyyy-MM-dd"))
				+ "---" + (red.getFhjxm() == null ? "" : red.getFhjxm())
				+ "---" + (red.getFzj() == null ? "" : red.getFzj()));
		dx.setFzjid(red.getFid());
		dx.setFtype(Zj.XZREDTAPE_CODE);
		dx.setFstate("1");
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../xz/xzRedTape-wb-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	/**
	 * 外部评先变身
	 */
	public XzZjDxlist change(XzZjDxlist dx, XzXjpy px) {
		dx.setFname((px.getFwjno() == null ? "" : px.getFwjno()) + "---"
				+ (px.getFtitle() == null ? "" : px.getFtitle()) + "---"
				+ (px.getFzj() == null ? "" : px.getFzj()) + "---"
				+ (px.getFjlgcs() == null ? "" : px.getFjlgcs()));
		dx.setFzjid(px.getFid());
		dx.setFtype(Zj.XZXJPY_CODE);
		dx.setFstate("1");
		dx.setFupdatetime(new Date().getTime());
		dx.setFurl("../xz/xzxjpy-info-input.do?id="+dx.getFzjid());
		return dx;
	}

	// 公司证件保存
	public String mysave(XzZj zj) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", Zj.XZZJ_CODE);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		XzZjDxlist dest = findAndClear(parameterMap);
		this.save(dest);
		return "seccess";
	}

	/**
	 * 人员证件保存
	 * 
	 * @param zj
	 * @param parameterMap
	 * @param redirectAttributes
	 * @return
	 */
	public String mysave(HrRyZj zj) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", Zj.HRRYZJ_CODE);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		XzZjDxlist dest = findAndClear(parameterMap);
		this.save(dest);
		return "seccess";
	}

	/**
	 * 荣誉证书保存
	 * 
	 * @param zj
	 * @param parameterMap
	 * @param redirectAttributes
	 * @return success
	 */
	public String mysave(XzRyzs zj) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", Zj.XZRYZS_CODE);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		XzZjDxlist dest = findAndClear(parameterMap);
		dest = this.change(dest, zj);
		this.save(dest);
		return "seccess";
	}

	/**
	 * 合同保存
	 * 
	 * @param zj
	 * @param parameterMap
	 * @param redirectAttributes
	 * @return success
	 */
	public String mysave(CommHt zj) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", Zj.COMMHT_CODE);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		XzZjDxlist dest = findAndClear(parameterMap);
		dest = this.change(dest, zj);
		this.save(dest);
		return "seccess";
	}

	/**
	 * 中标通知书保存
	 * 
	 * @param zj
	 * @param parameterMap
	 * @param redirectAttributes
	 * @return success
	 */
	public String mysave(XzZbtzs zj) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", Zj.XZZBTZS_CODE);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		XzZjDxlist dest = findAndClear(parameterMap);
		dest = this.change(dest, zj);
		this.save(dest);
		return "seccess";
	}

	/**
	 * 竣工验收报告保存
	 * 
	 * @param zj
	 * @param parameterMap
	 * @param redirectAttributes
	 * @return success
	 */
	public String mysave(XzJgysbg zj) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", Zj.XZJGYSBG_CODE);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		XzZjDxlist dest = findAndClear(parameterMap);
		dest = this.change(dest, zj);
		this.save(dest);
		return "seccess";
	}

	/**
	 * 红头文件保存
	 * 
	 * @param zj
	 * @param parameterMap
	 * @param redirectAttributes
	 * @return success
	 */
	public String mysave(XzRedTape zj) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", Zj.XZREDTAPE_CODE);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		XzZjDxlist dest = findAndClear(parameterMap);
		dest = this.change(dest, zj);
		this.save(dest);
		return "seccess";
	}

	/**
	 * 外部评先
	 * 
	 * @param zj
	 * @param parameterMap
	 * @param redirectAttributes
	 * @return success
	 */
	public String mysave(XzXjpy zj) {
		if (zj.getFtype().equals("外")) {
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("filter_EQS_ftype", Zj.XZXJPY_CODE);
			parameterMap.put("filter_EQL_fzjid", zj.getFid());
			XzZjDxlist dest = findAndClear(parameterMap);
			dest = this.change(dest, zj);
			this.save(dest);
			return "seccess";
		}
		return "loss";
	}

	public XzZjDxlist findByZj(Zj zj,String type ){
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftype", type);
		parameterMap.put("filter_EQL_fzjid", zj.getFid());
		return findAndClear(parameterMap);
	}
	
	
	/**
	 * 公共方法
	 * 
	 * @param parameterMap
	 * @return
	 */
	protected XzZjDxlist findAndClear(
			@RequestParam Map<String, Object> parameterMap) {
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		XzZjDxlist dest = null;
		List<XzZjDxlist> list = this.find(propertyFilters);
		if (list.size() > 0) {
			dest = list.get(0);
			if (list.size() > 1) {
				for (XzZjDxlist dx : list) {
					if (dest.getFid() != dx.getFid()) {
						this.removeById(dx.getFid());
					}
				}
			}
		} else {
			dest = new XzZjDxlist();
		}
		return dest;
	}

}
