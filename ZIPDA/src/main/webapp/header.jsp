<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<link href="myCss/header.css" rel="stylesheet" type="text/css"/>
</head>
<style>
	html{
		background:  url(im/bg3.png) no-repeat center center fixed;
		/*  linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), */
		background-size: cover;
	}
</style>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String userId = ((String)session.getAttribute("userId")); 
		String userName = ((String)session.getAttribute("userName")); 
	%>
	<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
	<nav class="navbar navbar-expand navbar-dark bg-purple">
		<div class = "container">
			<div class="navbar-header">
				<a class="navbar-brand" href="${contextPath}/main.jsp"><img class="logo-size" src="${contextPath}/im/logo5.png"></a>		
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${userId ne 'admin'}">
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=hospital"><h2>Hospital</h2></a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=travel"><h2>Travel</h2></a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=service"><h2>Service</h2></a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=shopping"><h2>Shopping</h2></a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=hospital"><h3>Hospital</h3></a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=travel"><h3>Travel</h3></a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=service"><h3>Service</h3></a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/listPage.item?category=shopping"><h3>Shopping</h3></a></li>						
							<li class="nav-item"><a class="nav-link" href="${contextPath}/addItem.jsp"><h3>상품등록</h3></a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/selectdeleteitemsAll.item"><h3>상품삭제</h3></a></li>
						</c:otherwise>
					</c:choose>			
				</ul>
			</div>
			<div>	 
				<ul class="navbar-nav mr-auto">
					<c:choose>
		               <c:when test="${empty userId}">
		                  <li class="nav-item"><a class="nav-link" href="${contextPath}/loginFrm.jsp"><h4>로그인</h4></a></li>
		                  <li class="nav-item"><a class="nav-link" href="${contextPath}/signupFrm.jsp"><h4>회원가입</h4></a></li>
		               </c:when>
		               <c:when test="${userId eq 'admin'}">
		                  <li class="nav-item"><a class="nav-link" style = "color : black;"><h4>[<%=userId %>님]</h4></a></li>
		                  <li class="nav-item"><a class="nav-link" href="${contextPath}/logoutProc.member"><h4>로그아웃</h4></a></li>
		                  <li class="nav-item"><a class="nav-link" href="${contextPath}/selectMemberAll.member"><h4>회원관리</h4></a></li> 
		               </c:when>
		               <c:otherwise>
		                  <li class="nav-item"><a class="nav-link" style = "color : black;"><h4>[<%=userId %>님]</h4></a></li>
		                  <li class="nav-item"><a class="nav-link" href="${contextPath}/logoutProc.member"><h4>로그아웃</h4></a></li>
		                  <li class="nav-item"><a class="nav-link" href="${contextPath}/mypage.jsp?userId=${userId}"><h4>마이페이지</h4></a></li>      
		               </c:otherwise>
	           		 </c:choose>
				</ul>
			</div>
			
		</div>
	</nav>
</body>
</html>