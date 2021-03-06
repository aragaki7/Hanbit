package com.hb.model;

import java.sql.*;
import java.util.ArrayList;

import bean.GreadeData;

import db.DBConnect;
public class GradeDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public GradeDao() {
		conn = DBConnect.get();
	}

	public ArrayList<GreadeData> gradeList() {
		ArrayList<GreadeData> list=new ArrayList<GreadeData>();
		
		String sql="";
		try {
			sql = "select id, java, web, fw, comment from TB_GRADE order by id desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new GreadeData(rs.getString(1),
						rs.getInt(2),
						rs.getInt(3),
						rs.getInt(4),
						rs.getString(5)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
				} catch (Exception e) {e.printStackTrace();}
		}
		return list;
	}

	public int updateGrade(String id, int java, int web, int fw, String comm) {
		int result = 0;
		
		String sql="update TB_GRADE set java=?, web=?, fw=?, comment=? where id=?";
		try {
			System.out.println(sql);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, java);
			pstmt.setInt(2, web);
			pstmt.setInt(3, fw);
			pstmt.setString(4, comm);
			pstmt.setString(5, id);
			
			result = pstmt.executeUpdate();
			System.out.println("executeUpdate");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
				} catch (Exception e) {e.printStackTrace();}
		}
		
		return result;
	}
}
