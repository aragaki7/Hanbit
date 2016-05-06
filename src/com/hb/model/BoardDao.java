package com.hb.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import bean.BoardComm;
import bean.BoardData;

import db.DBConnect;

public class BoardDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	int count = 0;
	
	public BoardDao() {
		conn = DBConnect.get();
	}

	public ArrayList<BoardData> BoardList() {
		ArrayList<BoardData> list = new ArrayList<BoardData>();
		String sql = "select TB_BBS.index, TB_USER.name, title, days, time, count from TB_BBS join TB_USER on TB_BBS.id_fk = TB_USER.id order by TB_BBS.index desc";
		try {
			pstmt = DBConnect.get().prepareStatement(sql);
			rs = pstmt.executeQuery();
			list.clear();
			while (rs.next()) {
				list.add(new BoardData(rs.getInt("index"), rs.getString("TB_USER.name"), rs.getString("title"),
						rs.getDate("days"), rs.getTimestamp("time"), rs.getInt("count")));
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
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
				bean.setCount(count = rs.getInt(6));
			}
			pstmt.executeUpdate("update TB_BBS set count="+(count+1)+" where TB_BBS.index="+index);
			System.out.println("update TB_BBS set count="+(count+1)+" where TB_BBS.index="+index);
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
	      String sql = "insert into TB_BBS (TB_BBS.index, id_fk, title, content, days, time, count) values(0, ?,?,?,?,?,?)";
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
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}


	public BoardData SelectEdit(String index) {
		BoardData bean = new BoardData();
		sql = "select title, content from TB_BBS join TB_USER on TB_BBS.id_fk = TB_USER.id where TB_BBS.index=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, index);
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

	public int EditOne(String title, String content, String index) {
		int result = 0;
        String sql = "UPDATE TB_BBS SET TITLE=?, CONTENT=? WHERE TB_BBS.INDEX=?";
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, title);
           pstmt.setString(2, content); 
           pstmt.setString(3, index); 
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

	public ArrayList<BoardData> GetSearchList(String search, String keyword) {
		ArrayList<BoardData> bean = new ArrayList<BoardData>();
	    /* 검색 
	    sql > select TB_BBS.index, TB_USER.name, title, days, time, count from TB_BBS 
	    	join TB_USER on TB_BBS.id_fk = TB_USER.id 
	    	
	    	> WHERE TITLE LIKE '%김주형%'
			order by TB_BBS.index desc  
		*/ 
        try{
            String sql ="select TB_BBS.index, TB_USER.name, title, days, time, count from TB_BBS "+
            			"join TB_USER on TB_BBS.id_fk = TB_USER.id"; //조건넣어서 정렬하기전 sql문장
            if(search != null | !search.equals("") ){ //input값이 빈칸이아닐때
                sql +=" WHERE "+keyword.trim()+" LIKE '%"+search.trim()+"%' order by TB_BBS.index desc";
            }else{//모든 게시글 검색
                sql +=" order by TB_BBS.index desc";
            }
            System.out.println("sql = " + sql);
            pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
           
            while(rs.next()){
            	BoardData tmp = new BoardData();
            	tmp.setNum(rs.getInt(1));
            	tmp.setName(rs.getString(2));
            	tmp.setTitle(rs.getString(3));
            	tmp.setDate(rs.getDate(4));
            	tmp.setTime(rs.getTimestamp(5));
            	tmp.setCount(count = rs.getInt(6));
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

	
	
	
//	this.num = num;
//	this.name = name;
//	this.title = title;
//	content
//	this.date = date;
//	this.time = time;
//	this.count = count;
	
	
	public ArrayList<BoardData> BoardList2(int pStart, int pEnd) {
		ArrayList<BoardData> list = new ArrayList<BoardData>();
		String sql = "SELECT @RN:=@RN+1 AS ROWNUM, TB.* FROM(SELECT `index`, id_fk, title, content, days, `time`, count FROM TB_BBS) AS TB, (SELECT @RN:=0) AS R order by `index` desc Limit "+pStart+", "+pEnd;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				System.out.println(++count);
				list.add(new BoardData(rs.getInt(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDate(6),rs.getTimestamp(7), rs.getInt(8)));
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (stmt != null)stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int getTotal() {
		int result = 0;
		sql = "select count(*) from TB_BBS";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();  
			if (rs.next()) {
				result = rs.getInt(1);
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
		return result;
	}

	public ArrayList<BoardComm> selectComm(String index) {
		ArrayList<BoardComm> comList = new ArrayList<BoardComm>();
		
		String sql = "SELECT idx, id_fk, content, days, `time` FROM TB_BBS_COM where bbs_idx_fk=? order by `time`";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(index));
			System.out.println("idx : "+Integer.parseInt(index));
			rs = pstmt.executeQuery();
			System.out.println("dao에서");
			while (rs.next()) {
				BoardComm tmp = new BoardComm();
				
				tmp.setNum(rs.getInt("idx"));
				tmp.setIdx_fk(rs.getInt("id_fk"));
				tmp.setContent(rs.getString("content"));
				tmp.setDate(rs.getDate("days"));
				tmp.setTime(rs.getTimestamp("time"));
				System.out.println(tmp.toString());
				comList.add(tmp);
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return comList;
	}
	
}   

