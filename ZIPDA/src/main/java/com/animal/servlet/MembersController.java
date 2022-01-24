package com.animal.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.animal.mall.Members;
import com.animal.mall.MembersDao;

/**
 * Servlet implementation class MembersController
 */
@WebServlet("*.member")
public class MembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MembersController() {
		super();
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
		doGet(request, response);
	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String msg ="";
		
		// web.xml의 admin 계정
//		  ServletContext application = getServletConfig().getServletContext(); 
//		  String adminId = application.getInitParameter("adminId"); 
//		  String adminPwd = application.getInitParameter("adminPwd");
		 
		
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		MembersDao dao = MembersDao.getInstance();
		Members member = null;
		HttpSession session = request.getSession();
		
//관리자 사용자 기능
		RequestDispatcher rd = null;
		// 회원가입
		if (cmd.equals("/joinProc.member")) {

			String userId = request.getParameter("userId");
			System.out.println(userId + "님 회원가입 서블릿에 userId 들어왔습니다.");
			String userPwd = request.getParameter("userPwd");
			String userPwd2 = request.getParameter("userPwd2");
			String userName = request.getParameter("userName");
			String birthday = (String) request.getParameter("birthday");
			String address = request.getParameter("address");
			String phoneNo = request.getParameter("phoneNo");
			String email = request.getParameter("email");
			String id="";
			
			// userId를 가지고 회원을 조회해서 값이 있으면 id에 userId를 대입
			if(dao.selectMember(userId) != null) {
				id = dao.selectMember(userId).getUserId();
			}
			
			// id와 회원가입한 userId가 같다면 회원가입 불가
			if(userId.equals(id)) {
				msg ="이미 존재하는 ID입니다.";
				System.out.println("con"+msg);
				request.setAttribute("msg", msg);
				
				rd = getServletContext().getRequestDispatcher("/signupFrm.jsp");
				rd.forward(request, response);		
			}
			// id는 같지 않지만 비밀번호 재확인과 비밀번호가 다를 때 회원가입 불가	
			else if (!(userPwd.equals(userPwd2))) {
				msg = "두 개의 비밀번호가 일치하지 않습니다.";
				request.setAttribute("msg", msg);
				
				rd = getServletContext().getRequestDispatcher("/signupFrm.jsp");
				rd.forward(request, response);	// 비밀번호가 같지 않을때 회원가입 불가
			}
			// 항목 중 빈 것이 있을 때 회원가입 불가
			else if (userId.isEmpty() || userPwd.isEmpty() || userPwd2.isEmpty() || userName.isEmpty() || phoneNo.isEmpty() || address.isEmpty()
					|| email.isEmpty()) {
				msg = "항목이 비어있습니다.";
				request.setAttribute("msg", msg);
				
				rd = getServletContext().getRequestDispatcher("/signupFrm.jsp");
				rd.forward(request, response);
			} 
			// 위의 3가지에 걸리지 않았으면 회원가입 성공
				else {
					member = new Members(userId, userPwd, userName, birthday, address, phoneNo, email);
					System.out.println(member.getUserId() +" 있나요?");
					dao.insertMember(member);
					response.sendRedirect("main.jsp");
			}
		}
		
		// 로그인 기능
		else if (cmd.equals("/loginProc.member")) {
			String id = request.getParameter("userId");
			String pwd = request.getParameter("userPwd");
			
			// id를 가지고 회원 조회하여 Members 객체에 대입
			member = dao.selectMember(id);
			
			//객체가 null 이라면 존재하지 않는 회원으로 처리
			if(member == null) {
				msg ="존재하지 않는 회원입니다.";
				request.setAttribute("msg", msg);
				
				rd = getServletContext().getRequestDispatcher("/loginFrm.jsp");
				rd.forward(request, response);
			}
			//null은 아니지만 비밀번호가 입력받은 비밀번호와 다르다면 비밀번호 오류 처리
			else if(!(member.getUserPwd().equals(pwd))){
				msg ="비밀번호가 틀렸습니다.";
				request.setAttribute("msg", msg);
				rd = getServletContext().getRequestDispatcher("/loginFrm.jsp");
				rd.forward(request, response);
			}
			// 두 개의 경우가 아닐 경우 로그인 처리 후 session에  userId 저장 후 메인 화면으로
			else {
				member = dao.login(id, pwd);

				session.setAttribute("userId", member.getUserId());
//				session.setAttribute("userPwd", member.getUserPwd());
//				session.setAttribute("userName", member.getUserName());
//				session.setAttribute("birthday", member.getBirthday());
//				session.setAttribute("address", member.getAddress());
//				session.setAttribute("phoneNo", member.getPhoneNo());
//				session.setAttribute("email", member.getEmail());
				System.out.println("userId 세션저장 완료");

				rd = getServletContext().getRequestDispatcher("/main.jsp");
				rd.forward(request, response);
			}
		}
		// 로그아웃 처리
		else if (cmd.equals("/logoutProc.member")) {
			if(session != null || session.getAttribute("userId") != null){
				session.invalidate();
				response.sendRedirect(request.getContextPath()+"/main.jsp");
			}
		}

		// 정보수정
		else if (cmd.equals("/Update.member")) {

			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			String userPwd2 = request.getParameter("userPwd2");
			String userName = request.getParameter("userName");
			String birthday = (String) request.getParameter("birthday");
			String address = request.getParameter("address");
			String phoneNo = request.getParameter("phoneNo");
			String email = request.getParameter("email");
			
			// 수정 항목에 빈 항목이 있을 경우 처리
			if (userPwd.isEmpty() || userPwd2.isEmpty() ||userName.isEmpty() || phoneNo.isEmpty() || address.isEmpty()
					|| email.isEmpty()) {
				msg = "수정 항목이 비었습니다.";
				rd = request.getRequestDispatcher("/infoChange.member?msg="+msg);
				rd.forward(request, response);
			}
			// 비밀번호 재확인이 다를 경우 처리
			else if (!(userPwd.equals(userPwd2))) {
				msg = "비밀번호가 일치하지 않습니다.";
				request.setAttribute("msg", msg);
				
				rd = getServletContext().getRequestDispatcher("/infoChange.member?msg="+msg);
				rd.forward(request, response);
			}
			// member 업데이트 실행
			 else {
				member = new Members(userId, userPwd, userName, birthday, address, phoneNo, email);
				dao.updateMember(member);
				response.sendRedirect("mypage.jsp");
			}
			
			
		}
		// 회원삭제
		else if (cmd.equals("/memberDelete.member")) {

			String userId = (String) request.getParameter("userId");
			dao.deleteMember(userId);
			rd = getServletContext().getRequestDispatcher("/selectMemberAll.member");
			rd.forward(request, response);
		}
		// 회원탈퇴
		else if (cmd.equals("/WithdrawalProc.member")) {

			String userId = (String) session.getAttribute("userId");
			String userPwd = (String) session.getAttribute("userPwd");
			String inputUserPwd = request.getParameter("userPwd");
			if (userPwd.equals(inputUserPwd)) {
				dao.deleteMember(userId);
				response.sendRedirect("/main.jsp");
			} else {
				response.sendRedirect("/WithdrawalProc.jsp");
			}
		}
		// 사용자 출력
		else if (cmd.equals("/selectMember.member")) {
	         String userId = request.getParameter("userId");
	         session.setAttribute("member", dao.selectMember(userId));
	         response.sendRedirect("orderItems.cart");
	    }
		// 사용자 전체 출력
		else if (cmd.equals("/selectMemberAll.member")) {
			session.setAttribute("members", dao.selectMemberAll());
			rd = getServletContext().getRequestDispatcher("/memberList.jsp");
			rd.forward(request, response);

		}
		
		else if(cmd.equals("/infoChange.member")) {
//	    	String msg = (String)request.getAttribute("msg"); 
	    	String userId = request.getParameter("userId");
			request.setAttribute("changeMember", dao.selectMember(userId));
			
			rd = getServletContext().getRequestDispatcher("/infoChange.jsp");
			rd.forward(request, response);
		}
	}
}