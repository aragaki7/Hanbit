package com.hb.controller.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.BoardDao;
import bean.BoardData;


///customer/board.do 헤깔려서 잠시
public class CustomerBoard extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao dao = new BoardDao();
		
		int pageTotal;//전체 페이지
		String pageNum = request.getParameter("page");//현재 페이지?
		int pStart;//시작 페이지
		int pEnd;//끝나는 페이지
		int pview;//페이지당 출력할 글 갯수
		int fpage;//페이지 시작 숫자
		int lpage;//페이지 마지막 숫자
		int viewPage;//한 페이지에 몇개의 페이지수를 보여줄지
		pview=5;
		
		if(pageNum==null||"".equals(pageNum))
			pageNum="1";
		
		pStart=(Integer.parseInt(pageNum)-1)*pview+1;
		pEnd=pStart+pview-1;
		
		pageTotal = dao.getTotal();
		
		if(pageTotal%pview!=0)
			pageTotal=pageTotal/pview+1;
		else
			pageTotal=pageTotal/pview;
		
		
		viewPage=5;//한 페이지에 몇개의 페이지목록을 보여줄지
//	 	fpage=((Integer.parseInt(pageNum)-1)/viewPage)*viewPage+1;//보여주는 시작 페이지
		fpage=Integer.parseInt(pageNum)-(viewPage/2);
		if(fpage<=0)
			fpage=1;
		lpage=fpage+viewPage-1;//보여주는 마지막 페이지
		if(lpage>pageTotal)
			lpage=pageTotal;
		
		ArrayList<BoardData> list2 = dao.BoardList2(pStart-1, pview);
		
		request.setAttribute("list", list2);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("fpage", fpage);
		request.setAttribute("lpage", lpage);
		request.setAttribute("pageTotal", pageTotal);
		
		request.getRequestDispatcher("/customer/board.jsp").forward(request, response);
	}
}
