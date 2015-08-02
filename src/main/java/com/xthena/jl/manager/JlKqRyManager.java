package com.xthena.jl.manager;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.gcgl.domain.PjKq;
import com.xthena.gcgl.domain.PjRy;
import com.xthena.gcgl.manager.PjKqManager;
import com.xthena.gcgl.manager.PjRyManager;
import com.xthena.jl.domain.JlKqDetail;
import com.xthena.jl.domain.JlKqRy;
import com.xthena.util.CommRyMapUtil;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class JlKqRyManager extends HibernateEntityDao<JlKqRy> {

    @Autowired
    private JlKqDetailManager jlKqDetailManager;

    @Autowired
    private PjRyManager pjRyManager;

    @Autowired
    private PjKqManager pjKqManager;


    public Map<String, String> saveKq(Map<String, Object> parameterMap) {

        //获取页面传参 通过考勤id 班次和天得到数据
        Long kqryid = Long.valueOf(String.valueOf(parameterMap.get("kqryid")));
        int banci = Integer.valueOf(String.valueOf(parameterMap.get("banci")));
        int day = Integer.valueOf(String.valueOf(parameterMap.get("day")));

        //查询到该天该班次的数据
        String hql = "select jkd from JlKqDetail jkd where frykqid=? and fday=? and fbanci=?";
        JlKqDetail jlKqDetail = jlKqDetailManager.findUnique(hql, kqryid, day, banci);

        //如果存在则在此基础上+1
        if (jlKqDetail != null) {
            if (jlKqDetail.getFkq() < 4) {
                jlKqDetail.setFkq(jlKqDetail.getFkq() + 1);
            } else {
                jlKqDetail.setFkq(0);
            }
        } else {//如果不存在 插入一条新的
            jlKqDetail = new JlKqDetail();
            jlKqDetail.setFday(day);
            jlKqDetail.setFkq(1);
            jlKqDetail.setFbanci(banci);
            jlKqDetail.setFrykqid(kqryid);
            save(jlKqDetail);
        }

        //统计人员到岗情况
        hql = "select count(jkd) from JlKqDetail jkd where frykqid=? and fkq=?";
        Map<String, String> kqResult = new HashMap<String, String>();
        kqResult.put("r1", String.valueOf(jlKqDetailManager.getCount(hql, kqryid, 1) / 2.0));
        kqResult.put("r2", String.valueOf(jlKqDetailManager.getCount(hql, kqryid, 2) / 2.0));
        kqResult.put("r3", String.valueOf(jlKqDetailManager.getCount(hql, kqryid, 3) / 2.0));
        kqResult.put("r4", String.valueOf(jlKqDetailManager.getCount(hql, kqryid, 4) / 2.0));

        kqResult.put("currentDay", String.valueOf(jlKqDetail.getFkq()));

        return kqResult;

    }

    public HashMap<String, Object> listRyKq(Map<String, Object> parameterMap) {

        //传参为考勤ID
        Long kqid = Long.valueOf(String.valueOf(parameterMap.get("kqid")));
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        //根据选择的考勤表 得到考勤月份
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        Date date = null;
        try {
            PjKq pjKq = pjKqManager.get(kqid);
            date = sdf.parse(pjKq.getFyearmonth());
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //得到本期的考勤人员列表
        List<JlKqRy> jlKqryList = findBy("fkqid", kqid);

        //拼接考勤人员的人员 List
        List<Long> kqryIdList = new ArrayList<Long>();
        for (JlKqRy jlKqRy : jlKqryList) {
            kqryIdList.add(jlKqRy.getFryid());
        }

        //得到当月还在项目的人员列表（离开日期为空或者大于本月初）
        String hql = "select pjry from PjRy pjry where fxmid=? and (fenddate is null or fenddate>?)";
        List<PjRy> pjRies = pjRyManager.find(hql, Long.parseLong(String.valueOf(parameterMap.get("fxmid"))), date);

        //循环项目人员 如果考勤人员里面没有包含某个项目人员 为这个人员新建一条考勤人员记录
        boolean added = false;
        for (PjRy pjRy : pjRies) {
            if (!kqryIdList.contains(pjRy.getFryid())) {
                JlKqRy jlKqRy = new JlKqRy();
                jlKqRy.setFkqid(kqid);
                jlKqRy.setFryid(pjRy.getFryid());
                save(jlKqRy);
                kqryIdList.add(pjRy.getFryid());
                added = true;
            }
        }

        //如果存在新增 重新查一次考勤人员列表
        if (added) {
            jlKqryList = findBy("fkqid", kqid);
        }

        //定义人员Map
        HashMap<String, String> ryMap = new HashMap<String, String>();

        //考勤人员的主键
        List<Long> fkqryids = new ArrayList<Long>();

        //各考勤人员的统计结果
        HashMap<String, HashMap<String, String>> rykqResult = new HashMap<String, HashMap<String, String>>();

        hql = "select count(jkd) from JlKqDetail jkd where frykqid=? and fkq=?";
        for (JlKqRy jlKqRy : jlKqryList) {
            if (jlKqRy.getFryid() != null && CommRyMapUtil.getRyMap().get(jlKqRy.getFryid()) != null) {
                ryMap.put("ry" + jlKqRy.getFryid(), CommRyMapUtil.getRyMap().get(jlKqRy.getFryid()).getFname());
                fkqryids.add(jlKqRy.getFid());
                HashMap<String, String> kqResult = new HashMap<String, String>();
                kqResult.put("r1", String.valueOf(jlKqDetailManager.getCount(hql, jlKqRy.getFid(), 1) / 2.0));
                kqResult.put("r2", String.valueOf(jlKqDetailManager.getCount(hql, jlKqRy.getFid(), 2) / 2.0));
                kqResult.put("r3", String.valueOf(jlKqDetailManager.getCount(hql, jlKqRy.getFid(), 3) / 2.0));
                kqResult.put("r4", String.valueOf(jlKqDetailManager.getCount(hql, jlKqRy.getFid(), 4) / 2.0));

                rykqResult.put("ry" + jlKqRy.getFid(), kqResult);
            }
        }
        //考勤人员列表
        resultMap.put("fkqry", jlKqryList);
        //考勤明细
        if (!fkqryids.isEmpty()) {
            Criterion criterion = Restrictions.in("frykqid", fkqryids);
            resultMap.put("kqDetail", jlKqDetailManager.find(JlKqDetail.class, criterion));
        } else {
            resultMap.put("kqDetail", null);
        }


        //参与考勤的人员列表
        resultMap.put("ryMap", ryMap);

        //考勤人员结果
        resultMap.put("ryResultMap", rykqResult);

        return resultMap;
    }

}

