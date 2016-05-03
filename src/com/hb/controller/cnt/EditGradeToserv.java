package com.hb.controller.cnt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.GreadeData;

import com.hb.model.UserDao;


@WebServlet("/detp/egradeser.do")
public class EditGradeToserv extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//성적 테이블에서 학생 누르면 디테일로 가는 서블릿
		String id = request.getParameter("id");
		UserDao dao = new UserDao();
		//일단 성적 정보가 있는지 조회.
		//있으면 그거 끌어다 쓰고 없으면 insert
		GreadeData bean = dao.getGradeinfo(id);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
