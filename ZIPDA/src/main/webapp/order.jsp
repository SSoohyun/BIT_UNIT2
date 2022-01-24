<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myCss/order.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="frame">
            <div id="frame2">
                <span style="font-size: 16pt; font-weight: bold;">주문서</span>
                <span class="home">장바구니 > 주문서</span>
                <span></span>
            </div>
            <br>

            <div
                style="border: 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
                배송지
            </div>
			<form name="bill" action="pay.cart">
            <div>
                <p></p>
                <div class="w3-third">
                    <label>이름</label>
                    <input class="w3-in w3-border w3-round-large" type="text" name="name" value="${member.userName}">
                </div>
                <p></p>
                <div class="w3-third">
                    <label>전화번호</label>
                    <input class="w3-in w3-border w3-round-large" type="text" name="phoneNo" value="${member.phoneNo}">
                </div>
                <p></p>
                <div class="w3-third">
                    <label>이메일</label>
                    <input class="w3-in w3-border w3-round-large" type="text" name="email" value="${member.email}">
                </div>
                <div class="w3-container">
                    <p>
                        <label>주소</label>
                        <input class="w3-input w3-border w3-round-large" type="text" name="address" value="${member.address}">
                    </p>
                    <p>
                </div>
                <div class="w3-container">
                    배송 요청사항
                    <select class="w3-input w3-border w3-round-large" name="msg">
                        <option value="" disabled selected>메시지를 선택하세요.</option>
                        <option value="1">배송 전 연락주세요.</option>
                        <option value="2">안전하게 배송해주세요.</option>
                        <option value="3">감사합니다.</option>
                    </select>
                    <p></p>
                </div>
            </div>
            <hr>
            <br>

            <div>
                <table class="order price">
                    <thead>
                        <tr>
                            <th colspan="10" style="text-align: left; padding-left: 10px;">상품정보</th>
                        </tr>
                        <tr>
                            <th><input type="checkbox" name="checkbox" id="check" checked /></th>
                            <th style="width: 20%;"><span>이미지</span></th>
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
                    	<c:forEach var="cl" items="${cartList}">
	                        <tr style="height: 90px; background-color: #fff;">
	                            <td style="text-align: center; border-right: none;">
	                                <input type="checkbox" name="checkbox" checked />
	                            </td>
	                            <td style="border-left: none; border-right: none;">
	                                <img style="width: 30%; background-color: beige;" src="<%=request.getContextPath()%>/im/${cl.fileName}">
	                            </td>
	                            <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
	                                ${cl.itemName}
	                            </td>
	                            <td><span><fmt:formatNumber value="${cl.itemPrice}" pattern="#,###"/></span>원</td>
	                            <td style="width: 80px;">
	                            	<c:choose>
	                            		<c:when test="${cl.category eq 'shopping'}">
	                            			${cl.quantity}
	                            		</c:when>
	                            		<c:otherwise>
	                            			-
	                            		</c:otherwise>
	                            	</c:choose>
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
	                            <span>
	                            	<c:choose>
	                            		<c:when test="${cl.category eq 'shopping'}">
	                            			<span><fmt:formatNumber value="${cl.sumPrice+2500}" pattern="#,###"/></span>원
	                            		</c:when>
	                            		<c:otherwise>
	                            			<span><fmt:formatNumber value="${cl.sumPrice}" pattern="#,###"/></span>원
	                            		</c:otherwise>
	                            	</c:choose>
	                            </span>
	                            </td>
	
	                            <td>
	                                <button class="btn default_btn"
	                                    style="border-radius: 3px; width: 90px; margin-bottom: 3px; font-size: 11px; background-color: #264d73; color: white;">-</button><br>
	
	                            </td>
	                        </tr>
	                        <c:set var="t_sumPrice" value="${t_sumPrice+cl.sumPrice}" />
	                        <input type="hidden" name="itemNo" value="${cl.itemNo}" />
	                        <input type="hidden" name="quantity" value="${cl.quantity}"/>
	                        <input type="hidden" name="category" value="${cl.category}" />
                        </c:forEach>
                    </tbody>
                    
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
                <br>
                <hr>
                <br>

                <div
                    style="border: 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
                    결제정보
                </div>
                <div>
                    <div class="radio">
                        <div>
                            <label>
                                <input type="radio" name="brand">
                                <span>신용카드</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>가상계좌</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>계좌이체</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>휴대폰결제</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>토스</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>카카오페이</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>네이버페이</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>차이페이</span>
                            </label>
                            <label>
                                <input type="radio" name="brand">
                                <span>페이코</span>
                            </label>
                        </div>
                    </div>
                </div>

                <br>
                <hr>
                <br>

                <div
                    style="border: 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
                    최종 결제 금액
                </div>
                <table class="cal">
                    <tr>
                        <th>총 상품금액</th>
                        <th>총 배송비</th>
                        <th>총 할인금액</th>
                        <th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
                    </tr>

                    <tr style="background-color: #fff;">
                        <td style="padding: 22px 0;"><span class="price"><fmt:formatNumber value="${t_sumPrice}" pattern="#,###"/></span>원</td>
                        <td>+&nbsp;<span class="price"><fmt:formatNumber value="${fee}" pattern="#,###"/></span>원</td>
                        <td>-&nbsp;<span style="color: blue;" class="price"><fmt:formatNumber value="0" pattern="#,###"/></span></span>원</td>
                        <td>=&nbsp;<span class="price"><fmt:formatNumber value="${t_sumPrice+fee}" pattern="#,###"/></span>원</td>
                    </tr>
                </table>

                <br><br>
                <div align="center">
                    <button class="btn default_btn" id="all_product" onclick="pay()">결제하기</button>
                    <span class="clearboth"></span>
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
    
    <script>
    	function pay() {
    		alert('결제가 완료되었습니다.');
    		document.bill.submit();
    	}
    </script>
</body>
</html>