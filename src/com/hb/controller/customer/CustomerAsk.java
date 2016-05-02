package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.AskDao;
import bean.AskData;

public class CustomerAsk extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AskDao dao = new AskDao();
		ArrayList<AskData> list = dao.AskList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/customer/ask.jsp").forward(request, response);
	}
}
