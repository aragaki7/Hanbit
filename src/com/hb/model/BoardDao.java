package com.hb.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import bean.BoardData;
import bean.UserData;

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

	public int addOne(String id, String title, String contents) {
	      int result = 0;
	      String sql = "insert into TB_BBS (TB_BBS.index, id_fk, title, content, days, time, count) values(0, ?,?,?,?,?,?)";
	      
	      Calendar calendar = Calendar.getInstance();
	      java.util.Date now = calendar.getTime();
	      java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
	      try {
	         pstmt = DBConnect.get().prepareStatement(sql);

	         pstmt.setString(1, id);
	         pstmt.setString(2, title);
	         pstmt.setString(3, contents); 
	         pstmt.setDate(4, new java.sql.Date(System.currentTimeMillis()));
	         pstmt.setTimestamp(5, currentTimestamp);
	         pstmt.setInt(6, 0);
	         System.out.println(sql);
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (pstmt != null)
	               pstmt.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      System.out.println(result);
	      return result;
	   }

	public int deleteOne(int index) {
		int result = 0;
		String sql = "delete from TB_BBS where TB_BBS.index=?";
		System.out.println(sql);
		try { 
			pstmt = DBConnect.get().prepareStatement(sql);
			pstmt.setInt(1, index);
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}   

