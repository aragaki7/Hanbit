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

		public class DeptAdmin extends HttpServlet{
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			UserDao dao = new UserDao();
			
			ArrayList<UserData> genlist = dao.Userlist("일반");
			ArrayList<UserData> stulist = dao.Userlist("학생");
			ArrayList<UserData> applist = dao.Userlist("신청자");
			ArrayList<UserData> edulist = dao.Userlist("교육부");
			ArrayList<UserData> salelist = dao.Userlist("영업부");
			ArrayList<UserData> adlist = dao.Userlist("행정부");
			
			//일반 리스트=일반+신청자 합침.
			//따로 두자니 탭도 길어지고, 구분이 비슷하기도 하고
			//안하자니 pm==신청자는 볼수가 없음
			for (int i = 0; i < applist.size(); i++) {
				genlist.add(applist.get(i));
			}
			//관리자는 그냥 자기 개인정보 수정 눌러서 바꾸길
			request.setAttribute("genlist", genlist);
			request.setAttribute("stulist", stulist);
			request.setAttribute("edulist", edulist);
			request.setAttribute("salelist", salelist);
			request.setAttribute("adlist", adlist);
			
			request.getRequestDispatcher("/dept/admin.jsp").forward(request, response);
		}
}
