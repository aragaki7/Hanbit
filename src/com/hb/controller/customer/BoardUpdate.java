package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.BoardDao;
     
@WebServlet("/customer/boardupdate.do")
public class BoardUpdate extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String index= request.getParameter("index");
			String title= request.getParameter("title");
			String content= request.getParameter("content");
			BoardDao dao = new BoardDao();
			
		    int result = dao.EditOne(title, content, index);
		    System.out.println("result : "+result);
		    if(result >0){
				response.sendRedirect("board.do");
			}else{
				request.getRequestDispatcher("/customer/boardedit.do").forward(request, response);			
			}
		
		
	}
	
}
