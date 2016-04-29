package com.hb.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

import bean.UserData;
import net.sf.json.JSONObject;

//@WebServlet("/useredit.do")
public class EditUser extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원 수정버튼을 누르면 정보를 가지고 회원 수정에 뿌려줌
		System.out.println("유저 정보 수정 ");
		
		JSONObject jobject = (JSONObject) req.getSession().getAttribute("jsonObj");
		
		String id=jobject.getString("id");
		
		UserDao dao = new UserDao();
		UserData bean = dao.selectOne(id);
		
		//잘 받아오는 거 확인함
//		System.out.println("id : "+bean.getId());
//		System.out.println("name : "+bean.getName());
//		System.out.println("post : "+bean.getPost());
//		System.out.println("main_addr : "+bean.getMain_address());
//		System.out.println("sub_addr : "+bean.getSub_address());
//		System.out.println("sex : "+bean.getSex());
//		System.out.println("phone : "+bean.getPhone());
//		System.out.println("mobile : "+bean.getMobile());
//		System.out.println("email : "+bean.getEmail());
		
		req.setAttribute("userdto", bean);
		req.getRequestDispatcher("/login/edituser.jsp").forward(req, resp);
	}

}
