package com.animal.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ItemsDAO {
	InitialContext ic = null;
	DataSource ds = null;
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String msg = null;

	// singleton
	private static ItemsDAO dao = new ItemsDAO();

	private ItemsDAO() {
	}

	public static ItemsDAO getInstance() {
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

	// 관리자
	// 상품 등록
	public String insertItem(Items item) {
		conn = getConnection();
		System.out.println(conn + "null?");
		try {
			// 병원~인지 쇼핑몰인지//itemNo 자동증가로 생략, hit defalut 0값 생략
			if (!(item.getCategory().equals("shopping"))) { // 병원~
				sql = "insert into items(itemname, itemprice, category, descript, detail, filename, area, loc, tel, hours) values(?, ?, ?, ?, ?, ?, ?, ?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, item.getItemName());
				pstmt.setInt(2, item.getItemPrice());
				pstmt.setString(3, item.getCategory());
				pstmt.setString(4, item.getDescript());
				pstmt.setString(5, item.getDetail());
				pstmt.setString(6, item.getFileName());
				pstmt.setString(7, item.getArea());
				pstmt.setString(8, item.getLoc());
				pstmt.setString(9, item.getTel());
				pstmt.setString(10, item.getHours());
			} else { // 쇼핑몰
				sql = "insert into items(itemname, itemprice, category, descript, detail, filename) values(?, ?, ?, ?, ?, ?)";
				System.out.println(pstmt);
				
				pstmt = conn.prepareStatement(sql);
				System.out.println("1" + pstmt);
				
				System.out.println("2" + conn);
				
				pstmt.setString(1, item.getItemName());
				pstmt.setInt(2, item.getItemPrice());
				pstmt.setString(3, item.getCategory());
				pstmt.setString(4, item.getDescript());
				pstmt.setString(5, item.getDetail());
				pstmt.setString(6, item.getFileName());
				System.out.println(item.getFileName());
			}

			
			int i = pstmt.executeUpdate();
			if (i > 0) {
				msg = "상품이 등록되었습니다.";
			}
			
			close(conn, pstmt);
		} catch (SQLException e) {

		}
		return msg;

	}

	// 상품 삭제
	public String deleteItem(int itemNo) {
		conn = getConnection();
		try {
			sql = "delete from items where itemno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);

			

			int i = pstmt.executeUpdate();
			if (i > 0) {
				msg = "상품이 삭제되었습니다.";
			}
			close(conn, pstmt);
		} catch (SQLException e) {

		}
		return msg;
	}

	// 상품 수정
	public String updateItem(Items item) {
		conn = getConnection();
		try {

			// 병원~인지 쇼핑몰인지
			if (item.getCategory() != "shopping") { // 병원~
				sql = "update items set itemname = ?, itemprice = ?, category = ?, descript = ?, detail = ?, filename = ?, location = ?, tel = ?, hours = ? where itemno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, item.getItemName());
				pstmt.setInt(2, item.getItemPrice());
				pstmt.setString(3, item.getCategory());
				pstmt.setString(4, item.getDescript());
				pstmt.setString(5, item.getDetail());
				pstmt.setString(6, item.getFileName());
				pstmt.setString(7, item.getArea());
				pstmt.setString(8, item.getLoc());
				pstmt.setString(9, item.getTel());
				pstmt.setString(10, item.getHours());
				pstmt.setInt(11, item.getItemNo());
			} else { // 쇼핑몰
				sql = "update items set itemname = ?, itemprice = ?, category = ?, descript = ?, detail = ?, filename = ? where itemno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, item.getItemName());
				pstmt.setInt(2, item.getItemPrice());
				pstmt.setString(3, item.getCategory());
				pstmt.setString(4, item.getDescript());
				pstmt.setString(5, item.getDetail());
				pstmt.setString(6, item.getFileName());
				pstmt.setInt(7, item.getItemNo());
			}

			

			int i = pstmt.executeUpdate();
			if (i > 0) {
				msg = "상품이 업데이트 되었습니다.";
			}
			
			close(conn, pstmt);
		} catch (SQLException e) {

		}
		return msg;
	}

	// 해당상품 번호로 검색
	public Items selectItem(int itemno) {
		conn = getConnection();
		Items item = new Items();
		try {
			sql = "select * from items where itemno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				item = new Items(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getInt(12));
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
		}
		return item;
	}

	// 사용자
	// 상품 목록
	public ArrayList<Items> selectItemsAll(String category) {
		conn = getConnection();
		ArrayList<Items> it = new ArrayList<Items>();

		try {
			sql = "select * from items where category = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				it.add(new Items(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getInt(12)));
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
		}
		return it;
	}
	
	
	
	public ArrayList<Items> searchItems(String category2, String text) {
	      ArrayList<Items> it = new ArrayList<Items>();
	      
	      // text -> 컨트롤러에서 배열로 정렬된 sql문 입력
	      try {
	    	  conn = getConnection();
	    	  if(!(text.isEmpty())) {
	    		  sql = "select * from items where category = ?" + text;
	    		  System.out.println(text +"2");
	    	  }else {
	    		  sql = "select * from items where category = ?";
//	    		  System.out.println(text +"3");
//	    		 close(conn, pstmt);	
//	    		 return null;
	    	  }
	    	  
	    	  pstmt = conn.prepareStatement(sql);
	    	  pstmt.setString(1, category2);

	    	  rs = pstmt.executeQuery();
	    	  System.out.println("너는 되는거니?222" );
	    	  while (rs.next()) {
					it.add(new Items(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getInt(12)));
			}
				
	    	close(conn, pstmt, rs);	
	      } catch (SQLException e) {
	    	  System.out.println(e);
		}
			return it;
		}
	
		public ArrayList<String> selectArea(String category) {
			ArrayList<String> area = new ArrayList<String>();
			 try {
		    	  conn = getConnection();
		    	  sql = "select distinct area from items where area is not null and category = ?";
		    	  pstmt = conn.prepareStatement(sql);
		    	  pstmt.setString(1, category);
		    	  
		    	  rs = pstmt.executeQuery();
		    	  System.out.println("너는 되는거니?222" );
		    	  
		    	  while (rs.next()) {
						area.add(rs.getString(1));
		    	  }
		    	  
		    	close(conn, pstmt, rs);	
		      } catch (SQLException e) {
		    	  System.out.println(e);
			}	
			return area;
		}
		
		public ArrayList<String> selectDetail(String category) {
			String detail = "";
			 try {
		    	  conn = getConnection();
		    	  sql = "select detail from items where category = ? ";
		    	  pstmt = conn.prepareStatement(sql);
		    	  pstmt.setString(1, category);

		    	  rs = pstmt.executeQuery();
		    	  System.out.println("너는 되는거니?222" );
		    	  while (rs.next()) {
						detail += rs.getString(1);
		    	  }
		    	close(conn, pstmt, rs);	
		      } catch (SQLException e) {
		    	  System.out.println(e);
			}	
			String[] de = detail.split("#");
			ArrayList<String> de1 = new ArrayList<String>();
			for(int i=0;i<de.length;i++) {
				if(!(de[i].equals(""))) {
					de1.add(de[i]);					
				}
			}
			
			TreeSet<String> de2 = new TreeSet<String>(de1);
			ArrayList<String> detailList = new ArrayList<String>(de2);
			
			return detailList;
		}
		
		//삭제리스트 출력
		public ArrayList<Items> deleteselectItemsAll() {
			conn = getConnection();
			ArrayList<Items> it = new ArrayList<Items>();

			try {
				sql = "select * from items";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					it.add(new Items(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getInt(12)));
				}
				close(conn, pstmt, rs);
			} catch (SQLException e) {
			}
			return it;
		}
		
		public int getCategoryListCount(String category, String text) {
			int count = 0;
			conn = getConnection();
			System.out.println("뭐냐"+text+"너는");
			try {
				if(text.equals("")) {
					  sql = "select count(*) from items where category = ?";
		    		  System.out.println(text +"12");
		    	  }else {
		    		  sql = "select count(*) from items where category = ?" + text;
		    		  System.out.println(text +"54");
		    	  }
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				
				rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt(1);
				}
				
				close(conn, pstmt, rs);
			} catch (SQLException e) {
				System.out.println(e);
			}
			return count;
		}
		
		public ArrayList<Items> selectItemsPageList(String category, int page, int limit, String text) {
			
			int totalRecord = getCategoryListCount(category, text);
			System.out.println(totalRecord);
			int start = (page-1) * limit;
			int index = start +1;
			ArrayList<Items> it = new ArrayList<Items>();
			System.out.println();
			try {
				conn = getConnection();
				 if(text.equals("")) {
					  sql = "select * from items where category = ?";
		    		  System.out.println(text +"12");
		    	  }else {
		    		  sql = "select * from items where category = ?" + text;
		    		  System.out.println(text +"54");
		    	  }
				System.out.println("너 위에가 SQL 문");
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();

				while (rs.absolute(index)) {
					System.out.println(rs.getInt(1));
					it.add(new Items(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getInt(12)));
					
					if(index < (start+limit) && index <= totalRecord) {
						index++;
					}else {
						break;
					}
				}
				close(conn, pstmt, rs);
			} catch (SQLException e) {
			}
			return it;
		}
}
