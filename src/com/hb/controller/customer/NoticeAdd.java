package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.BoardDao;
import com.hb.model.UserDao;

import bean.BoardData; 
import bean.UserData;
     
@WebServlet("/customer/noticeadd.do")
public class NoticeAdd extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/customer/noticeAdd.jsp").forward(request, response);
	}
}
