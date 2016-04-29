package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import net.sf.json.JSONObject;

//@WebServlet("/login.do")//xml로 옮겼지만 일단 남겨둠
public class LoginToServlet extends HttpServlet {

	private PreparedStatement pstmt;
	private ResultSet rs;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");


		// System.out.println("id : " + id + " pw : " + pw);
		
		UserDao dao = new UserDao();
		JSONObject jsonObject = dao.loginJson(id, pw);
		resp.setCharacterEncoding("UTF-8");
		req.getSession().setAttribute("jsonObj", jsonObject);
		// req.getSession().setAttribute("login", true);
		// resp.setContentType("application/x-json; charset=UTF-8");
		// req.getRequestDispatcher("/index.do").forward(req, resp);
		// out.print(jsonObject.getString("name"));
		// out.print(jsonObject);
		// out.close();
		resp.getWriter().print(jsonObject);
	}
}
