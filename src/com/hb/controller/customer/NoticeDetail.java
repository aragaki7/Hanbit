package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.NoticeDao;
import com.hb.model.UserDao;

import bean.NoticeData;
import bean.UserData;
   
@WebServlet("/customer/noticedetail.do")
public class NoticeDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
//		System.out.println("id넘어옴"+id);
		
		NoticeDao dao = new NoticeDao();
		
	    NoticeData bean = dao.selectOne(id);
		
		request.setAttribute("noticeDto", bean);
		request.getRequestDispatcher("/customer/noticeDetail.jsp").forward(request, response);
	}
	
}
