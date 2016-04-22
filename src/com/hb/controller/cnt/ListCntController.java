package com.hb.controller.cnt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.jws.soap.InitParam;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListCntController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/student/list.jsp").forward(request, response);
		
	}
}
