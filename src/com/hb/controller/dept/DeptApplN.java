package com.hb.controller.dept;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import bean.UserData;

public class DeptApplN extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		UserDao dao = new UserDao();
		
		int result = dao.editPM(1,id);
		
		if(result>0){
			int pm = 7;
			int class_pk = 1;
			ArrayList<UserData> list = dao.selectList(pm, class_pk);
			req.setAttribute("userList", list);
			req.getRequestDispatcher("/dept/sales.jsp?result=n").forward(req, resp);
			}
		
	}
}
