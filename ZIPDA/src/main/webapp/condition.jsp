<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/condition2.css" rel="stylesheet" type="text/css"/>
<script>
</script>
</head>
<body>

	<% 
		String category = request.getParameter("category");
		System.out.println(category +"condition에 카테고리 출력"); 

	%> 

	<c:set var="category" value="<%=category %>"></c:set>
	
	 <form name="searchFrm" action="listPage.item?category=${category }" method="get">
		 <div class="search">
		 		<input type="hidden" name="category" value="${category}">      
	            <input id="inbu" name="search" class="search-field" placeholder="Search" type="text" value=""/>
	            <input id="inbu" class="search-btn" type="reset" value="취소">
	            <img class="search-icon" src="im/search.png"/>     
	    </div>
	    <c:choose>
		    <c:when test="${category ne 'shopping'}">
			    <div class="wrap">
			        <span id="title">Location</span>
				        <c:forEach var="area" items="${areaList}">
					        <label class="d_radio">
						        <input type="radio" name="area" value="${area}">
						        <span>${area}</span>
					        </label>
				        </c:forEach>
			      </div>
		      </c:when>
	      </c:choose>
	      <div class="wrap">
	          <span id="title">Tag</span>
	           <c:forEach var="detail" items="${detailList}">
	          		<label class="d_checkbox">
	          			<input type="checkbox" name="tag_option" value="${detail}">
	            		<span>${detail}</span>
	            	</label> 
	            </c:forEach>      
	      </div>
	       <div class="surf">
	            <input id="inbu2" type="submit" value="조건 검색">
	   		</div>
      </form>
</body>
</html>