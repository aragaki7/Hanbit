package com.hb.controller.dept;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

// @WebServlet("/dept/attendaddlist.do")
public class AttendAddList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String date = req.getParameter("attenddate");
		String[] idArr = req.getParameterValues("id");
		String[] checkArr = req.getParameterValues("attend");
		
		String id;
		int check;
		int result = 0;
		UserDao attinsert = new UserDao();
		for (int i = 0; i < idArr.length; i++) {
			id = idArr[i];
			check = Integer.parseInt(checkArr[i]);
			result += attinsert.attendInsert(id, check, date);
		}
		
		if(result>0){
			resp.sendRedirect("../dept/gangsa.do");
		}
		
	}
}
