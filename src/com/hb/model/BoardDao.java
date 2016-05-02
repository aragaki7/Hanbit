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
	private String sql;
	
	public BoardDao() {
		conn = DBConnect.get();
	}

	public ArrayList<BoardData> BoardList() {
		ArrayList<BoardData> list=new ArrayList<BoardData>();
		String sql="select TB_BBS.index, TB_USER.name, title, days, time, count from TB_BBS join TB_USER on TB_BBS.id_fk = TB_USER.id order by TB_BBS.index desc";
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

	public BoardData selectOne(String index) {
		BoardData bean = new BoardData();
		sql = "select TB_USER.name, title, content, days, time, count from TB_BBS join TB_USER on TB_BBS.id_fk = TB_USER.id where TB_BBS.index=?";
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
				bean.setCount(rs.getInt(6));
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

	public int addOne(BoardData bean, String title, String contents) {
		int result = 0;
		String sql = "insert into TB_BBS(TB_BBS.index, id_fk, title, content, days, time, count) values (?,?,?,?,curdate(),now(),0)";
		System.out.println(sql);
		try {
			pstmt = DBConnect.get().prepareStatement(sql);
			
			pstmt.setInt(1, bean.getNum()+1);
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, title);
			pstmt.setString(4, contents);
			System.out.println(contents);
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int deleteOne(String index) {
		int result = 0;
		String sql = "delete from TB_BBS where index=?";
		System.out.println(sql);
		try { 
			pstmt = DBConnect.get().prepareStatement(sql);
			
			pstmt.setString(1, index);
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}   

