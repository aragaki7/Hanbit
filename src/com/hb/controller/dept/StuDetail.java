package com.hb.controller.dept;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import bean.UserData;

// @WebServlet("/dept/studetail.do")
public class StuDetail extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String id = req.getParameter("id");
		UserDao dao = new UserDao();
		ArrayList<UserData> stuDetailList = dao.stuDetailList(id);
		req.setAttribute("stuDetailList", stuDetailList);
		req.getRequestDispatcher("/dept/stuDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
