package com.xthena.sckf.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by xi on 2015/5/21.
 */
@Entity
@Table(name = "t_jy_fbxm1", schema = "", catalog = "xhf")
public class JyXmFb {
    private Long fid;
    private Date kaibiaoData;
    private String xiangmuName;
    private String feibiaoReason;
    private String host;
    private Long fxmid;

    @Id  @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fid", nullable = false, insertable = true, updatable = true)
    public Long getFid() {
        return fid;
    }

    public void setFid(long fid) {
        this.fid = fid;
    }

    @Basic
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Column(name = "Kaibiao_data", nullable = true, insertable = true, updatable = true)
    public Date getKaibiaoData() {
        return kaibiaoData;
    }
    public void setKaibiaoData(Date kaibiaoData) {
        this.kaibiaoData = kaibiaoData;
    }

    @Basic
    @Column(name = "Xiangmu_name", nullable = true, insertable = true, updatable = true, length = 1000)
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
    @Basic
    @Column(name = "fxmid", nullable = true, insertable = true, updatable = true)
    public Long getFxmid() {
        return fxmid;
    }

    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
}
