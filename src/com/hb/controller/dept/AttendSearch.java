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

@WebServlet("/dept/datesearch.do")
public class AttendSearch extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("검색넘어옴");
		String dateSearch = req.getParameter("dateSearch");
		
		ArrayList<UserData> list = new UserDao().daySearch(dateSearch);
		
		
		req.getRequestDispatcher("/dept/datesearch.jsp").forward(req, resp);
	}

}
