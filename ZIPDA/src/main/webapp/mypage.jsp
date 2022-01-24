<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/mainMyPage.css" rel="stylesheet" type="text/css" />

</head>
<body>
 	<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
	<%-- <%
		String userId = (String) 
	%> --%>
	<jsp:include page="header.jsp"/>
	<div class="homeRow">
        <div class="col1">
            <h1 class="wh1">Mypage</h1>
            <p id="subtitle">ZIP사들의 정보.zip</p>
            <label for="change"><a href="infoChange.member?userId=${userId}"><input id="change" class="change-btn" type="button" value="회원정보수정"></a></label>
        </div>
        <div class="col2">
            <div class="homeRow-in">
                <div class="card"><a href="selectCartAll.cart"><img class="imgsize" src="${contextPath}/im/buck.png"></a></div>
                <div class="card"><a href="selectPayAll.cart"><img class="imgsize" src="${contextPath}/im/past2.png"></a></div>
            </div>
            <div class="homeRow-in">
                <div class="card"><a href="infoChange.member?userId=${userId}"><img class="imgsize" src="${contextPath}/im/ichange.png"></a></div>
                <div class="card"><a href="listMyProc.comment"><img class="imgsize" src="${contextPath}/im/comment.png"></a></div>
            </div>
        </div>
        <!-- <a href="">장바구니</a> -->
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>