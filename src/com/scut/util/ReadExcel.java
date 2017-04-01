package com.scut.util;

import com.scut.model.LoanEntity;
import jxl.Sheet;
import jxl.Workbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangming on 16/8/22.
 */
public class ReadExcel {
    public List<LoanEntity> ReadXls(File file) throws Exception{
        List<LoanEntity> loanList =new ArrayList<LoanEntity>();
        InputStream inputStream=new FileInputStream(file);
        Workbook workbook=Workbook.getWorkbook(inputStream);

        Sheet sheet=workbook.getSheet(0);

        for (int i=1;i<sheet.getRows();i++){
            LoanEntity loanEntity=new LoanEntity();
            loanEntity.setStuId(sheet.getCell(0,i).getContents());
            //System.out.println(sheet.getCell(0,1).getContents().toString());
            loanEntity.setStuName(sheet.getCell(1,i).getContents());
            loanEntity.setStuDepart(sheet.getCell(2,i).getContents());
            loanEntity.setYear(sheet.getCell(3,i).getContents());
            loanEntity.setLoanNum(Double.parseDouble(sheet.getCell(4,i).getContents()));
            loanEntity.setTuitionNum(Double.parseDouble(sheet.getCell(5,i).getContents()));
            loanEntity.setRefundNum(Double.parseDouble(sheet.getCell(6,i).getContents()));
            loanEntity.setDate(sheet.getCell(7,i).getContents());
            if (sheet.getCell(8,i).getContents().equals("·ñ")){
                loanEntity.setSuccess(0);
            }else {
                loanEntity.setSuccess(1);
            }
            loanList.add(loanEntity);
        }
        return loanList;
    }

}


