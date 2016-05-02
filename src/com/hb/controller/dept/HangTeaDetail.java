package com.hb.controller.dept;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import bean.UserDataPw;


@WebServlet("/dept/hang.teaDetail")
public class HangTeaDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//행정에서 강사 테이블 눌렀을때 디테일페이지 보여줌
		String id = req.getParameter("id");
		UserDao dao = new UserDao();
		UserDataPw bean = dao.selectOnepw(id);
//		System.out.println(bean.toString());
		
		req.setAttribute("userDto", bean);
		req.getRequestDispatcher("/dept/hangTeaDetail.jsp").forward(req, resp);
	}
}
