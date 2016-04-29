
package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.BoardDao;

import bean.BoardData;
   
public class CustomerNotice extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDao dao = new BoardDao();
		ArrayList<BoardData> list = dao.BoardList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/customer/notice.jsp").forward(request, response);
	}
}
