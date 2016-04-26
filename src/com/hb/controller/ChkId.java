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

@WebServlet("/chkid.do")//기억하고 있다가 바꿀께요
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
		
		String query = "select count(*) from TB_USER where id = ?";
		System.out.println(query);
		try {
			pstmt = DBConnect.get().prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("count(*)");
				if(cnt==1){
					result=false;
				}
				else{
					result=true;
				}
				System.out.println("result : "+result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {e.printStackTrace();}
		}//finally 끝
		
		out.print(result);
		out.close();
	}//dopost 끝
}
