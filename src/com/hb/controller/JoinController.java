package com.hb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import bean.UserData;


//@WebServlet("/login/join.do")//xml로 옮김 일단 남겨둠
public class JoinController extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result=0;
		req.setCharacterEncoding("utf-8");
		//emailchk는 회원가입에 필요없어서 일단 안받음(여기로 req타고 오긴 함)
		String id = req.getParameter("id");
		String pw = req.getParameter("password1");
		String name = req.getParameter("name");
		String numpower="1";
		
		String sex = req.getParameter("sex");
		
		if("male".equals(sex))
			sex="남자";
		else if("female".equals(sex))
			sex="여자";
		String phone = req.getParameter("phone1");
		phone += "-"+req.getParameter("phone2");
		phone += "-"+req.getParameter("phone3");
		
		
		String mobile = req.getParameter("mobile1");
		mobile += "-"+req.getParameter("mobile2");
		mobile += "-"+req.getParameter("mobile3");
		
		String email=req.getParameter("email")+"@"+req.getParameter("domain");
		int post = Integer.parseInt(req.getParameter("post"));
		
		String main_address=req.getParameter("main_address");
		String sub_address=req.getParameter("sub_address");
		
		UserData bean = new UserData(id, name, Integer.toString(post), main_address, sub_address, sex, phone, mobile, email, "1");
		UserDao dao = new UserDao();
		result = dao.Join(bean,pw, numpower);
		
		
		if(result>0){
			System.out.println("가입 성공");
			resp.sendRedirect("/Hanbit/main.jsp?joinresult=success");
		}
		else{
			req.setAttribute("joinresult", "fail");
			req.getRequestDispatcher("login.do").forward(req, resp);
		}
		
		
	}

}
