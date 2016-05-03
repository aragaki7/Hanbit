package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardData;

import com.hb.model.BoardDao;

     
@WebServlet("/customer/boardsearch.do")
public class BoardSearch extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search= request.getParameter("search");
		String keyword= request.getParameter("keyword");
		
		BoardDao dao = new BoardDao();
		/*BoardData bean = dao.SelectEdit(index);
		    
		request.setAttribute("boardDto", bean);
		request.getRequestDispatcher("/customer/board.jsp").forward(request, response);*/
	}
}
