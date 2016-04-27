package com.hb.controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserData;

import com.hb.model.UserDao;

public class ListUserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		UserDao dao = new UserDao();
		ArrayList<UserData> stulist = dao.Userlist(1);
		ArrayList<UserData> tealist = dao.Userlist(2);
		request.setAttribute("stulist", stulist);
		request.setAttribute("tealist", tealist);
		request.getRequestDispatcher("/user/list.jsp").forward(request, response);
	}
}
