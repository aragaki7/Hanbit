package com.hb.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import db.DBConnect;


@WebServlet("/login/join.do")
public class JoinController extends HttpServlet {
	
	private PreparedStatement pstmt;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("접근됨");
		int result=0;
		req.setCharacterEncoding("utf-8");
		//emailchk는 회원가입에 필요없어서 일단 안받음(여기로 req타고 오긴 함)
		String id = req.getParameter("id");
		String pw = req.getParameter("password1");
		String name = req.getParameter("name");
		String power = req.getParameter("power");
		int numpower=1;
		System.out.println("권한 : "+power);
		if("student".equals(power))
			numpower=1;
		else if("profe".equals(power))
			numpower=2;
		
		String sex = req.getParameter("sex");
		
		if("male".equals(sex))
			sex="남자";
		else if("female".equals(sex))
			sex="여자";
		String phone = req.getParameter("phone1");
		phone += "-"+req.getParameter("phone2");
		phone += "-"+req.getParameter("phone3");
		
		System.out.println(phone);
		
		String mobile = req.getParameter("mobile1");
		mobile += "-"+req.getParameter("mobile2");
		mobile += "-"+req.getParameter("mobile3");
		
		System.out.println(mobile);
		
		String email=req.getParameter("email")+"@"+req.getParameter("domain");
		int post = Integer.parseInt(req.getParameter("post"));
		
		String main_address=req.getParameter("main_address");
		System.out.println("메인주소 : "+req.getParameter("main_address"));
		
		
		String sub_address=req.getParameter("sub_address");
		System.out.println("서브주소 : "+req.getParameter("sub_address"));
		
		
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
			pstmt.setString(8, phone);
			pstmt.setString(9, mobile);
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
		if(result>0){
			System.out.println("가입 성공");
//			req.setAttribute("joinresult", "success");
//			req.getRequestDispatcher("/main.do").forward(req, resp);
			resp.sendRedirect("/Hanbit/main.jsp?joinresult=success");
		}
		else{
			req.setAttribute("joinresult", "fail");
			req.getRequestDispatcher("login.do").forward(req, resp);
		}
		
		
	}

}
