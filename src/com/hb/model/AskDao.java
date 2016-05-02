package com.hb.model;

import java.sql.*;
import java.util.ArrayList;

import bean.AskData;

import db.DBConnect;

public class AskDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public AskDao() {
		conn = DBConnect.get();
	}

	public ArrayList<AskData> AskList() {
		ArrayList<AskData> list=new ArrayList<AskData>();
		sql="select TB_INQ.idx, TB_USER.name, title, days, time from TB_INQ join TB_USER on TB_INQ.id_fk = TB_USER.id order by TB_INQ.idx desc";
	try {
		pstmt = DBConnect.get().prepareStatement(sql);
		rs = pstmt.executeQuery();
		list.clear();
		while (rs.next()) {
			list.add(new AskData(rs.getInt("idx"), rs.getString("TB_USER.name"), rs.getString("title"),
					rs.getDate("days"), rs.getTimestamp("time")));
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
/*
	public AskData selectOne(String index) {
		AskData bean = new AskData();
		sql = "select TB_USER.name, title, content, days, time from TB_INQ join TB_USER on TB_INQ.id_fk = TB_USER.id where TB_INQ.idx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, index);
			rs = pstmt.executeQuery();
			if (rs.next()) {  
				bean.setName(rs.getString(1));
				bean.setTitle(rs.getString(2));
				bean.setContent(rs.getString(3));
				bean.setDate(rs.getDate(4));
				bean.setTime(rs.getTimestamp(5));
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
	}*/
}   

