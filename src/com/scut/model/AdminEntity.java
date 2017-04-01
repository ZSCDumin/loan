package com.scut.model;

import javax.persistence.*;

/**
 * Created by cwc on 2016/8/17.
 */
@Entity
@Table(name = "admin", schema = "loan", catalog = "")
public class AdminEntity {
    private String adminName;
    private String adminPass;
    private String name;

    @Id
    @Column(name = "adminName", nullable = false, length = 45)
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Basic
    @Column(name = "adminPass", nullable = false, length = 45)
    public String getAdminPass() {
        return adminPass;
    }

    public void setAdminPass(String adminPass) {
        this.adminPass = adminPass;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdminEntity that = (AdminEntity) o;

        if (adminName != null ? !adminName.equals(that.adminName) : that.adminName != null) return false;
        if (adminPass != null ? !adminPass.equals(that.adminPass) : that.adminPass != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = adminName != null ? adminName.hashCode() : 0;
        result = 31 * result + (adminPass != null ? adminPass.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
