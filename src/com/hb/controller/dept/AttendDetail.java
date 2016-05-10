package com.hb.controller.dept;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AttData;
import bean.UserData;
import com.hb.model.UserDao;

@WebServlet("/dept/attenddetail.do")
public class AttendDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String attDateSub = req.getParameter("attDate").substring(0,6);
		
		UserDao dao = new UserDao();
//		ArrayList<UserData> list = dao.attendDetail(id,attDateSub);
//		System.out.println(list);
		ArrayList<AttData> list = dao.attendInfo(id, attDateSub);
		
//		System.out.println(list);
		req.setAttribute("attendDetailList", list);
		
		req.getRequestDispatcher("/dept/stuedit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)	throws ServletException, IOException {
		doGet(req,resp);
	}
}
