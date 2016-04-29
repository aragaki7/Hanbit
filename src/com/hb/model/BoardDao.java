package com.hb.model;

import java.sql.*;
import java.util.ArrayList;

import bean.BoardData;

import db.DBConnect;
public class BoardDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDao() {
		conn = DBConnect.get();
	}

	public ArrayList<BoardData> BoardList() {
		ArrayList<BoardData> list=new ArrayList<BoardData>();
		String sql="select index, TB_USER.name, title, days, time, count from TB_BBS join TB_USER on TB_BBS.id_fk = TB_USER.id order by index desc";
	try {
		pstmt = DBConnect.get().prepareStatement(sql);
		rs = pstmt.executeQuery();
		list.clear();
		while (rs.next()) {
			list.add(new BoardData(rs.getInt("index"), rs.getString("TB_USER.name"), rs.getString("title"),
					rs.getDate("days"), rs.getTimestamp("time"), rs.getInt("count")));
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
}   

