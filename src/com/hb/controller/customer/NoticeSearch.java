package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.NoticeData;

import com.hb.model.NoticeDao;

@WebServlet("/customer/noticesearch.do")
public class NoticeSearch extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String search= request.getParameter("search");
		String keyword= request.getParameter("keyword");
		System.out.println(search);
		System.out.println(keyword);
		NoticeDao dao = new NoticeDao(); 
		ArrayList<NoticeData> bean = dao.GetSearchList(search, keyword);
		NoticeData tmp;
		for (int i = 0; i < bean.size(); i++) {
			tmp = bean.get(i);
			System.out.println(tmp.toString());
		}
		request.setAttribute("list", bean);
		request.getRequestDispatcher("/customer/notice.jsp").forward(request, response);
	}
}
