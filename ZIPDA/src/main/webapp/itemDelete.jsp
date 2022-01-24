<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
.table{
	position : relative;
	margin:0 auto;
	width : 80%;
	/* background-color : rgba(190, 182, 226, 0.7); */
	border-radius : 20px;
	
}
th{
	font-size: 22px;
	border-bottom: 1px double black;
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
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="wrap">
		<div>
			<h1>상품 삭제</h1>
		</div>
		<div class="tabs">
			<table align="center" class="center">
				<tr style="height:40px">
					<th width="7%">목록번호</th>
					<th>상품이름</th>
					<th width= "7%">상품가격</th>
					<th width="6%">카테고리</th>
					<th width="9%">파일이름</th>
					<th>상세주소</th>
					<th width="10%">전화번호</th>
					<th width="9%">운영시간</th>
				</tr>
				<c:forEach var="item" items="${SIA}" varStatus="status">
					<form action="deleteItem.item?itemNo=${item.itemNo}" method="post">
						<tr>
							<td class="center">${status.count}</td>
							<td><a href="productDetail.item?itemNo=${item.itemNo}">${item.itemName}</a></td>
							<td><fmt:formatNumber value="${item.itemPrice}" pattern="#,###"/>원</td>
							<td>${item.category}</td>
							<td>${item.fileName}</td>
							<td>${item.loc}</td>
							<td>${item.tel}</td>
							<td>${item.hours}</td>
							<td><input type="submit" value="삭제"></td>
							<%-- <td><input type="button" value="수정"
								onClick="location.href=updateItem.item?itemNo=${item.itemNo}"></td> --%>
						</tr>
					</form>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>