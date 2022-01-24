<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myCss/payment.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="frame">
        <form>
            <div id="frame2">
                <span style="font-size: 16pt; font-weight: bold;">주문/결제내역</span>
                <span class="home">홈 > 결제내역</span>
                <span></span>
            </div>
            <br>

            <div>
                <table class="bd">
                    <thead>
                        <tr>
                            <th colspan="10" style="text-align: left; padding-left: 10px;">일반상품(<%=request.getAttribute("count") %>)</th>
                        </tr>
                        <tr>
                            <th style="width: 20%;"><span>이미지</span></th>
                            <th style="width: 20%;"><span>상품정보</span></th>
                            <th>수량</th>
                            <th style="width: 100px;">날짜</th>
                            <th>배송구분</th>
                            <th>가격<br>(배송비 미포함)</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<c:set var="t_sumPrice" value="0" />
                    	<c:forEach var="pl" items="${payList}">
	                        <tr style="height: 90px; background-color: #fff;">
	                            <td style="border-left: none; border-right: none;">
	                                <img style="width: 30%; background-color: beige;" src="<%=request.getContextPath()%>/im/${pl.fileName}">
	                            </td>
	                            <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
	                            	${pl.itemName}
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${pl.category eq 'shopping'}">
	                            			${pl.quantity}개
	                            		</c:when>
	                            		<c:otherwise>
	                            			-
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td>${pl.payDate}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${pl.category eq 'shopping'}">
	                            			기본 배송
	                            		</c:when>
	                            		<c:otherwise>
	                            			-
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td><span>${pl.sumPrice}</span>원</td>
	                        
	                            <td style="color: blue; font-weight: bold;">${pl.state}</td>
	                        </tr>
	                        <c:set var="t_sumPrice" value="${t_sumPrice+pl.sumPrice}" />
                        </c:forEach>
                    </tbody>

                    <tfoot>
                        <tr style="height: 60px">
                            <td colspan="5" style="border-right: none; text-align: left; padding-left: 30px;">
                                <span>총 사용 금액</span>
                            </td>
                            <td colspan="5" style="border-left: none; text-align: right; padding-left: 10px;">
                                <span style="font-weight: bold; font-size: 15pt; padding-right: 30px;">₩<fmt:formatNumber value="${t_sumPrice}" pattern="#,###"/></span>
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <br><br><br><br>

                <div style="border: 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
                    이용안내
                </div>
                <div style="border: 1px solid #e0e0eb; height: 620px; font-size: 12pt; padding-left: 10px; padding-right: 10px;">
                    <br>주문 접수
                    <ul>
                        <li class="info">가상 계좌 주문이 완료되었습니다.</li>
                    </ul>
                    <br>예약 완료
                    <ul>
                        <li class="info">예약이 완료되었습니다.</li>
                    </ul>
                    <br>입금 확인
                    <ul>
                        <li class="info">주문하신 상품의 결제가 완료되었습니다.</li>
                    </ul>
                    <br>출고 처리 중
                    <ul>
                        <li class="info">주문하신 상품을 택배 업체로 전달할 수 있게 준비 중입니다.</li>
                    </ul>
                    <br>출고 완료
                    <ul>
                        <li class="info">상품을 배송하기 위한 준비가 완료되어 출고지에서 택배 업체로 전달되었습니다.</li>
                    </ul>
                    <br>배송 시작
                    <ul>
                        <li class="info">택배 업체가 출고지로부터 전달받은 상품을 고객님의 배송지 주소로 안전하게 배송 중입니다.</li>
                    </ul>
                    <br>배송 완료
                    <ul>
                        <li class="info">주문하신 상품이 배송지 주소에 잘 도착했습니다.</li>
                    </ul>
                    <br>구매 확정
                    <ul>
                        <li class="info">상품을 정상적으로 수령하여 구매를 확정했습니다.</li>
                    </ul>
                    <br>주문 취소
                    <ul>
                        <li class="info">가상 계좌 주문이 입금 전 취소되었습니다.</li>
                    </ul>
                </div>
            </div>    
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>