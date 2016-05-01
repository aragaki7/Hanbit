package com.hb.controller.dept;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import bean.UserDataPw;


@WebServlet("/dept/hang.applDetail")
public class ApplDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		UserDao dao = new UserDao();
		UserDataPw bean = dao.selectOnepw(id);
//		System.out.println(bean.toString());
		
		req.setAttribute("userDto", bean);
		req.getRequestDispatcher("/dept/applyClassDetail.jsp").forward(req, resp);
	}
}
