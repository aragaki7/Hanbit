package com.hb.controller.cnt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditGradeController
 */
@WebServlet("/student/EditGrade.do")
public class EditGradeController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		request.getRequestDispatcher("/student/EditGrade.jsp").forward(request, response);
	}

}
