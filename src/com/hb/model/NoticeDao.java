package com.hb.model;

import java.sql.*;
import java.util.ArrayList;

import bean.BoardData;
import bean.GreadeData;
import bean.NoticeData;
import bean.UserData;
import db.DBConnect;
public class NoticeDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public NoticeDao() {
		conn = DBConnect.get();
	}

	public ArrayList<NoticeData> NoticeList() {
		ArrayList<NoticeData> list=new ArrayList<NoticeData>();
		String sql="select idx, TB_USER.name, title, days, times, count from TB_NOTICE join TB_USER on TB_NOTICE.id_fk = TB_USER.id order by idx desc";
	try {
		pstmt = DBConnect.get().prepareStatement(sql);
		rs = pstmt.executeQuery();
		list.clear();
		while (rs.next()) {
			list.add(new NoticeData(rs.getInt("idx"), rs.getString("TB_USER.name"), rs.getString("title"),
					rs.getDate("days"), rs.getTimestamp("times"), rs.getInt("count")));
		}
	} catch (Exception e) {} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null)	pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	return list;
	}
	
	public NoticeData selectOne(String idx) {
		NoticeData bean = new NoticeData();
		
		try {
			sql = "SELECT TB_USER.name, title, content, days, count FROM TB_NOTICE join TB_USER on TB_NOTICE.id_fk = TB_USER.id where IDX=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();  
			if (rs.next()) {
				bean.setName(rs.getString(1));
				bean.setTitle(rs.getString(2));
				bean.setContent(rs.getString(3));
				bean.setData(rs.getDate(4));
				bean.setCount(rs.getInt(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {  
			 	try {
					if (rs != null)rs.close();
					if(pstmt != null)pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return bean;
	}

	public NoticeData SelectEdit(String id) {
		NoticeData bean = new NoticeData();
		
		try {
			sql = "select title, content from TB_NOTICE join TB_USER on TB_NOTICE.id_fk = TB_USER.id where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();  
			if (rs.next()) {
				bean.setTitle(rs.getString(1));
				bean.setContent(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {  
			 	try {
					if (rs != null)rs.close();
					if(pstmt != null)pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return bean;
	}
}   