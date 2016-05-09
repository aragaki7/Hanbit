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
		//관리자(admin)가 각 유저 정보 디테일 가는 페이지
		String id = req.getParameter("id");
		UserDao dao = new UserDao();
		UserDataPw bean = dao.selectOnepw(id);
		
		req.setAttribute("userDto", bean);
		req.getRequestDispatcher("adminEdit.jsp").forward(req, resp);
	}
}
