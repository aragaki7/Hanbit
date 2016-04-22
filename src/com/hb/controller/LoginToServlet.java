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


import db.DBConnect;
import net.sf.json.JSONObject;

//xml에서 자꾸 오류나서 임시로 씀
@WebServlet("/login.do")
public class LoginToServlet extends HttpServlet{

	private PreparedStatement pstmt;
	private ResultSet rs;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		System.out.println("id : "+id+"  pw : "+pw);
//		req.setCharacterEncoding("application/x-json; charset=UTF-8");
		JSONObject jsonObject = new JSONObject();
		String query = "select id, name from TB_STU where id = ? and password=password(?)";
		System.out.println(query);
		PrintWriter out = resp.getWriter();
		try {
			pstmt = DBConnect.get().prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("아이디 비번 맞음");
				System.out.println("id : "+rs.getString("id"));
				System.out.println("name : "+rs.getString("name"));
				
				jsonObject.put("id", rs.getString("id"));
				jsonObject.put("name", rs.getString("name"));
				jsonObject.put("result", "success");
			}else{
				System.out.println("아이디 & 비번 매칭되는거 없음");
				jsonObject.put("result", "fail");
			}
		} catch (SQLException e) {e.printStackTrace();}
		finally{
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
				} catch (SQLException e) {e.printStackTrace();}
		}
//		req.getSession().setAttribute("login", true);
		
		req.getSession().setAttribute("jsonObj",jsonObject);
		
//		resp.setContentType("application/x-json; charset=UTF-8");
//		req.getRequestDispatcher("/index.do").forward(req, resp);
		
//	    out.print(jsonObject.getString("name"));
	    out.print(jsonObject);
//	    out.close();
	}
}
