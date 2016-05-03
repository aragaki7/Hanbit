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

import bean.UserData;
      
@WebServlet("/customer/askdel.do") 
public class AskDel extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int result = new AskDao().deleteOne(idx);
		request.setAttribute("result", result);
		
		if(result>0) response.sendRedirect("ask.do");
		else response.sendRedirect("/Hanbit/customer/askdetail.do?idx="+idx);		
	}
}
