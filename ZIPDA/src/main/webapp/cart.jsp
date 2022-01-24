<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myCss/cart.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet"> 
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="frame">
            <div id="frame2">
                <span style="font-size: 16pt; font-weight: bold;">장바구니</span>
                <span class="home">홈 > 장바구니</span>
                <span></span>
            </div>
            <br>

            <div>
                <table class="interest price" >
                    <thead>
                        <tr>
                            <th colspan="10" style="text-align: left; padding-left: 10px;">일반상품(<%=request.getAttribute("count")%>)</th>
                        </tr>
                        <tr>
                            <th><input type="checkbox" name="checkbox" id="check" checked/></th>
                            <th style="width: 20%; "><span>이미지</span></th>
                            <th style="width: 20%;"><span>상품정보</span></th>
                            <th>가격</th>
                            <th>수량</th>
                            <th style="width: 100px;">적립금</th>
                            <th>배송구분</th>
                            <th>배송비</th>
                            <th>합계</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<c:set var="t_sumPrice" value="0" />
                    	<c:set var="flag" value="0"/>
                    	<c:forEach var="cl" items="${cartList}">
	                        <tr style="height: 90px; background-color: #fff;">
	                            <td style="text-align: center; border-right: none;">
	                                <input type="checkbox" name="checkbox" checked/>
	                            </td>
	                            <td style="border-left: none; border-right: none;">
	                                <img style="width: 30%; background-color: beige;" src="<%=request.getContextPath()%>/im/${cl.fileName}">
	                            </td>
	                            <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
	                               ${cl.itemName}
	                            </td>
	                            <td><span><fmt:formatNumber value="${cl.itemPrice}" pattern="#,###"/></span>원</td>
	                            <td style="width: 80px;">
	                            	<form action="updateCart.cart?itemNo=${cl.itemNo}" method="post">
	                            		<c:choose>
	                            			<c:when test="${cl.category eq 'shopping'}">
	                            				<input type="number" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" name="quantity" value="${cl.quantity}" />
	                                			<input type="submit" class="btn default_btn" style="border-radius: 3px; size: 10px;" value="변경">
	                            			</c:when>
	                            			<c:otherwise>
	                            				-
	                            			</c:otherwise>
	                            		</c:choose>
	                            	</form>
	                           	</td>
	                            <td>-</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${cl.category eq 'shopping'}">
	                            			기본 배송
	                            		</c:when>
	                            		<c:otherwise>
	                            			-
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${cl.category eq 'shopping'}">
	                            			<c:set var="fee" value="2500"/>
	                            			2,500
	                            		</c:when>
	                            		<c:otherwise>
	                            			<c:set var="fee" value="0"/>
	                            			-
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${cl.category eq 'shopping'}">
	                            			<span><fmt:formatNumber value="${cl.sumPrice+2500}" pattern="#,###"/></span>원
	                            		</c:when>
	                            		<c:otherwise>
	                            			<span><fmt:formatNumber value="${cl.sumPrice}" pattern="#,###"/></span>원
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td>
	                                <a href="deleteCart.cart?itemNo=${cl.itemNo}" class="btn default_btn" style="border-radius: 3px; width: 90px; margin-bottom: 3px; font-size: 11px;">X 삭제</a>
	                            </td>
	                        </tr>
                            <c:set var="t_sumPrice" value="${t_sumPrice+cl.sumPrice}" />
                            
                        </c:forEach>
                    </tbody>
					<%-- <c:choose>
                    	<c:when test="${t_sumPrice ne 0}">
                    		<c:set var="fee" value="2500"/>
                        </c:when>
                        <c:otherwise>
                        	<c:set var="fee" value="0"/>
                        </c:otherwise>
                    </c:choose> --%>
					
                    <tfoot>
                        <tr style="height: 60px">
                            <td colspan="5" style="border-right: none; text-align: left; padding-left: 10px;">
                                <span>[기본배송]</span>
                            </td>
                            <td colspan="5" style="border-left: none; text-align: right; padding-left: 10px;">
                                상품금액&nbsp;<span><fmt:formatNumber value="${t_sumPrice}" pattern="#,###"/></span>원
                                &nbsp;&nbsp;&nbsp;+&nbsp;&nbsp;&nbsp;배송비&nbsp;<span>
                                <fmt:formatNumber value="${fee}" pattern="#,###"/>
                                </span>원
                                &nbsp;&nbsp;&nbsp;=&nbsp;&nbsp;&nbsp;합계&nbsp;
                                <span style="font-weight: bold; font-size: 15pt;">
                                <fmt:formatNumber value="${t_sumPrice+fee}" pattern="#,###"/></span>원&nbsp;
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <div style="border: 1px solid #e0e0eb; padding: 15px 0;">
                    <!-- <span style="font-size: 10pt; color: gray;">* 할인 적용 금액은 결제 페이지에서 확인 가능합니다.</span> -->
                </div>

                <div style="margin: 10px 0;">
                    <!-- <span style="margin: 0 10px;" class="float_btn">선택상품을</span>
                    <button class="btn default_btn float_btn" style="background-color: gray; color: #fff;">X 삭제하기</button>&nbsp; -->
                    <a href="deleteCartAll.cart" class="btn default_btn back_btn float_btn2">장바구니 비우기</a>
                    <span class="clear_both"></span>
                </div>
                <br><br>

                <table class="cal">
                    <tr>
                        <th>총 상품금액</th>
                        <th>총 배송비</th>
                        <th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
                    </tr>

                    <tr style="background-color: #fff;">
                        <td style="padding: 22px 0;"><span class="price"><fmt:formatNumber value="${t_sumPrice}" pattern="#,###"/></span>원</td>
                        <td>+&nbsp;<span class="price">
                        <fmt:formatNumber value="${fee}" pattern="#,###"/>
                        </span>원</td>
                        <td>=&nbsp;<span class="price"> <fmt:formatNumber value="${t_sumPrice+fee}" pattern="#,###"/></span>원</td>
                    </tr>
                </table>
                <br><br>

                <div align="center">
                   	<button class="btn default_btn" id="all_product" onclick="checkCart();">상품 주문</button>
                    <!-- <button class="btn default_btn back_btn" id="order">선택상품 주문</button> -->
                    <a href="listPage.item?category=shopping" class="btn default_btn footer_btn" id="shop">쇼핑 계속하기</a>
                    <span class="clearboth"></span>
                </div>
                <br><br><br><br>

                <div style="border: 1px #e0e0eb; padding: 10px 0; font-size: 15pt; background-color: #f5f5f0; padding-left: 10px;">
                    이용안내
                </div>
                <div style="border: 1px solid #e0e0eb; height: 350px; font-size: 12pt; padding-left: 10px;">
                    <br><h3>장바구니 이용안내</h3>
                    <ol>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                    </ol>
                    <h3>무이자할부 이용안내</h3>
                    <ol>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                        <li class="info">어쩌고저쩌고</li>
                    </ol>
                </div>
            </div>    
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
    
    
    <script>
    	function checkCart() {
    		if (${t_sumPrice ne 0}) {
    			location.href = 'selectMember.member?userId=${userId}';
    			console.log("zzz");
    		} else {
    			alert('주문할 상품이 없습니다!');
    		}
    	}
    </script>
    
</body>
</html>