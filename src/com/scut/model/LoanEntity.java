package com.scut.model;

import javax.persistence.*;

/**
 * Created by cwc on 2016/8/17.
 */
@Entity
@Table(name = "loan", schema = "loan", catalog = "")
public class LoanEntity {
    private int id;
    private String stuId;
    private String stuName;
    private String stuDepart;
    private String year;
    private double loanNum;
    private double tuitionNum;
    private double refundNum;
    private String date;
    private int success;
    private String remark;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "stu_id", nullable = false, length = 45)
    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    @Basic
    @Column(name = "stu_name", nullable = false, length = 45)
    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    @Basic
    @Column(name = "stu_depart", nullable = false, length = 45)
    public String getStuDepart() {
        return stuDepart;
    }

    public void setStuDepart(String stuDepart) {
        this.stuDepart = stuDepart;
    }

    @Basic
    @Column(name = "year", nullable = false, length = 4)
    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    @Basic
    @Column(name = "loanNum", nullable = false, precision = 0)
    public double getLoanNum() {
        return loanNum;
    }

    public void setLoanNum(double loanNum) {
        this.loanNum = loanNum;
    }

    @Basic
    @Column(name = "tuitionNum", nullable = false, precision = 0)
    public double getTuitionNum() {
        return tuitionNum;
    }

    public void setTuitionNum(double tuitionNum) {
        this.tuitionNum = tuitionNum;
    }

    @Basic
    @Column(name = "refundNum", nullable = false, precision = 0)
    public double getRefundNum() {
        return refundNum;
    }

    public void setRefundNum(double refundNum) {
        this.refundNum = refundNum;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "success", nullable = false)
    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    @Basic
    @Column(name = "remark", nullable = true, length = 45)
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LoanEntity that = (LoanEntity) o;

        if (id != that.id) return false;
        if (Double.compare(that.loanNum, loanNum) != 0) return false;
        if (Double.compare(that.tuitionNum, tuitionNum) != 0) return false;
        if (Double.compare(that.refundNum, refundNum) != 0) return false;
        if (success != that.success) return false;
        if (stuId != null ? !stuId.equals(that.stuId) : that.stuId != null) return false;
        if (stuName != null ? !stuName.equals(that.stuName) : that.stuName != null) return false;
        if (stuDepart != null ? !stuDepart.equals(that.stuDepart) : that.stuDepart != null) return false;
        if (year != null ? !year.equals(that.year) : that.year != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (remark != null ? !remark.equals(that.remark) : that.remark != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + (stuId != null ? stuId.hashCode() : 0);
        result = 31 * result + (stuName != null ? stuName.hashCode() : 0);
        result = 31 * result + (stuDepart != null ? stuDepart.hashCode() : 0);
        result = 31 * result + (year != null ? year.hashCode() : 0);
        temp = Double.doubleToLongBits(loanNum);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(tuitionNum);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(refundNum);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + success;
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        return result;
    }
}
