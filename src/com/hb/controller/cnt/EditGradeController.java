package com.hb.controller.cnt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.GreadeData;

/**
 * Servlet implementation class EditGradeController
 */
@WebServlet("/gangsa/EditGrade.do")
public class EditGradeController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//전체 리스트중 한명을 눌러서 점수 입력폼으로 보내는 클래스 
		String id = request.getParameter("id");
		int java = Integer.parseInt(request.getParameter("java"));
		int web = Integer.parseInt(request.getParameter("web"));
		int fw = Integer.parseInt(request.getParameter("fw"));
		String comm = request.getParameter("comm");
		
		GreadeData gd = new GreadeData(id, java, web, fw, comm);
		
		request.setAttribute("gradeDto", gd);
		request.getRequestDispatcher("/gangsa/EditGrade.jsp").forward(request, response);
	}

}
