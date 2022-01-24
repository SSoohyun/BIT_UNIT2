package com.animal.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CartDAO {
	InitialContext ic = null;
	DataSource ds = null;
	Connection conn = null;
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String msg = null; // 결과 메시지

	// singleton
	private static CartDAO dao = new CartDAO();
	private CartDAO() {}
	public static CartDAO getInstance() {
		return dao;
	}

	public Connection getConnection() {
		try {
			ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 장바구니에 상품 추가
	public String insertCart(Cart cart) {
		conn = getConnection();
		try {
			if (cart.getQuantity() != 0) { // 쇼핑몰 추가
				sql = "insert into cart values(?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cart.getUserId());
				pstmt.setInt(2, cart.getItemNo());
				pstmt.setInt(3, cart.getQuantity());
			} else {
				sql = "insert into cart(userId, itemNo) values(?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cart.getUserId());
				pstmt.setInt(2, cart.getItemNo());
			}
			
			int i = pstmt.executeUpdate();
			
			close(conn, pstmt);
			
			if (i > 0) {
				msg = "장바구니에 상품이 추가되었습니다.";
			}
		} catch (SQLException e) {
			
		}
		return msg;		
	}

	// 장바구니 상품 수량 변경
	public String updateCart(Cart cart) {
		conn = getConnection();
		try {
			sql = "update cart set quantity = ? where userId = ? and itemNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getQuantity());
			pstmt.setString(2, cart.getUserId());
			pstmt.setInt(3, cart.getItemNo());
			int i = pstmt.executeUpdate();
			
			close(conn, pstmt);
			
			if (i > 0) {
				msg = "상품 수량이 변경되었습니다.";
			}
		} catch (SQLException e) {
			
		}
		return msg;		
	}

	// 장바구니에서 특정 상품 조회
	public int selectCart(String userId, int itemNo) {
		conn = getConnection();
		int i = 0;
		try {
			sql = "select * from cart where userId = ? and itemNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, itemNo);
			rs = pstmt.executeQuery();
			
			if (rs.next() != false) {
				i = 1;
			}
			
			close(conn, pstmt, rs);
		} catch (SQLException e) {
			
		}
		return i;
	}
	
	// 장바구니 전체 목록
	public ArrayList<Cart> selectCartAll(String userId) {
		conn = getConnection();
		ArrayList<Cart> al = new ArrayList<Cart>();

		try {
			sql = "select cart.itemno, filename, items.itemname, itemprice, quantity, itemprice*quantity, category from cart left join items on cart.itemno = items.itemno where userid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				al.add(new Cart(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getString(7)));
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {

		}
		return al;

	}
	
	// 장바구니에서 상품 삭제
	public String deleteCart(String userId, int itemNo){
		conn = getConnection();
		try {
			sql = "delete from cart where userId = ? and itemNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, itemNo);
			int i = pstmt.executeUpdate();
			
			close(conn, pstmt);
			
			if (i > 0) {
				msg = "장바구니에 상품이 삭제되었습니다.";
			}
		} catch (SQLException e) {
			
		}
		return msg;		
	}
	
	// 장바구니에서 상품 전체 삭제
	public String deleteCartAll(String userId){
		conn = getConnection();
		try {
			sql = "delete from cart where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			int i = pstmt.executeUpdate();
			
			close(conn, pstmt);
			
			if (i > 0) {
				msg = "장바구니를 비웠습니다.";
			}
		} catch (SQLException e) {
			
		}
		return msg;
	}
	
	// 결제내역 전체 목록
    public ArrayList<Cart> selectPayAll(String userId) {
       conn = getConnection();
       ArrayList<Cart> al = new ArrayList<Cart>();
       
       try {
          sql = "select payment.payno, filename, items.itemname, quantity, DATE_FORMAT(paydate, '%Y-%m-%d'), itemprice*quantity, state, category from payment left join items on payment.itemno = items.itemno where userid = ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, userId);
          rs = pstmt.executeQuery();
          
          while (rs.next()) {
             al.add(new Cart(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
          }
          close(conn, pstmt, rs);
       } catch (SQLException e) {
          
       }
       return al;      
       
    }
    
    // 장바구니에서 상품 주문 -> 결제 테이블에 추가
    public String insertPayment(Cart cart) {
       conn = getConnection();
       try {
			sql = "insert into payment(userId, itemNo, quantity, state) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getUserId());
			pstmt.setInt(2, cart.getItemNo());
			pstmt.setInt(3, cart.getQuantity());
			pstmt.setString(4, cart.getState());
          int i = pstmt.executeUpdate();
          
          close(conn, pstmt);
          
          if (i > 0) {
             msg = "결제 내역이 추가되었습니다.";
          }
       } catch (SQLException e) {
          
       }
       
       return msg;   
    }
}
