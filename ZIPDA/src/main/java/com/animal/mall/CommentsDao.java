package com.animal.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommentsDao {
	InitialContext ic = null;
	DataSource ds = null;
	Connection conn = null;
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// singleton
	private static CommentsDao dao = new CommentsDao();

	private CommentsDao() {
	}

	public static CommentsDao getInstance() {
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

	// 댓글 저장
	public int insertComment(Comments dto) {
		try {
			conn = getConnection();
			sql = "insert into comments(itemNo, userId, content) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getItemNo());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getContent());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return 0;
	}

	public List<Comments> selectCommentAll(int ItemNo) {
		List<Comments> comments = new ArrayList<Comments>();
		try {
			conn = getConnection();
			sql = "select * from comments where itemNo = ? order by comNo desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ItemNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comments comment = new Comments(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
						(String) rs.getString(5));
				comments.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return comments;
	}

	public Comments selectComment(int comNo) {
		Comments comment = null;
		try {
			conn = getConnection();
			sql = "select * from comments where comNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comNo);
			rs = pstmt.executeQuery();
			if (rs.next() != false) {
				comment = new Comments(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
						(String) rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return comment;
	}
	
	public List<Comments> selectMyCommentAll(String userId) {
		List<Comments> mycomment = new ArrayList<Comments>();
		try {
			conn = getConnection();
			sql = "select comNo, itemName, content, regdate, c.itemNo from items as i inner join comments as c on i.itemNo=c.itemNo where c.userId= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comments comment = new Comments(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5) );
				mycomment.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return mycomment;
	}

	// 게시글 번호에 해당하는 게시글 삭제
	public int deleteComment(Integer comNo) {
		try {
			conn = getConnection();
			sql = "delete from Comments where comNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return 0;
	}
}