package com.hb.controller.dept;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

@WebServlet("/dept/studedit.do")
public class AttendUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String attDate = request.getParameter("attDate");
		int attNum = Integer.parseInt(request.getParameter("attNum"));
		System.out.println(id);
		System.out.println(attDate);
		System.out.println(attNum);
		UserDao dao = new UserDao();
		int result = dao.updateAttNum(id, attDate, attNum);
		
		if(result>0){
			response.sendRedirect("/Hanbit/dept/gangsa.do");
		} else {
			response.sendRedirect("/dept/studedit.do");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
