package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.BoardDao;

@WebServlet("/customer/delcomment.do")
public class BoardCoDel extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		int idx = Integer.parseInt(req.getParameter("idx"));
		BoardDao dao = new BoardDao();
		int result = dao.delCommOne(num);
		
		req.getRequestDispatcher("/customer/boardDetail.do?index="+idx).forward(req, resp);
	}
}
