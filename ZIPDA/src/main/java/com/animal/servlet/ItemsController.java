package com.animal.servlet;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.animal.mall.Items;
import com.animal.mall.ItemsDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ItemsController
 */
@WebServlet("*.item")
public class ItemsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ItemsController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
		System.out.println("doGet입니다.");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalStateException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("서블릿 안입니다.");
		
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		System.out.println(uri);
		System.out.println(ctxPath);
		System.out.println(cmd);
		ItemsDAO dao = ItemsDAO.getInstance();
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		Items item = new Items();
		String msg = "";
		if (cmd.equals("/insertItem.item")) {
			ServletContext cxt = getServletContext();
			String path = cxt.getRealPath("/im"); // 파일을 업로드할 위치
			int size = 1024 * 1024 * 10; // 10M
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			String category = multi.getParameter("category");

			if (category.equals("shopping")) {

				String name = multi.getParameter("itemName");
				int price = Integer.parseInt(multi.getParameter("itemPrice"));
				String descript = multi.getParameter("descript");
				String detail = multi.getParameter("detail");
				String fileName = (String) multi.getOriginalFileName("fileName"); // getParameter와 같음
				item = new Items(name, price, category, descript, detail, fileName);

			} else {

//				Enumeration files = (Enumeration)multi.getFile("fileName2"); // getParameter와 같음
//		        String fname = (String) files.nextElement(); // 다음 요소 받아옴 (rs.next() 같은?)
				String name = multi.getParameter("itemName2");
				int price = Integer.parseInt(multi.getParameter("itemPrice2"));
				String descript = multi.getParameter("descript2");
				String detail = multi.getParameter("detail2");
//				String fileName = multi.getOriginalFileName(fname); // 원래 파일 이름 받아옴
				String fileName = (String) multi.getOriginalFileName("fileName2"); // getParameter와 같음
				String area = multi.getParameter("area");
				String loc = multi.getParameter("loc");
				String tel = multi.getParameter("tel");
				String hours = multi.getParameter("hours");
				item = new Items(name, price, category, descript, detail, fileName, area, loc, tel, hours);
			}

			System.out.println(item.getCategory());

			msg = dao.insertItem(item);

			request.setAttribute("msg", msg);

			System.out.println(msg);

			rd = getServletContext().getRequestDispatcher("/addItem.jsp");
			rd.forward(request, response);

		} else if (cmd.equals("/deleteItem.item")) {
			int itemno = Integer.parseInt(request.getParameter("itemNo"));
			msg = dao.deleteItem(itemno);
			request.setAttribute("msg", msg);
			rd = getServletContext().getRequestDispatcher("/selectdeleteitemsAll.item");
			rd.forward(request, response);

		} else if (cmd.equals("/updateItem.item")) {
			int itemno = Integer.parseInt(request.getParameter("itemNo"));
			item = dao.selectItem(itemno);
			msg = dao.updateItem(item);
			request.setAttribute("msg", msg);
			rd = getServletContext().getRequestDispatcher("/updateItem.jsp");
			rd.forward(request, response);

		} else if (cmd.equals("/selectItemsAll.item")) {
			String category = request.getParameter("category");
			ArrayList<Items> items = dao.selectItemsAll(category);
			request.setAttribute("SIA", items);
			rd = getServletContext().getRequestDispatcher("/list.jsp");
			rd.forward(request, response);
			
			
			//삭제 리스트 출력
		} else if (cmd.equals("/selectdeleteitemsAll.item")) {
			String category = request.getParameter("category");
			ArrayList<Items> items = dao.deleteselectItemsAll();
			request.setAttribute("SIA", items);
			rd = getServletContext().getRequestDispatcher("/itemDelete.jsp");
			rd.forward(request, response);

		
			//상품 검색
			}else if (cmd.equals("/searchItems.item")) {
			String category2 = request.getParameter("category");
			System.out.println(category2 + "servlet");
			String area = request.getParameter("area");
			String[] items = request.getParameterValues("tag_option");
			String word = request.getParameter("search");
			String text = "";

			if (items != null) {
				for (String s : items) {
					text += " and detail Like '%" + s + "%'";
				}
			}
			if (area != null) {
				/* text += " and area Like '%" + area + "%'"; */
				text += " and area = '" + area + "'";
			}

			if (word != null) {
				word = " and itemname Like '%" + word + "%'";
				text += word;
			}
			System.out.println("1");
			System.out.println(text);
			System.out.println("1");

			System.out.println("category : " + category2);
			System.out.println("area : " + area);
			System.out.println("word : " + word);
			System.out.println("text : " + text);

			if (text.isEmpty()) {
				request.setAttribute("categoryList", dao.selectItemsAll(category2));
			} else {
				request.setAttribute("categoryList", dao.searchItems(category2, text));
			}
			rd = getServletContext().getRequestDispatcher("/list.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/list.item")) {
			String category = request.getParameter("category");
			System.out.println(category + "서블릿 안");
			
			request.setAttribute("categoryList", dao.selectItemsAll(category));
			
			request.setAttribute("category",category);
			rd = request.getRequestDispatcher("/condition.item");
			rd.forward(request, response);
		}else if(cmd.equals("/productDetail.item")) {
		 
			  Items selectItem = null;
			  int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			  
			  selectItem = dao.selectItem(itemNo);		
			  
			  session.setAttribute("item", selectItem);
			  request.setAttribute("itemNo", itemNo);
			  System.out.println((String)request.getParameter("itemNo")+"첫번째다야");
//			  getServletContext().setAttribute("categoryList",
			  
			  
			  rd = request.getRequestDispatcher("/itemListProc.comment"); 
			  rd.forward(request,response); 
		} 
		else if(cmd.equals("/condition.item")) {
			System.out.println("condition.item 입니다.");
			String category = (String)request.getAttribute("category");
			System.out.println(category);
			ArrayList<String> areaList = null;
			ArrayList<String> detail = null;
			String[] detailList = null;
			if(!(category.equals("shopping"))) {
				areaList = dao.selectArea(category);
				session.setAttribute("areaList", areaList);
			}
			detail = dao.selectDetail(category); 

			session.setAttribute("detailList", detail);
			
			rd = request.getRequestDispatcher("/list.jsp");
			rd.forward(request, response);
		}
		// 페이지 갯수 나눠서 출력하기
		else if(cmd.equals("/listPage.item")) {
			String category = request.getParameter("category");
			System.out.println(category + "listPage.item 서블릿 안");
			String area = request.getParameter("area");
			String[] items = request.getParameterValues("tag_option");
			String word = request.getParameter("search");
			System.out.println("뭐냐"+(word==null)+"뭐냐");
			System.out.println("=================");
			String text = "";
			if (items != null) {
				for (String s : items) {
					text += " and detail Like '%" + s + "%'";
				}
			}
			if (area != null) {
				/* text += " and area Like '%" + area + "%'"; */
				text += " and area = '" + area + "'";
			}

			if (word != null) {
				word = " and itemname Like '%" + word + "%'";
				text += word;
			}
			System.out.println("=================");
			System.out.println(text);
			System.out.println("=================");

			System.out.println("category : " + category);
			System.out.println("area : " + area);
			System.out.println("word : " + word);
			System.out.println("text : " + text);
			

			
			// ================================================================================
			// 페이지로 나누기 
			ArrayList<Items> categoryList = new ArrayList<>();
			int pageNum = 1;
			int limit = 6 ;		// 한 페이지에 나타낼 게시글 수
			if(request.getParameter("pageNum") != null) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
				System.out.println(pageNum);
			}

			int totalRecord= dao.getCategoryListCount(category, text);
			System.out.println(totalRecord + "totalRecord========================");
			categoryList = dao.selectItemsPageList(category, pageNum, limit, text);
			
			// 홈페이지 수 구하기
			int totalPage = 1;
			if(totalPage % limit == 0) {
				totalPage = totalRecord /limit;
				Math.floor(totalPage);
			}else {
				if(totalRecord%limit == 0) {
					
				}else {
					totalPage = totalRecord /limit;
					Math.floor(totalPage);
					totalPage += 1;
				}
			}
			
			request.setAttribute("category",category);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("totalRecord", totalRecord);
			request.setAttribute("categoryList", categoryList);
			
//			request.setAttribute("list", dao.selectItemsPageList(category, pageNum, limit, text));
			// ================================================================================
//			request.setAttribute("categoryList", dao.selectItemsAll(category));
			
			
			
//			request.setAttribute("categoryList", dao.searchItems(category,text));
//			if (text.isEmpty()) {
//				request.setAttribute("categoryList", dao.searchItems(category,text));
//			} else {
//				request.setAttribute("categoryList", dao.searchItems(category, text));
//			}
			
			rd = request.getRequestDispatcher("/condition.item");
			rd.forward(request, response);
		}
		
		
			 
	}
}
