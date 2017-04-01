package com.scut.repository;

import com.scut.model.AdminEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by cwc on 2016/8/17.
 */
@Repository
public interface AdminRepository extends JpaRepository<AdminEntity,String> {
}
