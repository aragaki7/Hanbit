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
public class LoginToServlet extends HttpServlet {

	private PreparedStatement pstmt;
	private ResultSet rs;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		System.out.println("id : " + id + "  pw : " + pw);

		JSONObject jsonObject = new JSONObject();
		String query = "select TB_USER.id, TB_USER.name, TB_PM.pm from TB_USER join TB_PM on TB_USER.pm_fk = TB_PM.num where id = ? and password=password(?)";
		System.out.println(query);
		// PrintWriter out = resp.getWriter();
		try {
			pstmt = DBConnect.get().prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("아이디 비번 맞음");
				System.out.println("id : " + rs.getString("id"));

				jsonObject.put("id", rs.getString("TB_USER.id"));
				jsonObject.put("name", rs.getString("TB_USER.name"));
				jsonObject.put("result", "success");
				jsonObject.put("pm", rs.getString("TB_PM.pm"));// 권한 설정. 학생 or강사


			} else {
				System.out.println("아이디 & 비번 매칭되는거 없음");
				jsonObject.put("result", "fail");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
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
