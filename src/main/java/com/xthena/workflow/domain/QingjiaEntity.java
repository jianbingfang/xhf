package com.xthena.workflow.domain;

import javax.persistence.*;
import java.sql.Date;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by xi on 2015/7/7.
 */
@Entity
@Table(name = "t_workflow_qingjia", schema = "", catalog = "xhf")
public class QingjiaEntity {
    private Long fid;
    private String fname;
    private Date fstartdate;
    private Date fenddate;
    private String fmemo;
    private String fresult;
    private String ftaskid;
    private String fmemo1;
    private String fmemo2;


    @Id @GeneratedValue(strategy=IDENTITY)
    @Column(name = "fid", nullable = false, unique=true,insertable = true, updatable = true)
    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    @Basic
    @Column(name = "fname", nullable = true, insertable = true, updatable = true, length = 100)
    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    @Basic
    @Column(name = "fstartdate", nullable = true, insertable = true, updatable = true)
    public Date getFstartdate() {
        return fstartdate;
    }

    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
    }

    @Basic
    @Column(name = "fenddate", nullable = true, insertable = true, updatable = true)
    public Date getFenddate() {
        return fenddate;
    }

    public void setFenddate(Date fenddate) {
        this.fenddate = fenddate;
    }

    @Basic
    @Column(name = "fmemo", nullable = true, insertable = true, updatable = true, length = 400)
    public String getFmemo() {
        return fmemo;
    }

    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }

    @Basic
    @Column(name = "fresult", nullable = true, insertable = true, updatable = true, length = 400)
    public String getFresult() {
        return fresult;
    }

    public void setFresult(String fresult) {
        this.fresult = fresult;
    }

    @Basic
    @Column(name = "ftaskid", nullable = true, insertable = true, updatable = true, length = 400)
    public String getFtaskid() {
        return ftaskid;
    }

    public void setFtaskid(String ftaskid) {
        this.ftaskid = ftaskid;
    }

    @Basic
    @Column(name = "fmemo1", nullable = true, insertable = true, updatable = true, length = 400)
    public String getFmemo1() {
        return fmemo1;
    }

    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }

    @Basic
    @Column(name = "fmemo2", nullable = true, insertable = true, updatable = true, length = 400)
    public String getFmemo2() {
        return fmemo2;
    }

    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QingjiaEntity that = (QingjiaEntity) o;

        if (fid != that.fid) return false;
        if (fname != null ? !fname.equals(that.fname) : that.fname != null) return false;
        if (fstartdate != null ? !fstartdate.equals(that.fstartdate) : that.fstartdate != null) return false;
        if (fenddate != null ? !fenddate.equals(that.fenddate) : that.fenddate != null) return false;
        if (fmemo != null ? !fmemo.equals(that.fmemo) : that.fmemo != null) return false;
        if (fresult != null ? !fresult.equals(that.fresult) : that.fresult != null) return false;
        if (ftaskid != null ? !ftaskid.equals(that.ftaskid) : that.ftaskid != null) return false;
        if (fmemo1 != null ? !fmemo1.equals(that.fmemo1) : that.fmemo1 != null) return false;
        if (fmemo2 != null ? !fmemo2.equals(that.fmemo2) : that.fmemo2 != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (fid ^ (fid >>> 32));
        result = 31 * result + (fname != null ? fname.hashCode() : 0);
        result = 31 * result + (fstartdate != null ? fstartdate.hashCode() : 0);
        result = 31 * result + (fenddate != null ? fenddate.hashCode() : 0);
        result = 31 * result + (fmemo != null ? fmemo.hashCode() : 0);
        result = 31 * result + (fresult != null ? fresult.hashCode() : 0);
        result = 31 * result + (ftaskid != null ? ftaskid.hashCode() : 0);
        result = 31 * result + (fmemo1 != null ? fmemo1.hashCode() : 0);
        result = 31 * result + (fmemo2 != null ? fmemo2.hashCode() : 0);
        return result;
    }
}
