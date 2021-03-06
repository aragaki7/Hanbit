package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.NoticeDao;

import bean.NoticeData;
     
@WebServlet("/customer/noticeEdit.do")
public class NoticeEdit extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx= request.getParameter("idx");
		
		NoticeDao dao = new NoticeDao();
		NoticeData bean = dao.SelectEdit(idx);
		    
		request.setAttribute("noticeDto", bean);
		request.getRequestDispatcher("/customer/NoticeEdit.jsp").forward(request, response);
	}
}
