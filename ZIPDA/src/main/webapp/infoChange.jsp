<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/signupFrm.css" rel="stylesheet" type="text/css" />
<style>
.tabs {
	left: 50%;
	transform: translateX(-50%);
	position: relative;
	background: rgba(245, 245, 245, 0.8);
	padding: 50px;
	padding-bottom: 80px;
	width: 70%;
	height: auto;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	border-radius: 5px;
	min-width: 240px;
	margin-bottom: 100px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String msg = (String)request.getAttribute("msg");
	%>
	<script>
		var msg = "<%=msg%>";
		/* alert(msg); */
		if(!(msg == 'null')){
			alert(msg);
		}
	</script>
	<c:set var="member" value="${changeMember}"></c:set>
	<jsp:include page="header.jsp" />
	<h1 style="text-align: center;
	color: #a48be0;
	font-weight: 300;
	padding: 40px 0 20px 0;
	margin: 0;">집사 정보 수정</h1>
   <div class="tabs">
		<div class="main-signup">
			<!--회원가입 부분-->
			<section class="signup-wrap">
				<form action="Update.member" method="post">
					<div>
						<!--아이디,비번,비번재확인-->
						<h3 class="font_base">아이디</h3>
						<span class="signup-input"> 
						<input id="signup-id" type="text" name="userId" value="${member.userId }" readonly> 
						</span>
	
						<h3 class="font_base">비밀번호</h3>
						<span class="signup-input"> 
						<input id="signup-pw" type="password" name="userPwd" placeholder=" PW"> 
						<span class="pw-lock"></span>
						</span>
						
						<h3 class="font_base">비밀번호 재확인</h3>
						<span class="signup-input"> 
						<input id="signup-pw" type="password" name="userPwd2" placeholder=" PW 재확인"></input> 
						<span class="pw-lock"></span>
						</span>
					</div>
					<div>
						<!--이름,생년월일,성별,이메일-->
						<h3 class="font_base">이름</h3>
						<span class="signup-input"> 
						<input id="signup-name" type="text" name="userName" value="${member.userName}">
						</span>
						
						<h3 class="font_base">생년월일</h3>
						<span class="signup-input">
						<input id="signup-birth-yy" type="date" name="birthday" value="${member.birthday}">
						</span>
						
						<h3 class="font_base">주소</h3>
						<span class="signup-input"> 
						<input id="signup-address" type="text" name="address" value="${member.address}">
						</span>
						
						<h3 class="font_base">이메일</h3>
						<span class="signup-input"> 
						<input id="signup-email" type="text" name="email" value="${member.email}">
						</span>
					</div>
					<div>
						<!--휴대전화-->
						<h3 class="font_base">휴대전화</h3>
						<span class="signup-input">
						<input id="signup-phone" type="text" name="phoneNo" value="${member.phoneNo}">
						</span>
					</div>
						<!--가입하기-->
					<div class="signup-btn-wrap">
						<input type="submit" id="signup-btn" value="회원 수정">
					</div>
				</form>
		</section>
		</div>
		</div>
	<jsp:include page="footer.jsp" />

</body>
</html>