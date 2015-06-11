package com.xthena.scheduler.task;

import com.xthena.common.domain.CommRemindConf;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class RemindTask implements Runnable {

    private CommRemindConf commRemindConf;

    private Connection conn;


    public Connection getConn() {
        return conn;
    }


    public void setConn(Connection conn) {
        this.conn = conn;
    }


    public CommRemindConf getCommRemindConf() {
        return commRemindConf;
    }


    public void setCommRemindConf(CommRemindConf commRemindConf) {
        this.commRemindConf = commRemindConf;
    }

    @Override
    public void run() {

        Calendar now = Calendar.getInstance();
        String unit = commRemindConf.getFbeforeunit();
        String enableunit = commRemindConf.getFexpireunit();

        Date date = new Date();

        //计算提醒到的时间
        if (unit.equals("年")) {
            now.add(Calendar.YEAR, commRemindConf.getFbeforeval());
        } else if (unit.equals("月")) {
            now.add(Calendar.MONTH, commRemindConf.getFbeforeval());
        } else if (unit.equals("天")) {
            now.add(Calendar.DATE, commRemindConf.getFbeforeval());
        } else if (unit.equals("小时")) {
            now.add(Calendar.HOUR_OF_DAY, commRemindConf.getFbeforeval());
        } else if (unit.equals("分钟")) {
            now.add(Calendar.MINUTE, commRemindConf.getFbeforeval());
        }


//        String sql = commRemindConf.getFsql();
        String sql;
        switch (commRemindConf.getFname()) {
            case "审车时间":
            case "车辆续保提醒":
            case "车辆维保提醒":
                sql = "select fid from t_xz_car a where fwbdate<? and not exists(select 1 from t_comm_remind_data b where a.fid=b.fdataid and b.fstatus='有效' and b.fconfid=?)";
                break;
            case "监理进度提醒":
                sql = "select fid from t_jl_jindugenzong a where fenddate<? and not exists(select 1 from t_comm_remind_data b where a.fid=b.fdataid and b.fstatus='有效' and b.fconfid=?)";
                break;
            default:
                sql = "";
                break;
        }

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sf.format(now.getTime()));
            ps.setLong(2, commRemindConf.getFid());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List<Long> ryList = new ArrayList<Long>();
                if (commRemindConf.getFremindtytype().equals("全体")) {
                    sql = "select id from user_base";
                    PreparedStatement ps1 = conn.prepareStatement(sql);
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        ryList.add(rs1.getLong("id"));
                    }
                } else if (commRemindConf.getFremindtytype().equals("角色")) {
                    sql = "select DISTINCT a.ref from auth_user_status a,auth_user_role b where a.id=b.user_status_id and b.role_id=? ";
                    PreparedStatement ps1 = conn.prepareStatement(sql);
                    ps1.setLong(1, commRemindConf.getFremindry());
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        ryList.add(rs1.getLong("ref"));
                    }
                } else if (commRemindConf.getFremindtytype().equals("部门")) {
                    sql = "select DISTINCT d.id from org_department a,t_hr_gwbm b,t_common_ry c,user_base d where a.fid=b.fbmid and b.fid=c.fjobid " +
                            " and c.fid=d.fryid and a.fid=? ";
                    PreparedStatement ps1 = conn.prepareStatement(sql);
                    ps1.setLong(1, commRemindConf.getFremindry());

                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        ryList.add(rs1.getLong("id"));
                    }

                } else if (commRemindConf.getFremindtytype().equals("岗位")) {

                    sql = "select DISTINCT d.id from t_hr_gwbm b,t_common_ry c,user_base d where  b.fid=c.fjobid and c.fid=d.fryid and b.fid=? ";
                    PreparedStatement ps1 = conn.prepareStatement(sql);
                    ps1.setLong(1, commRemindConf.getFremindry());

                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        ryList.add(rs1.getLong("id"));
                    }

                } else if (commRemindConf.getFremindtytype().equals("人员")) {
                    sql = "select DISTINCT d.id from t_common_ry c,user_base d where c.fid=d.fryid and c.fid=? ";
                    PreparedStatement ps1 = conn.prepareStatement(sql);
                    ps1.setLong(1, commRemindConf.getFremindry());

                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        ryList.add(rs1.getLong("id"));
                    }
                }


                //计算失效时间
                Calendar expireC = Calendar.getInstance();
                if (enableunit.equals("年")) {
                    expireC.add(Calendar.YEAR, commRemindConf.getFexpireval());
                } else if (enableunit.equals("月")) {
                    expireC.add(Calendar.MONTH, commRemindConf.getFexpireval());
                } else if (enableunit.equals("天")) {
                    expireC.add(Calendar.DATE, commRemindConf.getFexpireval());
                } else if (enableunit.equals("小时")) {
                    expireC.add(Calendar.HOUR_OF_DAY, commRemindConf.getFexpireval());
                } else if (enableunit.equals("分钟")) {
                    expireC.add(Calendar.MINUTE, commRemindConf.getFexpireval());
                }


                //生成提醒数据
                sql = "insert into t_comm_remind (fname,fremindry,fremindtime,fstatus,fremindcontent,fconfid,ftimes,fremindurl,fdataid,fexpiretime) values (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps2 = conn.prepareStatement(sql);
                for (Long ryid : ryList) {
                    ps2.setString(1, commRemindConf.getFname());
                    ps2.setLong(2, ryid);
                    ps2.setTimestamp(3, new Timestamp(date.getTime()));
                    ps2.setString(4, "未提醒");
                    ps2.setString(5, commRemindConf.getFcontent());
                    ps2.setLong(6, commRemindConf.getFid());
                    ps2.setInt(7, 0);
                    ps2.setString(8, commRemindConf.getFremindurl().replace("#", rs.getString(1)));
                    ps2.setLong(9, rs.getLong("fid"));
                    ps2.setTimestamp(10, new Timestamp(expireC.getTimeInMillis()));
                    ps2.addBatch();
                }
                ps2.executeBatch();


                //保存已经提醒的数据,防止重复提醒
                sql = "insert into t_comm_remind_data (fdataid,fstatus,fconfid,freminddate,fexpiredate) values (?,?,?,?,?)";
                PreparedStatement ps3 = conn.prepareStatement(sql);
                ps3.setLong(1, rs.getLong("fid"));
                ps3.setString(2, "有效");
                ps3.setLong(3, commRemindConf.getFid());
                ps3.setTimestamp(4, new Timestamp(date.getTime()));
                ps3.setTimestamp(5, new Timestamp(expireC.getTimeInMillis()));
                ps3.addBatch();

                ps3.executeBatch();
            }

            //超时的提醒设置为无效
            sql = "update t_comm_remind_data set fstatus='无效' where fstatus='有效' and fexpiredate<? and fconfid=?";
            PreparedStatement ps4 = conn.prepareStatement(sql);
            ps4.setTimestamp(1, new Timestamp(new Date().getTime()));
            ps4.setLong(2, commRemindConf.getFid());
            ps4.executeUpdate();


            //扫描数据是否已经处理
            // sql = commRemindConf.getFexpiresql();
            switch (commRemindConf.getFname()) {
                case "审车时间":
                case "车辆续保提醒":
                case "车辆维保提醒":
                    sql = "delete from t_comm_remind where EXISTS (select 1 from t_xz_car xc where t_comm_remind.fdataid=xc.fid and xc.fbxdate>=t_comm_remind.fexpiretime and t_comm_remind.fconfid=?)";
                    break;
                case "监理进度提醒":
                    sql = "delete from t_comm_remind where EXISTS (select 1 from t_jl_jindugenzong xc where t_comm_remind.fdataid=xc.fid and xc.fenddate>=t_comm_remind.fexpiretime and t_comm_remind.fconfid=?)";
                    break;
                default:
                    sql = "";
                    break;
            }

            PreparedStatement ps5 = conn.prepareStatement(sql);
            ps5.setLong(1, commRemindConf.getFid());
            ps5.executeUpdate();


            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        //System.out.println(commRemindLogManager.getAll());
    }


    public static void main(String[] args) {
        /*ApplicationContext context = new ClassPathXmlApplicationContext("src/main/resources/spring/applicationContext.xml");
        System.out.println(context.getBeanDefinitionNames());*/
        //org.springframework.jdbc.core.JdbcTemplate dataSourceServiceFactoryBean=(org.springframework.jdbc.core.JdbcTemplate) context.get("jdbcTemplate");
        //dataSourceServiceFactoryBean.getDataSource();
    }


}
