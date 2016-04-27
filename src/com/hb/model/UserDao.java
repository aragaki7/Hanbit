package com.hb.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import bean.UserData;

import db.DBConnect;

public class UserDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public UserDao() {
	}

	public ArrayList<UserData> Userlist(int pm) {

		ArrayList<UserData> stulist = new ArrayList<UserData>();
		conn = DBConnect.get();
		try {
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email,  TB_CLASS.class_room from TB_USER join TB_CLASS on class_fk = class_pk where pm_fk = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				stulist.add(new UserData(rs.getString(1), rs.getString(2), 
						rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), 
						rs.getString(9), rs.getString(10)));
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
		return stulist;
	}
}
