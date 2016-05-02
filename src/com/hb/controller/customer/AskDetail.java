package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.AskDao;
import com.hb.model.NoticeDao;
import com.hb.model.UserDao;

import bean.AskData;
import bean.NoticeData;
import bean.UserData;
     
//@WebServlet("/customer/askdetail.do")
public class AskDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		AskDao dao = new AskDao();
		
	    AskData bean = dao.selectOne(idx);
		
		request.setAttribute("askDto", bean);
		request.getRequestDispatcher("/customer/askDetail.jsp").forward(request, response);
	}
	
}
