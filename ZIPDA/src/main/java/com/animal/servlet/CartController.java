package com.animal.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.animal.mall.Cart;
import com.animal.mall.CartDAO;
import com.animal.mall.MembersDao;

/**
 * Servlet implementation class CartController
 */
@WebServlet("*.cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri: " + uri);
		String ctxPath = request.getContextPath();
		System.out.println("ctxPath: " + ctxPath);
		String cmd = uri.substring(ctxPath.length());
		System.out.println("cmd: " + cmd);
		
		CartDAO dao = CartDAO.getInstance();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		if (cmd.equals("/selectCartAll.cart")) {
			ArrayList<Cart> cl = dao.selectCartAll(userId);
			int cnt = cl.size();
			request.setAttribute("cartList", cl);
			request.setAttribute("count", cnt);
			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
			rd.forward(request, response);
			
		} else if (cmd.equals("/insertCart.cart")) {
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			
			// ??????????????? ?????? ?????? ??????
			if (dao.selectCart(userId, itemNo) != 0) {
				if (request.getParameter("quantity") == null) { // ???????????? ?????? ??????
					
				} else {
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					dao.updateCart(new Cart(userId, itemNo, quantity));
				}
			} else { // ??? ??????
				if (request.getParameter("quantity") == null) { // ???????????? ?????? ??????
					dao.insertCart(new Cart(userId, itemNo));
				} else {
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					dao.insertCart(new Cart(userId, itemNo, quantity));
				}
			}
			response.sendRedirect("selectCartAll.cart");
			
		} else if (cmd.equals("/updateCart.cart")) {
			
			// System.out.println("updateupdate : "+request.getParameter("itemNo"));
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			dao.updateCart(new Cart(userId, itemNo, quantity));
			response.sendRedirect("selectCartAll.cart");
			
		} else if (cmd.equals("/deleteCart.cart")) {
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			dao.deleteCart(userId, itemNo);
			response.sendRedirect("selectCartAll.cart");
			
		} else if (cmd.equals("/deleteCartAll.cart")) {
			dao.deleteCartAll(userId);
			response.sendRedirect("selectCartAll.cart");
			
		} else if (cmd.equals("/orderItems.cart")) {
			request.setAttribute("cartList", dao.selectCartAll(userId));
			RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
			rd.forward(request, response);
			
		} else if (cmd.equals("/pay.cart")) {
//	        System.out.println("???????????????");
			String[] itemNo = request.getParameterValues("itemNo");
			String[] category = request.getParameterValues("category");
			String[] quantity = request.getParameterValues("quantity");
			
			for (int i = 0; i < itemNo.length; i++) {
				System.out.println("??????----------");
				System.out.println(itemNo[i]);System.out.println(category[i]);System.out.println(quantity[i]);
				if (category[i].equals("shopping")) {
					dao.insertPayment(new Cart(userId, Integer.parseInt(itemNo[i]), Integer.parseInt(quantity[i]), "?????? ??????"));
				} else {
					dao.insertPayment(new Cart(userId, Integer.parseInt(itemNo[i]), Integer.parseInt(quantity[i]), "?????? ??????"));
				}
			}
		
	        dao.deleteCartAll(userId);
	        response.sendRedirect("selectPayAll.cart");
	         
		} else if (cmd.equals("/selectPayAll.cart")) {
			ArrayList<Cart> pl = dao.selectPayAll(userId);
			int cnt = pl.size();
	        request.setAttribute("payList", pl);
	        request.setAttribute("count", cnt);
	        RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
	        rd.forward(request, response);
	    }
	}
}
