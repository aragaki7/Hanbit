package com.hb.controller.dept;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

@WebServlet("/dept/hang.teaEdit")
public class HangTeaEdit extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//행정부 -> 강사 -> 반 수정 누를때 쓰는거
		String id = req.getParameter("id");
		String gang = req.getParameter("gang");
		
		UserDao dao = new UserDao();
		
		//강의장만 바꾸는거
		int result = dao.editGang(id, gang);
		
		if(result>0){
			req.getRequestDispatcher("/dept/hang.do").forward(req, resp);
		}
	}
}
