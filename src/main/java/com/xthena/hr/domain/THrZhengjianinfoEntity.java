package com.xthena.hr.domain;

import javax.persistence.*;

/**
 * Created by xi on 2015/6/16.
 */
@Entity
@Table(name = "t_hr_zhengjianinfo", schema = "", catalog = "xhf")
public class THrZhengjianinfoEntity {
    private long fid;
    private String fname;
    private String fcontent;
    private String fbeizhu;

    @Id
    @Column(name = "fid", nullable = false, insertable = true, updatable = true)
    public long getFid() {
        return fid;
    }

    public void setFid(long fid) {
        this.fid = fid;
    }

    @Basic
    @Column(name = "fname", nullable = true, insertable = true, updatable = true, length = 1000)
    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    @Basic
    @Column(name = "fcontent", nullable = true, insertable = true, updatable = true, length = 1000)
    public String getFcontent() {
        return fcontent;
    }

    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }

    @Basic
    @Column(name = "fbeizhu", nullable = true, insertable = true, updatable = true, length = 1000)
    public String getFbeizhu() {
        return fbeizhu;
    }

    public void setFbeizhu(String fbeizhu) {
        this.fbeizhu = fbeizhu;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        THrZhengjianinfoEntity that = (THrZhengjianinfoEntity) o;

        if (fid != that.fid) return false;
        if (fname != null ? !fname.equals(that.fname) : that.fname != null) return false;
        if (fcontent != null ? !fcontent.equals(that.fcontent) : that.fcontent != null) return false;
        if (fbeizhu != null ? !fbeizhu.equals(that.fbeizhu) : that.fbeizhu != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (fid ^ (fid >>> 32));
        result = 31 * result + (fname != null ? fname.hashCode() : 0);
        result = 31 * result + (fcontent != null ? fcontent.hashCode() : 0);
        result = 31 * result + (fbeizhu != null ? fbeizhu.hashCode() : 0);
        return result;
    }
}
