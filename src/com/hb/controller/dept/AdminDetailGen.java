package com.hb.controller.dept;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserDataPw;

import com.hb.model.UserDao;

@WebServlet("/dept/adGenDt")
public class AdminDetailGen extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//일반, 영업, 행정 디테일로 가는 서블릿
		String id = req.getParameter("id");
		UserDao dao = new UserDao();
		UserDataPw bean = dao.selectOnepw(id);
		
		req.setAttribute("userDto", bean);
		req.getRequestDispatcher("adminEdit.jsp").forward(req, resp);
	}
}
