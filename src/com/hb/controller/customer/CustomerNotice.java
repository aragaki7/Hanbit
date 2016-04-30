package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.NoticeDao;

import bean.NoticeData;
   
public class CustomerNotice extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NoticeDao dao = new NoticeDao();
		ArrayList<NoticeData> list = dao.NoticeList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/customer/notice.jsp").forward(request, response);
	}
}
