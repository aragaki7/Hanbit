package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.AskDao;
import bean.AskData;
import net.sf.json.JSONObject;

public class CustomerAsk extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      AskDao dao = new AskDao();
      JSONObject jobj = (JSONObject) request.getSession().getAttribute("jsonObj");
      

      if(jobj.isEmpty() || jobj.isNullObject()){
//    	  request.getRequestDispatcher("/customer/ask.jsp").forward(request, response);
    	  response.sendRedirect("/customer/ask.jsp");
      }
      //현재 로긴된 아이디를 받아옴
      String id = jobj.getString("id");
      //권한 받아옴
      String pm = jobj.getString("pm");
      
      ArrayList<AskData> list = null;
      if("관리자".equals(pm)){//관리자면 모든 리스트를 담음
    	  list = dao.AskList();
      }else{//관리자가 아니면 id랑 매칭 되는 리스트만 받음
    	  list = dao.AskList(id);
      }
      request.setAttribute("list", list);
      request.getRequestDispatcher("/customer/ask.jsp").forward(request, response);
   }
   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   doGet(req, resp);
	}
}