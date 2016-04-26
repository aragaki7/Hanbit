package com.hb.controller.cnt;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.GreadeData;
import db.DBConnect;

public class ListCntController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PreparedStatement statement = null;  
		ResultSet rs = null;
		String sql;
		
		ArrayList<GreadeData> list = new ArrayList<GreadeData>();
		
		try {
			sql = "select id, java, web, fw from TB_GRADE order by id desc";
			statement = DBConnect.get().prepareStatement(sql);
			rs = statement.executeQuery();
			list.clear();
			while (rs.next()) {
				list.add(new GreadeData(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
				try {
					if(rs!=null)rs.close();
					if(statement!=null)statement.close();
				} catch (SQLException e) {e.printStackTrace();}
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/student/GradeList.jsp").forward(request, response);
	}
}
