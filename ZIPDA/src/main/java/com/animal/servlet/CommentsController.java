package com.animal.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.animal.mall.Comments;
import com.animal.mall.CommentsDao;

/**
 * Servlet implementation class CommentsController
 */
@WebServlet("*.comment")
public class CommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentsController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
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
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		CommentsDao dao = CommentsDao.getInstance();
		HttpSession session = request.getSession();
		Comments comment = new Comments();
		// DB에 게시글 저장 후 listProc.comment로 이동
		if (cmd.equals("/writeProc.comment")) {
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			String userId = (String) session.getAttribute("userId");
			String content = request.getParameter("content");
			comment = new Comments(itemNo, userId, content);
			System.out.println("itemNo : " + comment.getItemNo());
			System.out.println("userId : " + comment.getUserId());
			System.out.println("content : " + comment.getContent());
			dao.insertComment(comment);
			request.setAttribute("itemNo", itemNo);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/itemListProc.comment");
			rd.forward(request, response);
		}
		// 게시글 목록 DB에서 불러와서 list.jsp에 출력하기
		else if (cmd.equals("/itemListProc.comment")) {
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			System.out.println("item1 : " + itemNo);
			List<Comments> comments = null;

			if (itemNo != 0) {
				comments = dao.selectCommentAll(itemNo);
//				System.out.println("CALregdate : " + comments.get(0).getRegdate());
				request.setAttribute("CAL", comments);
			}
//			System.out.println("CAL : "+comments.get(0).getItmeNo());
//			System.out.println("CAL : "+comments.get(0).getComNo());
//			System.out.println("CAL : "+comments.get(0).getContent());
//			System.out.println("CAL : "+comments.get(0).getUserId());
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/productDetail.jsp");
			rd.forward(request, response);
		}
		// 마이페이지에서 내가 쓴 목록 보기
		else if (cmd.equals("/listMyProc.comment")) {
			String userId = (String) session.getAttribute("userId");
			List<Comments> comments = dao.selectMyCommentAll(userId);
			request.setAttribute("CML", comments);

			RequestDispatcher rd = getServletContext().getRequestDispatcher("/myComment.jsp");
			rd.forward(request, response);
		}
		// 상품상세페이지 내 코멘트 삭제
		else if (cmd.equals("/deleteComment.comment")) {
			int comNo = Integer.parseInt(request.getParameter("comNo"));
			comment = dao.selectComment(comNo);
			dao.deleteComment(comNo);
			int itemNo = comment.getItemNo();
			response.sendRedirect("productDetail.item?itemNo=" + itemNo);
		}
		//내가 쓴 목록 번호 파라미터로 받아서 지우기(마이페이지용)
		else if (cmd.equals("/deleteMyComment.comment")) {
			int comNo = Integer.parseInt(request.getParameter("comNo"));
			System.out.println(comNo +" : comNo");
			dao.deleteComment(comNo);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/listMyProc.comment");
			rd.forward(request, response);
		}
	}
}
