package com.hb.controller.dept;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserData;

import com.hb.model.UserDao;

@WebServlet("/dept/salseappl.do")
public class DeptSalesAppl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		System.out.println("id넘어옴"+id);
		
		UserDao dao = new UserDao();
		
		UserData bean = dao.selectOne(id);
		
		req.setAttribute("userDto", bean);
		req.getRequestDispatcher("/dept/applyDetail.jsp").forward(req, resp);
	}
}
