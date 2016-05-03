package com.hb.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import net.sf.json.JSONObject;
import bean.GreadeData;
import bean.UserData;
import bean.UserDataPw;
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
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email,  TB_CLASS.class_room from TB_USER join TB_CLASS on class_fk = class_pk where pm_fk = ? order by name desc";
			
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

	public int Join(UserData bean, String pw, String numpower) {
		int result = 0;
		
		String query = "insert into TB_USER(id, password, name, post, main_address, sub_address, sex, phone, mobile, email, pm_fk, class_fk) values(?,password(?),?,?,?,?,?,?,?,?,?,1)";//1은 강의실. 강의실 없음을 의미
		System.out.println(query);
		try {
			
			
			pstmt = DBConnect.get().prepareStatement(query);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, pw);
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getPost());
			pstmt.setString(5, bean.getMain_address());
			pstmt.setString(6, bean.getSub_address());
			pstmt.setString(7, bean.getSex());
			pstmt.setString(8, bean.getPhone());
			pstmt.setString(9, bean.getMobile());
			pstmt.setString(10, bean.getEmail());
			pstmt.setString(11, numpower);
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

	public int EditMember(UserDataPw bean, String pw) {
		int result = 0;
		
		String query = "update TB_USER set password=password(?), name=?, post=?, main_address=?, sub_address=?, phone=?, mobile=?, email=?, pm_fk=?, class_fk=? where id=?";
		try {
			
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPost());
			pstmt.setString(4, bean.getMain_address());
			pstmt.setString(5, bean.getSub_address());
			pstmt.setString(6, bean.getPhone());
			pstmt.setString(7, bean.getMobile());
			pstmt.setString(8, bean.getEmail());
			pstmt.setString(9, bean.getPw());
			pstmt.setString(10, bean.getClasss());
			pstmt.setString(11, bean.getId());
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

	public ArrayList<UserData> selectList(int pm, int class_pk) {
		ArrayList<UserData> list = new ArrayList<UserData>();
		try {
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email,  TB_CLASS.class_room from TB_USER join TB_CLASS on class_fk = class_pk where pm_fk = ? and class_pk=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm);
			pstmt.setInt(2, class_pk);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new UserData(rs.getString(1), rs.getString(2), 
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
		return list;
	}

	public int editPM(int i, String id) {
		int result = 0;
		
		String query = "update TB_USER set pm_fk=? where id=?";
		try {
			pstmt = DBConnect.get().prepareStatement(query);
			pstmt.setInt(1, i);
			pstmt.setString(2, id);
			
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

	public ArrayList<UserData> attendAdd() {
		ArrayList<UserData> attendlist = new ArrayList<UserData>();
	
		sql = "select id, name, TB_CLASS.class_room from TB_USER join TB_CLASS on class_fk = class_pk where pm_fk = 2 and not TB_CLASS.class_room = '없음' order by name";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				UserData bean = new UserData();
				bean.setId(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setClasss(rs.getString(3));
				attendlist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
				try {
					if(rs != null)rs.close();
					if(pstmt != null)pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return attendlist; 
	}

	public int attendInsert(String id, int check, String date) {
		int result = 0;
		
		String sql = "INSERT INTO TB_ATTEN (id, att, days) VALUES (?,?,?)";
			try {
				pstmt = DBConnect.get().prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, check);
				pstmt.setString(3, date);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
					try {
						if(pstmt !=null)pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return result;
	}

	public ArrayList<UserData> Userlist(String pm, String class_fk) {
		ArrayList<UserData> list = new ArrayList<UserData>();
		if("있음".equals(class_fk)){
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email,  TB_CLASS.class_room"
				+" from TB_USER join TB_CLASS on class_fk = class_pk "
				+" where pm_fk = (select num from TB_PM where pm = ?) and class_fk in (select class_pk from TB_CLASS where class_room not in ('없음'))"
				+" order by name desc";
		}else{//입력된 강의장이 있음이 아니면( ex. 없음 or 1강의장 or 2강의장...)
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email,  TB_CLASS.class_room"
					+" from TB_USER join TB_CLASS on class_fk = class_pk "
					+" where pm_fk = (select num from TB_PM where pm = ?) and class_fk = (select class_pk from TB_CLASS where class_room = ?)"
					+" order by name desc";
		}
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pm);
			if(!("있음".equals(class_fk)))
				pstmt.setString(2, class_fk);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new UserData(rs.getString(1), rs.getString(2), 
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
		return list;
	}

	public ArrayList<UserData> Userlist(String pm) {//만약 그냥 직원이라고 들어오면 다른 결과값으로 
		ArrayList<UserData> list = new ArrayList<UserData>();
		if(pm.equals("직원")){
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email,  TB_CLASS.class_room"
					+" from TB_USER join TB_CLASS on class_fk = class_pk"
					+" where pm_fk in (select num from TB_PM where pm in ('영업부','행정부','교육부','관리자'))"
					+" order by name desc";
		}else{
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email,  TB_CLASS.class_room"
					+" from TB_USER join TB_CLASS on class_fk = class_pk"
					+" where pm_fk = (select num from TB_PM where pm = ?)"
					+" order by name desc";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			if(!pm.equals("직원"))//입력값이 직원이 아니면 pm셋팅
				pstmt.setString(1, pm);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new UserData(rs.getString(1), rs.getString(2), 
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
		return list;
	}

	public UserDataPw selectOnepw(String id) {
		UserDataPw bean = new UserDataPw();
		
		try {
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email, TB_PM.pm, TB_CLASS.class_room"
					+" from TB_USER join TB_CLASS on class_fk = class_pk join TB_PM on pm_fk= TB_PM.num"+
					" where id=?";
			
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
				bean.setPw(rs.getString(10));
				bean.setClasss(rs.getString(11));
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

	/**
	 * 강의장 바꾸는 메소드
	 * @int
	 */
	public int editGang(String id, String gang) {
		int result=0;
		sql="update TB_USER set class_fk =? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gang);
			pstmt.setString(2, id);
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

//	public int EditMember(UserData bean, String pw, String sub) {//안써서 폐기 예정. 일단 주석
//		int result = 0;
//		String query = "update TB_USER set password=password(?), name=?, post=?, main_address=?, sub_address=?, phone=?, mobile=?, email=?, pm_fk=?, class_fk=? where id=?";
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, pw);
//			pstmt.setString(2, bean.getName());
//			pstmt.setInt(3, Integer.parseInt(bean.getPost()));
//			pstmt.setString(4, bean.getMain_address());
//			pstmt.setString(5, bean.getSub_address());
//			pstmt.setString(6, bean.getPhone());
//			pstmt.setString(7, bean.getMobile());
//			pstmt.setString(8, bean.getEmail());
//			pstmt.setString(9, sub);
//			pstmt.setString(10, bean.getId());
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstmt != null) pstmt.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return result;
//	}

	/**
	 * 
	 * @param pm데이터
	 * SELECT NUM FROM TB_PM WHERE PM=?
	 * @String
	 */
	public String getPmNum(String sub) {
		String pw="";
		sql = "select num from TB_PM where pm=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sub);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pw=rs.getString(1);
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
		return pw;
	}

	/**
	 * 
	 * @param id
	 * SELECT PM_FK FROM TB_USER WHERE ID=?
	 * @String
	 */
	public String getPmfk(String id) {
		String pmNum="";
		sql = "select pm_fk from TB_USER where id=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pmNum=rs.getString(1);
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
		return pmNum;
	}

	/**
	 * @param ID
	 * SELECT PM_FK FROM TB_USER WHERE ID=?
	 * @String
	 */
	public String getClassfk(String id) {
		String clFk="";
		sql = "select class_fk from TB_USER where id=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				clFk=rs.getString(1);
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
		return clFk;
	}
	
	
	/**
	 * 수강 신청시 신청자로 변경
	 * @param id
	 * @param mobile
	 * @param email
	 * @return int
	 */
	public int editAppl(String id, String mobile, String email) {
		int result = 0;
		
		String query = "update TB_USER set mobile=?, email=?, pm_fk=7, class_fk=1 where id=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, mobile);
			pstmt.setString(2, email);
			pstmt.setString(3, id);
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
	
	public ArrayList<UserData> daySearch(String dateSearch) {
		ArrayList<UserData> list = new ArrayList<UserData>();
		sql = "select a.name, a.mobile, b.class_room, c.att, c.days "+ 
				"from TB_USER a, TB_CLASS b, TB_ATTEN c, TB_ATTEN_INFO d "+
				"where a.class_fk = b.class_pk and "+
				"c.att = d.att_num and "+ 
				"a.id = c.id and c.days = ? and not b.class_room= '없음' order by a.name";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dateSearch);
			rs = pstmt.executeQuery();
			while(rs.next()){
				UserData bean = new UserData();
				bean.setName(rs.getNString(1));
				bean.setMobile(rs.getString(2));
				bean.setClasss(rs.getString(3));
				bean.setAtt(rs.getInt(4));
				bean.setAttDate(rs.getString(5));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
				try {
					if (rs != null)rs.close();
					if(pstmt != null)pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
	}


	public GreadeData getGradeinfo(String id) {
		GreadeData bean = new GreadeData();
		//일단 성적 정보가 있는지 조회.
		//있으면 그거 끌어다 쓰고 없으면 insert
		int result = 0;
		try {
			sql = "select count(*) from TB_GRADE where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			if(result==0){
				sql = "insert into TB_GRADE (id, java, web, fw, comment) VALUES (?, 0, 0, 0, \"\");";
			}else{
				
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
}
