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
     
@WebServlet("/customer/boarddel.do") 
public class BoardDel extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("index"));
		int result = new BoardDao().deleteOne(index);
		request.setAttribute("result", result);
		
		if(result>0) response.sendRedirect("board.jsp");
		else response.sendRedirect("/Hanbit/customer/boardDetail.do?index="+index);		
	}
}
