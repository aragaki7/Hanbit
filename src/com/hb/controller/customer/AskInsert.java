package com.hb.controller.customer;
 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.AskDao;
import com.hb.model.NoticeDao;

     
@WebServlet("/customer/askinsert.do")
public class AskInsert extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String contents =request.getParameter("contents");
	
		AskDao dao = new AskDao();
		
		int result = dao.addOne(name, title, contents);
		if(result >0){
			response.sendRedirect("ask.do");
		}else{
			request.getRequestDispatcher("/customer/askAdd.jsp").forward(request, response);			
		}
	}
}
