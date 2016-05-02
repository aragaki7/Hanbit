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
		String index = request.getParameter("index");
		int result = new BoardDao().deleteOne(index);

		if(result ==1) {
			request.getRequestDispatcher("/board.jsp").forward(request, response);			
		}
		else{			
			request.getRequestDispatcher("/boardDetail.jsp?index"+index).forward(request, response);			
		}
	}
}
