package com.animal.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MembersDao {
	InitialContext ic = null;
	DataSource ds = null;
	Connection conn = null;
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// singleton
	private static MembersDao dao = new MembersDao();

	private MembersDao() {
	}

	public static MembersDao getInstance() {
		return dao;
	}

	public Connection getConnection() {
		try {
			ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return conn;
	}

	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 연결 닫기
	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

// 로그인 기능
	public Members login(String userId, String userPwd) {
		Members member = null;
		try {
			conn = getConnection();
			sql = "select * from members where userId=? and userPwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			
			rs = pstmt.executeQuery();
			
			
//			System.out.println("conn "+conn.toString());  중요 확인절차!!
//			System.out.println("pstmt "+pstmt.toString());
//			System.out.println("rs "+rs.toString());
//			System.out.println("DAO1 :"+userId);
			if(rs.next() == true) {
				member = new Members(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return member;
	}

	// 회원가입
	public int insertMember(Members dto) {
		int count=0;
		try {
			conn = getConnection();
			sql = "insert into members(userId, userPwd, userName, birthday, address, phoneNo, email) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getBirthday());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getPhoneNo());
			pstmt.setString(7, dto.getEmail());
			
			
			count =  pstmt.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(conn, pstmt);
		}
		return count;
	}

	// 멤버수정
	public int updateMember(Members dto) {
		int count=0;
		try {
			conn = getConnection();
			sql = "update members set userId = ?," + "userPwd = ?," + "userName = ?," + "birthday = ?," + "address = ?," + "PhoneNo = ?,"
					+ "email = ?" + "where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getBirthday());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getPhoneNo());
			pstmt.setString(7, dto.getEmail());
			pstmt.setString(8, dto.getUserId());
			System.out.println(pstmt.executeUpdate());
			
			count =  pstmt.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(conn, pstmt);
		}
		return count;
	}

	// 회원탈퇴
	public int deleteMember(String userId) {
		int count=0;
		try {
			conn = getConnection();
			sql = "delete from members where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			count =  pstmt.executeUpdate();
			
			return count;
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(conn, pstmt);
		}
		return count;
	}

	// 모든 멤버 조회
	public ArrayList<Members> selectMemberAll() {
		ArrayList<Members> MemberDTO = new ArrayList<Members>();
		try {
			conn = getConnection();
			sql = "select * from Members";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Members memberdto = new Members(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				MemberDTO.add(memberdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return MemberDTO;
	}

	// 특정 멤버 조회
	public Members selectMember(String userId) {
		Members a = null;
		try {
			conn = getConnection();
			sql = "select * from Members where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				a = new Members(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return a;
	}

}
