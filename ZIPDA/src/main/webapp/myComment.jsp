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

.table {
	position: relative;
	margin: 0 auto;
	width: 50%;
	background-color: rgba(190, 182, 226, 0.7);
	border-radius: 20px;
}
th{
	font-size:25px;
	border-bottom: 2px double black;
}
td {
	border-bottom: 1px solid black;
	font-size: 20px;
}

.center {
	text-align: center;
}

.wrap {
	position: releative;
	text-align: center;
	margin: 0 auto;
}
.tabs {
	left: 50%;
	transform: translateX(-50%);
	position: relative;
	background: rgba(245, 245, 245, 0.8);
	padding: 50px;
	padding-bottom: 80px;
	width: 50%;
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
	<jsp:include page="header.jsp" />
	<div class="wrap">
		<div>
			<h1>내가 쓴 코멘트 삭제</h1>
		</div>
		<div class="tabs">
			<table align="center">
				<tr>
					<th width="10%">목록</th>
					<th width="20%">상품이름</th>
					<th>내용</th>
					<th width="15%">등록일</th>
					<th width="5%"></th>
					<!-- 삭제 버튼-->
				</tr>
				<c:forEach var="item" items="${CML}" varStatus="status">
					<form action="deleteMyComment.comment?comNo=${item.comNo }"
						method="post">
						<tr>
							<td class="center">${status.count}</td>
							<td><a
								href="productDetail.item?itemNo=${item.itemNo}">${item.itemName}</a></td>
							<td>${item.content}</td>
							<td>${item.regdate}</td>
							<td><input type="submit" value="삭제"></td>
						</tr>
					</form>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>