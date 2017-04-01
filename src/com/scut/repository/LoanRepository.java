package com.scut.repository;

import com.scut.model.LoanEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by cwc on 2016/8/17.
 */
@Repository
public interface LoanRepository extends JpaRepository<LoanEntity,Integer> {
    @Query("select loans from LoanEntity loans where loans.stuId=:sid")
    public List<LoanEntity> findByStu(@Param("sid")String stu_id);

    @Query("select loan from LoanEntity loan where loan.success=0")
    public List<LoanEntity> getBySuccess();

    @Transactional
    @Modifying
    @Query("update LoanEntity loan set loan.success=:success,loan.remark=:remark where loan.id=:id")
    public void updateSuccess(@Param("success") Integer success,@Param("remark")String remark,@Param("id") Integer id);

}
