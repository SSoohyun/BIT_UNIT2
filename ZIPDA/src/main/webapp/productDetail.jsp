<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/productDetail.css" rel="stylesheet" type="text/css"/>
<style>
.tabs {
	left: 50%;
	transform: translateX(-50%);
	position: relative;
	background: rgba(245, 245, 245, 0.8);
	padding: 50px;
	padding-bottom: 80px;
	width: 60%;
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
	<div class="tabs">
		<c:set var="product" value="${item}"/>
		<form name="detail" action="insertCart.cart">
			<div class="product_view">
				<h2>${product.itemName}</h2>
				
				<table>
					<colgroup>
					<col style="width:173px;">
					<col>
					</colgroup>
					
					<c:choose>
						<c:when test="${product.category eq 'shopping'}">
							<tbody>
								<tr>
									<th>판매가</th>
									<td class="price">${product.itemPrice}</td>
								</tr>
								<tr>
									<th>구매수량</th>
									<td>
										<div class="length">
											<input type="number" min="1" value="1" name="quantity">
										</div>
									</td>
								</tr>
								<tr>
									<th>배송비</th>
									<td>2,500</td>
								</tr>
								<tr>
									<th>결제금액</th>
									<td class="total"><b><fmt:formatNumber value="${product.itemPrice}" pattern="#,###"/></b>원</td>
								</tr>
								<tr>
									<th>소개</th>
									<td style="font-size:16px;">${product.descript}</td>
								</tr>
							</tbody>
						</c:when>
						<c:otherwise>
							<tbody>
								<tr>
									<th>최저 금액</th>
									<td class="price"><fmt:formatNumber value="${product.itemPrice}" pattern="#,###"/>원</td>
								</tr>
								<tr>
									<th>위치</th>
									<td>${product.loc}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${product.tel}</td>
								</tr>
								<tr>
									<th>운영 시간</th>
									<td>${product.hours}</td>
								</tr>
								<tr>
									<th>소개</th>
									<td>${product.descript}</td>
								</tr>
							</tbody>
						</c:otherwise>
					</c:choose>	
				</table>
				
				<div class="img">
					<img src="<%=request.getContextPath()%>/im/${product.fileName}" alt="이미지 없음">
					<ul>
					<li class="on"><a href="#a"><img src="<%=request.getContextPath()%>/im/${product.fileName}" alt="이미지 없음"></a></li>
					<li><a href="#a"><img src="<%=request.getContextPath()%>/im/${product.fileName}" alt="이미지 없음"></a></li>
					</ul>
				</div>
				<div class="btns">
					<input type="hidden" name="itemNo" value="${product.itemNo}">
					<a href="#a" class="btn1" onclick="addCart()">장바구니</a>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="comments.jsp">
   		<jsp:param name="itemNo" value="${product.itemNo}"/>
   	</jsp:include>
	<jsp:include page="footer.jsp"/>
	
	<script>
		function addCart() {
			if(confirm("장바구니에 추가하시겠습니까?")) {
				document.detail.submit();
			} else {
				document.detail.reset();
			}	
		}
	</script>
</body>
</html>