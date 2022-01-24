<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.animal.mall.Items, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/list2.css" rel="stylesheet" type="text/css" />
<style>
div.row {
	width: 100%;
	height: 100vh;
	display: flex;
}

div.left {
	position: fixed;
	padding: 40px;
	width: 30%;
	height: 100%;
	float: left;
	box-sizing: border-box;
	display: block;
}

div.right {
	position: absolute;
	left: 30vw;
	width: 70%;
	float: right;
	box-sizing: border-box;
}
div.footerwrap{
	position: relative;
    left: 0;
    bottom: 0;
    width: 100%;
   padding: 15px 0;
   }
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String category = request.getParameter("category");
	ArrayList<Items> categoryList = (ArrayList<Items>)request.getAttribute("categoryList");
	int totalPage = ((Integer)request.getAttribute("totalPage")).intValue();
	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
	int totalRecord = ((Integer)request.getAttribute("totalRecord")).intValue();
	
	
	System.out.println(category + "list 카테고리 확인");
	%>
	<c:set var="category" value="<%=category%>"></c:set>
	<div class="wrapper">
	<jsp:include page="header.jsp" />

	<div class="row">
		<div class="left">
			<jsp:include page="condition.jsp">
				<jsp:param name="category" value="${category}"/>
			</jsp:include>
		</div>
		<div class="right">
			<div class="slider">
				<div class="slides">
					<div id="slide-1">
						<img src="im/snack.jpg" alt="">
						<img src="im/toy.jpg" alt="">
						<img src="im/feed.png" alt="">
					</div>
					<div id="slide-2">
						<img src="im/snack.jpg" alt="">
						<img src="im/toy.jpg" alt="">
						<img src="im/feed.png" alt="">
					</div>
					<div id="slide-3">
						<img src="im/snack.jpg" alt="">
						<img src="im/toy.jpg" alt="">
						<img src="im/feed.png" alt="">
					</div>
				</div>
				<a href="#slide-1">BEST 간식</a>
				<a href="#slide-2">BEST 장난감</a>
				<a href="#slide-3">BEST 사료</a>
			</div>
			<div class="list con">
				<ul class="row2">
					<c:forEach var="product" items="${categoryList}">
						<li class="cell">
							<a href="productDetail.item?itemNo=${product.itemNo}">
								<div class="img-box">
									<img src="<%=request.getContextPath()%>/im/${product.fileName}"
										alt="이미지 없음">
								</div>
								<div class="product-name">
									<h2>${product.itemName }</h2>
									<h3>${product.loc}</h3>
									<h3>최저가 : <fmt:formatNumber value="${product.itemPrice}" pattern="#,###"/>원 ~</h3>
									<h3>${product.hours}</h3>
									<h3>${product.tel}</h3>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
				<div style="width:100%; position:absolute; bottom:0; left:0;" align="center">
			<c:set var="pageNum" value="<%=pageNum %>"/>
         <c:forEach var="i" begin="1" end="<%=totalPage %>">
            <a href='<c:url value="listPage.item?category=${category}&pageNum=${i}"/>'>
               <c:choose>
                  <c:when test="${pageNum ==i }">
                     <span style="font-size:25px; color:red;"><b>[${i }]</b></span>
                  </c:when>
                  <c:otherwise>
                     <span style="font-size:25px; color:black;">[${i }]</span>
                  </c:otherwise>
               </c:choose>
            </a>
         </c:forEach>
         <jsp:include page="footer.jsp" />
		</div>
			</div>
			<!-- 페이지 수 출력 ================================================================-->
		
		<!-- 페이지 수 출력 ================================================================ -->	
		</div>
		
		
		
	<%--</div>
	 <div class="footerwrap">
		
	</div> 
	</div>--%>	
	
</body>
</html>