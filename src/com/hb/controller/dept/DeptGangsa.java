package com.hb.controller.dept;

	import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.GradeDao;
import com.hb.model.UserDao;

import bean.GreadeData;
import bean.UserData;

	public class DeptGangsa extends HttpServlet{
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			UserDao dao1 = new UserDao();
			ArrayList<UserData> stulist = dao1.Userlist(2);
			request.setAttribute("stulist", stulist);
			
			GradeDao dao = new GradeDao();
			ArrayList<GreadeData> list = dao.gradeList();

			request.setAttribute("list", list);
			request.getRequestDispatcher("/dept/gangsa.jsp").forward(request, response);
		}
}
