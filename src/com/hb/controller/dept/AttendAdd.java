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

// 출결관리 입력 서블릿 attendAdd.jsp 출결관리를 할 수 있는 입력폼으로 보낸다.
// 테스트중이라 아직 xml 에 등재안함 
// @WebServlet("/dept/attendadd.do")
public class AttendAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		UserDao dao = new UserDao();
		ArrayList<UserData> attendlist = dao.attendAdd();
		req.setAttribute("attendlist", attendlist);
		req.getRequestDispatcher("/dept/attendAdd.jsp").forward(req, resp);
	}

}
