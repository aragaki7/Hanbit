package com.hb.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnect;


@WebServlet("/login/join.do")
public class JoinController extends HttpServlet {
	
	private PreparedStatement pstmt;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("접근됨");
		int result=0;
		//emailchk는 회원가입에 필요없어서 일단 안받음(여기로 req타고 오긴 함)
		String id = req.getParameter("id");
		String pw = req.getParameter("password1");
		String name = req.getParameter("name");
		String power = req.getParameter("power");
		int numpower=1;
		
		if(power=="student")
			numpower=1;
		else if(power=="profe")
			numpower=2;
		
		String sex = req.getParameter("sex");
		
		String tmpphone = req.getParameter("phone1");
		tmpphone += req.getParameter("phone2");
		tmpphone += req.getParameter("phone3");
		int phone = Integer.parseInt(tmpphone);
		
		String tmpmobile = req.getParameter("mobile1");
		tmpmobile += req.getParameter("mobile2");
		tmpmobile += req.getParameter("mobile3");
		int mobile = Integer.parseInt(tmpmobile);
		
		String email=req.getParameter("email")+"@"+req.getParameter("domain");
		int post = Integer.parseInt(req.getParameter("post"));
		String main_address=req.getParameter("main_address");
		String sub_address=req.getParameter("sub_address");
		
		
		String query = "insert into TB_USER(id, password, name, post, main_address, sub_address, sex, phone, mobile, email, pm_fk, class_fk) values(?,password(?),?,?,?,?,?,?,?,?,?,1)";//1은 강의실. 강의실 없음을 의미
		System.out.println(query);
		try {
			
			
			pstmt = DBConnect.get().prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setInt(4, post);
			pstmt.setString(5, main_address);
			pstmt.setString(6, sub_address);
			pstmt.setString(7, sex);
			pstmt.setInt(8, phone);
			pstmt.setInt(9, mobile);
			pstmt.setString(10, email);
			pstmt.setInt(11, numpower);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}

}
