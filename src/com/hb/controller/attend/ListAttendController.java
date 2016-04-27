package com.hb.controller.attend;

	import java.io.IOException;

	import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	@WebServlet("/attend/list.do")
	public class ListAttendController extends HttpServlet{
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.getRequestDispatcher("/attend/list.jsp").forward(request, response);
		}
	}


