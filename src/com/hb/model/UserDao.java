package com.hb.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import net.sf.json.JSONObject;
import bean.UserData;
import net.sf.json.JSONObject;//json쓸때 필요한거. 지우지 말아주세요
import db.DBConnect;

public class UserDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public UserDao() {
		conn = DBConnect.get();
	}

	public ArrayList<UserData> Userlist(int pm) {

		ArrayList<UserData> stulist = new ArrayList<UserData>();
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

	public boolean chkIdVali(String id) {
		boolean result = false;
		
		String query = "select count(*) from TB_USER where id = ?";
		System.out.println(query);
		try {
			pstmt = DBConnect.get().prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("count(*)");
				if(cnt==1){
					result=false;
				}
				else{
					result=true;
				}
				System.out.println("result : "+result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {e.printStackTrace();}
		}//finally 끝
		
		return result;
	}

	public int Join(UserData bean, String pw, int numpower) {
		int result = 0;
		
		String query = "insert into TB_USER(id, password, name, post, main_address, sub_address, sex, phone, mobile, email, pm_fk, class_fk) values(?,password(?),?,?,?,?,?,?,?,?,?,1)";//1은 강의실. 강의실 없음을 의미
		System.out.println(query);
		try {
			
			
			pstmt = DBConnect.get().prepareStatement(query);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, pw);
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, Integer.parseInt(bean.getPost()));
			pstmt.setString(5, bean.getMain_address());
			pstmt.setString(6, bean.getSub_address());
			pstmt.setString(7, bean.getSex());
			pstmt.setString(8, bean.getPhone());
			pstmt.setString(9, bean.getMobile());
			pstmt.setString(10, bean.getEmail());
			pstmt.setInt(11, numpower);
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

	public JSONObject loginJson(String id, String pw) {
		JSONObject jsonObject = new JSONObject();
		String query = "select TB_USER.id, TB_USER.name, TB_PM.pm from TB_USER join TB_PM on TB_USER.pm_fk = TB_PM.num where id = ? and password=password(?)";
		// System.out.println(query);
		// PrintWriter out = resp.getWriter();
		try {
			pstmt = DBConnect.get().prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// System.out.println("아이디 비번 맞음");
				// System.out.println("id : " + rs.getString("id"));

				jsonObject.put("id", rs.getString("TB_USER.id"));
				jsonObject.put("name", rs.getString("TB_USER.name"));
				jsonObject.put("result", "success");
				jsonObject.put("pm", rs.getString("TB_PM.pm"));// 권한 설정. 학생 or강사

			} else {
				// System.out.println("아이디 & 비번 매칭되는거 없음");
				jsonObject.put("result", "fail");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jsonObject;
	}

	public UserData selectOne(String id) {
		UserData bean = new UserData();
		
		try {
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email from TB_USER where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setId(rs.getString(1));
				bean.setName(rs.getNString(2));
				bean.setPost(rs.getString(3));
				bean.setMain_address(rs.getString(4));
				bean.setSub_address(rs.getString(5));
				bean.setSex(rs.getString(6));
				bean.setPhone(rs.getString(7));
				bean.setMobile(rs.getString(8));
				bean.setEmail(rs.getString(9));
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

	public int EditMember(UserData bean, String pw, int numpower) {
		int result = 0;
		
		String query = "update TB_USER set password=password(?), name=?, post=?, main_address=?, sub_address=?, phone=?, mobile=?, email=?, pm_fk=?, class_fk=1 where id=?";//1은 강의실. 강의실 없음을 의미
		System.out.println(query);
		try {
			
			
			pstmt = DBConnect.get().prepareStatement(query);
			
			System.out.println("password : "+pw);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, Integer.parseInt(bean.getPost()));
			pstmt.setString(4, bean.getMain_address());
			pstmt.setString(5, bean.getSub_address());
			pstmt.setString(6, bean.getPhone());
			pstmt.setString(7, bean.getMobile());
			pstmt.setString(8, bean.getEmail());
			pstmt.setInt(9, numpower);
			pstmt.setString(10, bean.getId());
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
