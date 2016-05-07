package com.hb.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.BoardDao;

@WebServlet("/customer/boardcoadd.do")
public class BoardCoAdd extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");//글쓴이 id
		int idx = Integer.parseInt(req.getParameter("idx_fk")) ;//댓글 쓴 글번호
		String content = req.getParameter("comment");
		
		BoardDao dao = new BoardDao();
		int result = dao.addCoOne(id,idx,content);
		//쿼리 결과에 따른 출력은 일단 똑같이 출력
		req.getRequestDispatcher("/customer/boardDetail.do?index="+idx).forward(req, resp);
	}
}
