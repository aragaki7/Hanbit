package com.hb.controller.cnt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.GradeDao;

public class UpdateGradeController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		int java = Integer.parseInt(req.getParameter("java"));
		int web = Integer.parseInt(req.getParameter("web"));
		int fw = Integer.parseInt(req.getParameter("fw"));
		
		
		int result = 0;
		GradeDao dao = new GradeDao();
		result = dao.updateGrade(id,java,web,fw);
		
		if(result>0){
			System.out.println("입력 성공");
			req.setAttribute("result", true);
			req.getRequestDispatcher("/student/list.do").forward(req, resp);
		}else{
			System.out.println("입력 실패");
			req.setAttribute("result", false);
			req.getRequestDispatcher("/student/list.do").forward(req, resp);
		}
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("잘못된 접근");
	}
}
