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

import bean.BoardComm;
import bean.BoardData; 
import bean.UserData;
     
//@WebServlet("/customer/boardDetail.do")
public class BoardDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index = request.getParameter("index");
 
		BoardDao dao = new BoardDao();
		BoardData bean = dao.selectOne(index);
		ArrayList<BoardComm> bean1 = dao.selectComm(index);
		
//		System.out.println("서블릿 에서");
//		for (int i = 0; i < bean1.size(); i++) {
//			BoardComm tmp = new BoardComm();
//			tmp = bean1.get(i);
//			System.out.println(i+" "+tmp.toString());
//		}
		
		
		request.setAttribute("boardDto", bean);//글 내용 관련
		request.setAttribute("boardCommDto", bean1);//글 코멘트 관련
		request.getRequestDispatcher("/customer/boardDetail.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
