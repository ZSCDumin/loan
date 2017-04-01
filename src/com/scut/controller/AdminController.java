package com.scut.controller;

import com.google.gson.Gson;
import com.scut.model.AdminEntity;
import com.scut.model.LoanEntity;
import com.scut.repository.AdminRepository;
import com.scut.repository.LoanRepository;
import com.scut.util.ReadExcel;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by cwc on 2016/8/17.
 */
@Controller
public class AdminController {
	@Autowired
	HttpServletRequest request;

	@Autowired
	LoanRepository loanRepository;

	@Autowired
	AdminRepository adminRepository;

	@RequestMapping("login")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "manage", method = RequestMethod.POST)
	public String manage(ModelMap modelMap, @Param("adminName") String adminName, @Param("adminPass") String adminPass,
			HttpSession session) {
		try {
			AdminEntity admin = adminRepository.findOne(adminName);
			if (admin.getAdminPass().equals(adminPass)) {
				modelMap.addAttribute("user", admin);
				session.setAttribute("user", admin);
				return "manage/manage";
			} else {
				modelMap.addAttribute("msg", "用户名或密码错误");
				return "login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("msg", "用户名或密码错误");
			return "login";
		}

	}

	@RequestMapping(value = "manage/quit", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/login";
	}

	@RequestMapping(value = "manage/upload")
	public String toUpload() {
		return "manage/upload";
	}

	@RequestMapping(value = "manage/uploadExcl", method = RequestMethod.POST)
	public String upload(@Param("file") MultipartFile file, ModelMap modelMap) {
		try {
			String path = request.getSession().getServletContext().getRealPath("/upload");
			System.out.println(path);
			String newFile = path + "/" + new Long(System.currentTimeMillis()) + file.getOriginalFilename();
			FileUtils.writeByteArrayToFile(new File(newFile), file.getBytes());
			List<LoanEntity> loanList = new ReadExcel().ReadXls(new File(newFile));
			for (LoanEntity loanEntity : loanList) {
				loanRepository.saveAndFlush(loanEntity);
			}
			modelMap.addAttribute("msg", "成功导入" + loanList.size() + "条数据！");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("msg", "导入失败,请检查数据!");
		}
		return "manage/upload";
	}

	@RequestMapping("manage/loans")
	public String getLoans() {
		return "manage/loans";
	}

	@RequestMapping("manage/getList")
	public void getList(HttpServletRequest request, HttpServletResponse response, @RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows) {
		try {
			String stuId = request.getParameter("stuId");
			if (stuId == null) {
				Sort sort = new Sort(Sort.Direction.DESC, "date");
				Pageable pageable = new PageRequest(page - 1, rows, sort);
				Page<LoanEntity> loanEntityPage = loanRepository.findAll(pageable);
				List<LoanEntity> loanEntityList = loanEntityPage.getContent();
				Gson gson = new Gson();
				String loans = gson.toJson(loanEntityList);
				response.setContentType("text/html;charset=utf-8");
				String json = "{\"total\":" + loanEntityPage.getTotalElements() + ",\"rows\":" + loans + "}";
				response.getWriter().write(json);
			} else {
				List<LoanEntity> loanEntityList = loanRepository.findByStu(stuId);
				Gson gson = new Gson();
				String loans = gson.toJson(loanEntityList);
				response.setContentType("text/html;charset=utf-8");
				String json = "{\"total\":" + loanEntityList.size() + ",\"rows\":" + loans + "}";
				response.getWriter().write(json);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/manage/saveLoan", method = RequestMethod.POST)
	public void saveLoan(HttpServletResponse response, @RequestBody String obj) {
		try {
			Gson gson = new Gson();
			LoanEntity loanEntity = gson.fromJson(obj, LoanEntity.class);
			loanRepository.saveAndFlush(loanEntity);
			response.setContentType("text/html;charset=utf-8");
			String str = "{\"status\":\"ok\",\"message\":\"保存成功!\"}";
			response.getWriter().write(str);
		} catch (Exception e) {
			response.setContentType("text/html;charset=utf-8");
			String str = "{\"status\":\"fail\",\"message\":\"保存失败!\"}";
			try {
				response.getWriter().write(str);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "manage/deleteLoans", method = RequestMethod.POST)
	public void deleteLoans(HttpServletRequest request, HttpServletResponse response) {
		try {
			String[] id = request.getParameter("ids").split(",");
			for (int i = 0; i < id.length; i++) {
				loanRepository.delete(Integer.parseInt(id[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "manage/refund", method = RequestMethod.GET)
	public String refund(ModelMap modelMap) {
		List<LoanEntity> loanList = loanRepository.getBySuccess();
		modelMap.addAttribute("loanList", loanList);
		return "manage/refund";
	}

	@RequestMapping(value = "manage/refund/{id}", method = RequestMethod.GET)
	public String refundById(@PathVariable("id") Integer id) {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		loanRepository.updateSuccess(1, date + "学生领取,已发放", id);
		loanRepository.flush();
		return "redirect:/manage/refund";
	}
}
