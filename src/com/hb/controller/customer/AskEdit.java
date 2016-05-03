package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AskData;

import com.hb.model.AskDao;
     
@WebServlet("/customer/askedit.do")
public class AskEdit extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		AskDao dao = new AskDao();
	    AskData bean = dao.selectOne2(idx);
		
		request.setAttribute("askDto", bean);
		request.getRequestDispatcher("/customer/askedit.jsp").forward(request, response);
	}
	
}