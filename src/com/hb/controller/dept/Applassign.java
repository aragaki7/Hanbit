package com.hb.controller.dept;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

@WebServlet("/dept/stuassign.do")
public class Applassign extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//행정부 -> 신청자 -> 배정 누를때 쓰는거
		String id = req.getParameter("id");
		String gang = req.getParameter("gang");
		
		UserDao dao = new UserDao();
		
		int r1=0;
		int r2=0;
		int exist = dao.isExgrade(id);
		if(!("1".equals(gang))){//강의실 배정or수정 시
			if(exist==0)//학점 정보가 없음. 해당 id로 grade테이블에 학점 튜플 삽입
				r1 = dao.addDefGrade(id);
		}else{//강의실 없음으로 바꿀시
			if(exist>0)//강의실을 없음으로 바꿀때 grade 정보가 있으면 해당 튜플 삭제
				r2 = dao.delGrade(id);
		}
		//강의장만 바꾸는거
		int result = dao.editGang(id, gang);
		
		if(result>0){
			req.getRequestDispatcher("/dept/hang.do").forward(req, resp);
		}
	}
}
