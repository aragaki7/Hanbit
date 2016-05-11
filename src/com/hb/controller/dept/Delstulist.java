package com.hb.controller.dept;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

@WebServlet({ "/Delstulist", "/dept/delstulist.do" })
public class Delstulist extends HttpServlet {
	//여러명 체크해서 한번에 수강 종료 시킴
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] idList = request.getParameterValues("chkId");

		UserDao dao = new UserDao();
		for (String id : idList) {
			int exist = dao.isExgrade(id);
			if (exist >= 0) {// 학점 정보가 있음. 삭제
				dao.delGrade(id);
			}
			// 강의장만 바꾸는거
			dao.editGang(id, "1");// 1(강의실 없음)로 바꿈
		}
		request.getRequestDispatcher("/dept/gangsa.do").forward(request, response);

	}

}
