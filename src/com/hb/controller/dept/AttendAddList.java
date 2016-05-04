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
		
		UserDao attinsert = new UserDao();

		String id;
		int check;
		int result = 0;
		int attOver = 0;
		boolean flag = false;
		
		for(int i = 0; i < idArr.length; i++){
			id = idArr[i];
			attOver = attinsert.attOverlap(id, date);
//			System.out.println(attOver);
			if(attOver==0){
				for (int j = 0; j < idArr.length; j++) {
					id = idArr[j];
					check = Integer.parseInt(checkArr[j]);
					result += attinsert.attendInsert(id, check, date);
					flag = true;
				}
			}
		}
			
		if(flag){
			resp.sendRedirect("../dept/gangsa.do");
		} else {
			resp.sendRedirect("../dept/attendadd.do?flag="+flag);
		}
		
	}
}
