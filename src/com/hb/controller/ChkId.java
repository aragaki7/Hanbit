package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import db.DBConnect;

@WebServlet("/chkid.do")//이거 xml로 하면 안됨 ㅜㅜ 누가 구해줘
public class ChkId extends HttpServlet{
	private PreparedStatement pstmt;
	private ResultSet rs;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("실행");
		String id = req.getParameter("id");
		boolean result =false;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		
		UserDao dao = new UserDao();
		result = dao.chkIdVali(id);
		
		out.print(result);
		out.close();
	}//dopost 끝
}
