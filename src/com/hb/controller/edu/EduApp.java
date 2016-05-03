package com.hb.controller.edu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

@WebServlet("/edu/edu.appl")
public class EduApp extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String mobile = req.getParameter("tel1");
		mobile += "-"+req.getParameter("tel2");
		mobile += "-"+req.getParameter("tel3");
		
		String email=req.getParameter("em")+"@"+req.getParameter("domain");
		
		UserDao dao = new UserDao();
		int result = dao.editAppl(id, mobile, email);
		
		if(result>0){
			resp.sendRedirect("/Hanbit/main.jsp?appresult=success");
		}
		
	}
}
