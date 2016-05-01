package com.hb.controller.dept;

	import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserData;

import com.hb.model.UserDao;

	public class DeptHang extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			UserDao dao = new UserDao();
			
			//행정에서 처리하는 신청자는 pm==7이 아님. 오버로딩해서 쓴거임
			//강의장은 없음,있음,1강의장,2강의장...
			ArrayList<UserData> applist = dao.Userlist("학생","없음");//신청자.pm==2(학생) & class=1(강의실 없음)
			ArrayList<UserData> stulist = dao.Userlist("학생","있음");//학생. pm==2(학생) & class!=1(강의실 있음)
			ArrayList<UserData> tealist = dao.Userlist("교육부");//강사. pm==5(교육부)
			ArrayList<UserData> genlist = dao.Userlist("일반","없음");//일반. pm==1(일반) & class==1(강의실 없음)
			ArrayList<UserData> staflist = dao.Userlist("직원");//직원. pm==(3,4,5,6)
			
			//입력된거 테스트
//			System.out.println("신청자");
//			for (int i = 0; i < applist.size(); i++) {
//				System.out.println(applist.get(i).toString());
//			}
//			System.out.println("학생");
//			for (int i = 0; i < stulist.size(); i++) {
//				System.out.println(stulist.get(i).toString());
//			}
//			System.out.println("강사");
//			for (int i = 0; i < tealist.size(); i++) {
//				System.out.println(tealist.get(i).toString());
//			}
//			System.out.println("일반");
//			for (int i = 0; i < genlist.size(); i++) {
//				System.out.println(genlist.get(i).toString());
//			}
//			System.out.println("직원");
//			for (int i = 0; i < staflist.size(); i++) {
//				System.out.println(staflist.get(i).toString());
//			}
			
			
			
			request.setAttribute("applist", applist);
			request.setAttribute("stulist", stulist);
			request.setAttribute("tealist", tealist);
			request.setAttribute("genlist", genlist);
			request.setAttribute("staflist", staflist);
			

			
			request.getRequestDispatcher("/dept/hang.jsp").forward(request, response);
		}
	}

