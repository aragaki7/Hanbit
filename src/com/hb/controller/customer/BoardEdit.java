package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardData;

import com.hb.model.BoardDao;

     
@WebServlet("/customer/boardedit.do")
public class BoardEdit extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index= request.getParameter("index");
		
		BoardDao dao = new BoardDao();
		BoardData bean = dao.SelectEdit(index);
		    
		request.setAttribute("boardDto", bean);
		request.getRequestDispatcher("/customer/BoardEdit.jsp").forward(request, response);
	}
}
