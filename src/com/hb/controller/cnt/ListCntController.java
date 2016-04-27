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

import com.hb.model.GradeDao;

import bean.GreadeData;
import db.DBConnect;

public class ListCntController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GradeDao dao = new GradeDao();
		ArrayList<GreadeData> list = dao.gradeList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/student/GradeList.jsp").forward(request, response);
	}
}
