package com.hb.controller.dept;

	import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

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
			
			//학생리스트
			UserDao dao1 = new UserDao();
			ArrayList<UserData> stulist = dao1.Userlist("학생","있음");//학생. pm==2(학생) & class!=1(강의실 있음)
			
			//성적리스트
			GradeDao dao = new GradeDao();
			ArrayList<GreadeData> list = dao.gradeList();
			
			//출결리스트
			String dateSearch = request.getParameter("dateSearch");
			ArrayList<UserData> daySearchlist = new UserDao().daySearch(dateSearch);
			
			
			
			request.setAttribute("stulist", stulist); //학생리스트 보냄
			request.setAttribute("dateSearch",daySearchlist); //출결리스트 보냄		
			request.setAttribute("list", list); //성적리스트 보냄
			request.getRequestDispatcher("/dept/gangsa.jsp").forward(request, response);
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			doGet(req, resp);
		}
}
