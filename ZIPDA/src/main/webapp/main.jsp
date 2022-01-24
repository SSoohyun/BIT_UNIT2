<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="myCss/mainMyPage.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userId = ((String)session.getAttribute("userId")); 
		String category = (String) request.getParameter("category");
		/* System.out.println(category); */
		session.setAttribute("category", category);
		/* System.out.println(category); */
	%>
	<c:set var="category" value="<%=category%>"></c:set>
		<jsp:include page="header.jsp"/>	
		<div class="homeRow">
		            <div class="col1">
		                <h1 class="wh1">ZIP:DA</h1>
		                <p id="subtitle">ZIP사들을 위한 모음.zip</p>
		                 <%-- <% System.out.print(session.getAttribute("userId")); %> --%>
			               <c:choose>
			                  <c:when test="${empty userId}">
			                     <label for="log"><a href="loginFrm.jsp"><input
			                           id="log" class="login-btn" type="button" value="Login"></a></label>
			                  </c:when>
			                   <c:when test="${userId eq 'admin'}">
			                     <label for="log"><input id="log" class="login-btn" type="button" value="관리자"></label>
			                  </c:when>
			                  <c:otherwise>
			                     <label for="log"><a href="mypage.jsp?userId=${userId }"><input id="log" class="login-btn" type="button" value="${userId}&nbsp;집사님"></a></label>
			                  </c:otherwise>
			               </c:choose>
		                
		                <!-- <label for="log"><a href="loginFrm.jsp"><input id="log" class="login-btn" type="button" value="Login"></a></label> -->
		            </div>
		            <div class="col2">
		                <div class="homeRow-in">
		                <c:set var="contextPath" value="<%=request.getContextPath() %>"/>
		                    <div class="card"><a href="listPage.item?category=hospital"><img class="imgsize" src="${contextPath}/im/doctors.png"></a></div>
		                    <div class="card"><a href="listPage.item?category=service"><img class="imgsize" src="${contextPath}/im/dogservice.png"></a></div>
		                </div>
		                <div class="homeRow-in">
		                    <div class="card"><a href="listPage.item?category=travel"><img class="imgsize" src="${contextPath}/im/airplane.png"></a></div>
		                    <div class="card"><a href="listPage.item?category=shopping"><img class="imgsize" src="${contextPath}/im/product.png"></a></div>
		                </div>
	            	</div>
	            </div>	
		<jsp:include page="footer.jsp"/>
</body>
</html>