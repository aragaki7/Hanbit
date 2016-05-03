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
     
@WebServlet("/customer/boardinsert.do")
public class BoardInsert extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String contents =request.getParameter("contents");
	
		BoardDao dao = new BoardDao();
		
		int result = dao.addOne(id, title, contents);
		if(result >0){
			response.sendRedirect("board.do");
		}else{
			request.getRequestDispatcher("/customer/boardAdd.jsp").forward(request, response);			
		}
	}
}
