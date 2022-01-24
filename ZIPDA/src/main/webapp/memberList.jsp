<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-top: 5px soild purple;
	/* background : op; */

}
.table{
	position : relative;
	margin:0 auto;
	width : 65%;
	padding:0;
	background-color : rgba(190, 182, 226, 0.7);
	border-radius : 20px;
	
}
th{
	border-bottom: 2px solid black;
	font-size : 23px;
}
td {
	border-bottom: 1px solid black;
	font-size : 20px;
}

.center {
	text-align: center;
}
.wrap{
position : releative;
text-align:center;
margin:0 auto;
}
.footer{
	position: absolute;
	bottom:0;
	left:0;
	width:100%;
}
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
<jsp:include page="header.jsp"/>
	<div class="wrap" style="margin-top:80px;">
		<div>
			<h1>회원 정보 삭제</h1>
		</div>
		<div class="tabs" style="margin-top:80px;">
			<table align="center" class="center">
				<tr>
					<th width="8%">목록번호</th>
					<th width="8%">userID</th>
					<th width="8%">userName</th>
					<th width="10%">Birthday</th>
					<th width="36%">Address</th>
					<th width="15%">PhoneNo</th>
					<th width="15%">Email</th>
					<th></th>
				</tr>
				<c:forEach var="item" items="${members}" varStatus="status">
					<form action="memberDelete.member?userId=${item.userId}" method="post">
					<tr>
						<td class="center">${status.count}</td>
						<td>${item.userId}</td>
						<td>${item.userName}</td>
						<td>${item.birthday}</td>
						<td>${item.address}</td>
						<td>${item.phoneNo}</td>
						<td>${item.email}</td>
						<td><input type="submit" value="삭제"></td>
					</tr>
					</form>
				</c:forEach>
			</table>
		</div>
		<div class="footer">
		<jsp:include page="footer.jsp"/>
		</div>
	</div>
	
</body>
</html>