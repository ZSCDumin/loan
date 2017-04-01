package com.scut.controller;

import com.scut.model.LoanEntity;
import com.scut.repository.LoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by cwc on 2016/8/17.
 */
@Controller
public class MainController {

    @Autowired
    LoanRepository loanRepository;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "index";
    }

    @RequestMapping(value = "loans",method = RequestMethod.POST)
    public String getLoans(ModelMap modelMap, @Param("stu_id")String stu_id){
        List<LoanEntity> loanList=loanRepository.findByStu(stu_id);
        if (loanList.size()==0){
            modelMap.addAttribute("msg","查无记录，请在贷款发放后再查询");
            return "index";
        }else {
            modelMap.addAttribute("loanList",loanList);
            return "loans";
        }
    }
}
