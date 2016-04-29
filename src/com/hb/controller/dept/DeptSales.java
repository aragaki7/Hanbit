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

	public class DeptSales extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			UserDao dao = new UserDao();
			int pm = 7;
			int class_pk = 1;
			ArrayList<UserData> list = dao.selectList(pm, class_pk);
//			System.out.println(list);
			request.setAttribute("userList", list);
			request.getRequestDispatcher("/dept/sales.jsp").forward(request, response);
		}
	}
