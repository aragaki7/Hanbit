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
     
@WebServlet("/customer/boardDetail.do")
public class BoardDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index = request.getParameter("index");

		BoardDao dao = new BoardDao();
		BoardData bean = dao.selectOne(index);
		
		request.setAttribute("boardDto", bean);
		request.getRequestDispatcher("/customer/boardDetail.jsp").forward(request, response);
	}
	
}
