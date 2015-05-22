package com.xthena.sckf.domain;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by xi on 2015/5/9.
 */
@Entity
@Table(name = "t_jy_fbxm", schema = "", catalog = "xhf")
public class JyXmFb {
    private long fid;
    private Date kaibiaoData;
    private String xiangmuName;
    private String feibiaoReason;
    private String host;

    @Id
    @Column(name = "fid", nullable = false, insertable = true, updatable = true)
    public long getFid() {
        return fid;
    }

    public void setFid(long fid) {
        this.fid = fid;
    }

    @Basic
    @Column(name = "Kaibiao_data", nullable = true, insertable = true, updatable = true)
    public Date getKaibiaoData() {
        return kaibiaoData;
    }

    public void setKaibiaoData(Date kaibiaoData) {
        this.kaibiaoData = kaibiaoData;
    }

    @Basic
    @Column(name = "Xiangmu_name", nullable = true, insertable = true, updatable = true, length = 255)
    public String getXiangmuName() {
        return xiangmuName;
    }

    public void setXiangmuName(String xiangmuName) {
        this.xiangmuName = xiangmuName;
    }

    @Basic
    @Column(name = "Feibiao_reason", nullable = true, insertable = true, updatable = true, length = 255)
    public String getFeibiaoReason() {
        return feibiaoReason;
    }

    public void setFeibiaoReason(String feibiaoReason) {
        this.feibiaoReason = feibiaoReason;
    }

    @Basic
    @Column(name = "host", nullable = true, insertable = true, updatable = true, length = 255)
    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        JyXmFb that = (JyXmFb) o;

        if (fid != that.fid) return false;
        if (kaibiaoData != null ? !kaibiaoData.equals(that.kaibiaoData) : that.kaibiaoData != null) return false;
        if (xiangmuName != null ? !xiangmuName.equals(that.xiangmuName) : that.xiangmuName != null) return false;
        if (feibiaoReason != null ? !feibiaoReason.equals(that.feibiaoReason) : that.feibiaoReason != null)
            return false;
        if (host != null ? !host.equals(that.host) : that.host != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (fid ^ (fid >>> 32));
        result = 31 * result + (kaibiaoData != null ? kaibiaoData.hashCode() : 0);
        result = 31 * result + (xiangmuName != null ? xiangmuName.hashCode() : 0);
        result = 31 * result + (feibiaoReason != null ? feibiaoReason.hashCode() : 0);
        result = 31 * result + (host != null ? host.hashCode() : 0);
        return result;
    }
}
