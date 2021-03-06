package com.hb.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import bean.NoticeData;
import db.DBConnect;
public class NoticeDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	int count=0;
	
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
				bean.setCount(count=rs.getInt(5));
			}
			pstmt.executeUpdate("update TB_NOTICE set count="+(count+1)+" where idx="+idx);
			System.out.println("update TB_NOTICE set count="+(count+1)+" where idx="+idx);
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

	public NoticeData SelectEdit(String idx) {
		NoticeData bean = new NoticeData();
		
		try {
			sql = "select title, content from TB_NOTICE join TB_USER on TB_NOTICE.id_fk = TB_USER.id where idx=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
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

	public int addOne(String name, String title, String contents) {
		  int result = 0;
	      String sql = "insert into TB_NOTICE (idx, id_fk, title, content, days, times, count) values(0, ?,?,?,?,?,?)";
	      Calendar calendar = Calendar.getInstance();
	      java.util.Date now = calendar.getTime();
	      java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
	      try {
	         pstmt = DBConnect.get().prepareStatement(sql);

	         pstmt.setString(1, name);
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

	public int deleteOne(int idx) {
		int result = 0;
		String sql = "delete from TB_NOTICE where idx=?";
		System.out.println(sql);
		try { 
			pstmt = DBConnect.get().prepareStatement(sql);
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int EditOne(String title, String content, String idx) {
	       int result = 0;
	         String sql = "UPDATE TB_NOTICE SET TITLE=?, CONTENT=? WHERE IDX=?";
	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, title);
	            pstmt.setString(2, content); 
	            pstmt.setString(3, idx); 
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
	         return result;
	      }

	public ArrayList<NoticeData> GetSearchList(String search, String keyword) {
		ArrayList<NoticeData> bean = new ArrayList<NoticeData>();
	   /*
	    select idx, TB_USER.name, title, days, times, count from TB_NOTICE join TB_USER 
 		on TB_NOTICE.id_fk = TB_USER.id WHERE TITLE LIKE '%admin%' order by idx desc  
	    */
		try{
            String sql =" select idx, TB_USER.name, title, days, times, count from TB_NOTICE "+
            			"join TB_USER on TB_NOTICE.id_fk = TB_USER.id "; //조건넣어서 정렬하기전 sql문장
            if(search != null | !search.equals("") ){ //input값이 빈칸이아닐때
                sql +=" WHERE "+keyword.trim()+" LIKE '%"+search.trim()+"%' order by idx desc";
            }else{//모든 게시글 검색
                sql +=" order by idx desc";
            }
            System.out.println("sql = " + sql);
            pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
           
            while(rs.next()){
            	NoticeData tmp = new NoticeData();
            	tmp.setNum(rs.getInt(1));
            	tmp.setName(rs.getString(2));
            	tmp.setTitle(rs.getString(3));
            	tmp.setData(rs.getDate(4));
            	tmp.setTime(rs.getTimestamp(5));
            	tmp.setCount(rs.getInt(6));
            	bean.add(tmp);
            }
        }catch(Exception e){ }finally{          
            try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }      
        return bean;
	}
	
}   