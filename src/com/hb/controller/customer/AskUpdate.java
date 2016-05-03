package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.AskDao;
import com.hb.model.NoticeDao;
     
@WebServlet("/customer/askupdate.do")  
public class AskUpdate extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String idx= request.getParameter("idx");
			String title= request.getParameter("title");
			String content= request.getParameter("content");
			AskDao dao = new AskDao();
		    int result = dao.EditOne(title, content, idx);
		    System.out.println("result : "+result);
		    if(result >0){
				response.sendRedirect("ask.do");
			}else{
				request.getRequestDispatcher("/customer/askedit.do").forward(request, response);			
			}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}
