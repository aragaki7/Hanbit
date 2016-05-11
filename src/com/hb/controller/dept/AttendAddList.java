package com.hb.controller.dept;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.UserDao;

// @WebServlet("/dept/attendaddlist.do")
public class AttendAddList extends HttpServlet {
	private Date tempDate;
	private SimpleDateFormat dateFormat;
	Calendar cal= Calendar.getInstance();
	private Date tempDate2;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		boolean switchBtn = true;
		String day = "" ;
		String date = req.getParameter("attenddate");
		String[] idArr = req.getParameterValues("id");
		String[] checkArr = req.getParameterValues("attend");
		UserDao attinsert = new UserDao();
		System.out.println("date:"+date);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date nDate = null;
		try {
			nDate = dateFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.setTime(nDate);
		int dayNum = cal.get(Calendar.DAY_OF_WEEK);
		
		switch(dayNum){
        case 1:
            day = "일";
            break ;
        case 2:
            day = "월";
            break ;
        case 3:
            day = "화";
            break ;
        case 4:
            day = "수";
            break ;
        case 5:
            day = "목";
            break ;
        case 6:
            day = "금";
            break ;
        case 7:
            day = "토";
            break ;
        }
		System.out.println(day);
		
		String id;
		int check;
		int result = 0;
		int attOver = 0;
		boolean flag = false;
		
		for(int i = 0; i < idArr.length; i++){
			id = idArr[i];
			attOver = attinsert.attOverlap(id, date);
			if(attOver==0){
				for (int j = 0; j < idArr.length; j++) {
					id = idArr[j];
					check = Integer.parseInt(checkArr[j]);
					result += attinsert.attendInsert(id, check, date);
					flag = true;
				}
			}
		}
		
		if("일".equals(day)||"토".equals(day)){
			switchBtn=false;
			resp.sendRedirect("../dept/attendadd.do?week="+switchBtn);
		}else if(flag){
			resp.sendRedirect("../dept/gangsa.do");
		} else if(flag==false) {
			resp.sendRedirect("../dept/attendadd.do?flag="+flag);
		} 
	}
}
