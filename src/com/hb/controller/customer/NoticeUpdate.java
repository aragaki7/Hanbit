package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.NoticeDao;
     
@WebServlet("/customer/noticeupdate.do")
public class NoticeUpdate extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String idx= request.getParameter("idx");
			String title= request.getParameter("title");
			String content= request.getParameter("content");
			
			NoticeDao dao = new NoticeDao();
		    int result = dao.EditOne(idx, title, content);
		    if(result >0){
				response.sendRedirect("notice.do");
			}else{
				request.getRequestDispatcher("/customer/noticeEdit.do").forward(request, response);			
			}
		
		
	}
	
}
