package com.hb.controller.dept;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.GradeDao;

import bean.GreadeData;

@WebServlet("/dept/editgrade.tea")
public class TEditGrade extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//강사가 해당 id의 학생 점수 수정
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		int java = Integer.parseInt(request.getParameter("java"));
		int web = Integer.parseInt(request.getParameter("web"));
		int fw = Integer.parseInt(request.getParameter("fw"));
		String comm = request.getParameter("comm");
		
		GradeDao dao = new GradeDao();
		int result = dao.updateGrade(id, java, web, fw, comm);
		
		if(result>0){
			request.getRequestDispatcher("/dept/gangsa.do").forward(request, response);
		}
	}

}
