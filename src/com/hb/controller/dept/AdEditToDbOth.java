package com.hb.controller.dept;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import bean.UserData;
import bean.UserDataPw;

@WebServlet("/dept/adEdit.oth")
public class AdEditToDbOth extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int result=0;
		req.setCharacterEncoding("utf-8");
		//emailchk는 회원가입에 필요없어서 일단 안받음(여기로 req타고 오긴 함)
		String id = req.getParameter("id");
		String pw = req.getParameter("password1");
		String name = req.getParameter("name");
		String sub = req.getParameter("sub");
		
		
//		String sex = req.getParameter("sex");
		
//		if("male".equals(sex))
//			sex="남자";
//		else if("female".equals(sex))
//			sex="여자";
		String phone = req.getParameter("phone1");
		phone += "-"+req.getParameter("phone2");
		phone += "-"+req.getParameter("phone3");
		
		
		String mobile = req.getParameter("mobile1");
		mobile += "-"+req.getParameter("mobile2");
		mobile += "-"+req.getParameter("mobile3");
		
		String email=req.getParameter("email")+"@"+req.getParameter("domain");
		String post = req.getParameter("post");
		
		String main_address=req.getParameter("main_address");
		String sub_address=req.getParameter("sub_address");

		UserDao dao = new UserDao();
		
		String subs = dao.getPmNum(sub);//쿼리문 몰라서 쿼리 2번 날림
		UserDataPw bean = new UserDataPw(id, name, post, main_address, sub_address, null, phone, mobile, email, subs,"1");
		result = dao.EditMember(bean,pw);
		
		if(result>0){
			resp.sendRedirect("/Hanbit/dept/admin.do");
		}
		else{
			req.setAttribute("joinresult", "fail");
			System.out.println("수정 실패");
		}
	}
}
