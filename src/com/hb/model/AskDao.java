package com.hb.model;

import java.sql.*;
import java.util.ArrayList;

import bean.AskData;
import bean.BoardData;
import bean.NoticeData;

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
   } catch (Exception e) {
      e.getStackTrace();
   } finally {
         try {
            if (rs != null) rs.close();
            if (pstmt != null)   pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   return list;
   }

   public AskData selectOne(String idx) {
		AskData bean = new AskData();
		sql = "SELECT TB_USER.name, title, days,content FROM TB_INQ  join TB_USER on TB_INQ.id_fk = TB_USER.id where idx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();    
			if (rs.next()) {
				bean.setName(rs.getString(1));
				bean.setTitle(rs.getString(2));
				bean.setDate(rs.getDate(3));
				bean.setContent(rs.getString(4)); 
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
   
   public AskData selectOne2(String idx) {
		AskData bean = new AskData();
		sql = "SELECT title,content FROM TB_INQ  join TB_USER on TB_INQ.id_fk = TB_USER.id where idx=?";
		try {
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

public int EditOne(String title, String content, String idx) {
	 int result = 0;
     String sql = "UPDATE TB_INQ SET TITLE=?, CONTENT=? WHERE IDX=?";
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
}

