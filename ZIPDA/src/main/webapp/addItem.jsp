<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myCss/addItem.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1>상품 등록</h1>
	<div class="tabs">
		<input type="radio" id="tab1" name="tab-control" value="shopping" checked> 
		<input type="radio" id="tab2" name="tab-control" value="travel"> 
		<input type="radio" id="tab3" name="tab-control" value="service"> 
		<input type="radio" id="tab4" name="tab-control" value="hospital">
		<ul>
			<li title="first">
				<label for="tab1" role="button"> 
					<span style="font-size:30px">상품</span>
				</label>
			</li>
			<li title="second">
				<label for="tab2" role="button"> 
					<span style="font-size:30px">여행</span>
				</label>
			</li>
			<li title="third">
				<label for="tab3" role="button"> 
					<span style="font-size:30px">서비스</span>
				</label>
			</li>
			<li title="fourth">
				<label for="tab4" role="button"> 
					<span style="font-size:30px">병원</span>
				</label>
			</li>
		</ul>

		<div class="slider">
			<div class="indicator"></div>
		</div>
		<div class="content">
			<section>
				<div class="main-signup">
					<form name="product" onsubmit="return priceCheck()"action="insertItem.item" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="category" value="shopping"> 
						<div class="product-input"> 
							<input id="product-name" type="text" name="itemName" placeholder=" 상품명">
							</div>
							
							<div class="product-input"> 
							<input id="product-price" type="text" name="itemPrice" placeholder=" 상품 최저가격 ~ ">
							</div>
								
							<!-- <div class="product-input"> 
							<input id="product-phone" type="text" name="proPhoneNo" placeholder=" 전화번호 입력">
							</div> -->
							
							<div class="product-inputText"> 
							<input id="product-file" type="file" name="fileName" placeholder=" 파일명" accept="image/*">
							</div>
							
							<div class="product-inputText"> 
							<textarea id="product-descript" name="descript" placeholder=" 상품 상세 정보" rows="5"></textarea>
							</div>
							
							<div class="product-inputText"> 
							<input id="product-detail" type="text" name="detail" placeholder=" 상품 특징">
							</div>
							
						
							
							<div class="product-Register"> 
								<!-- <input id="product-button" type="submit" name="proButton" value="상품 등록" > -->
								<button id="product-button">상품 등록</button>
							</div>
					</form>
				</div>
			</section>

			<section>
				<div class="main-signup">
					<form name="product" action="insertItem.item" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="category" value="travel"> 
						<input id="product-id" type="hidden" name="proId">
						<div class="product-input">
							<input id="product-name" type="text" name="itemName2"
								placeholder=" 상품명">
						</div>

						<div class="product-input">
							<input id="product-price" type="text" name="itemPrice2"
								placeholder=" 상품 최저가격 ~ ">
						</div>

						<!-- <div class="product-input"> 
							<input id="product-phone" type="text" name="proPhoneNo" placeholder=" 전화번호 입력">
							</div> -->

						<div class="product-inputText">
							<input id="product-file" type="file" name="fileName2"
								placeholder=" 파일명">
						</div>

						<div class="product-inputText">
							<textarea id="product-descript" name="descript2"
								placeholder=" 상품 상세 정보" rows="5"></textarea>
						</div>

						<div class="product-inputText">
							<input id="product-detail" type="text" name="detail2"
								placeholder=" 상품 특징">
						</div>

						<div class="product-inputArea">
							<select name="area" id="product-area">
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="강원">강원</option>
								<option value="세종">세종</option>
								<option value="대전">대전</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
								<option value="광주">광주</option>
								<option value="대구">대구</option>
								<option value="제주">제주</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
							</select>
						</div>

						<div class="product-inputDetailLocation">
							<input id="product-Detailloc" type="text" name="loc"
								placeholder=" 상세 주소 입력">
						</div>

						<div class="product-input">
							<input id="product-tel" type="text" name="tel"
								placeholder=" 전화번호">
						</div>

						<div class="product-input">
							<input id="product-hours" type="text" name="hours"
								placeholder=" 운영시간 00:00 ~ 00:00">
						</div>

						<div class="product-Register">
							<input id="product-button" type="submit" name="proButton"
								value="상품 등록">
						</div>
					</form>
				</div>
			</section>
			<section>
				<div class="main-signup">
					<form name="product" action="insertItem.item" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="category" value="service"> 
						<input id="product-id" type="hidden" name="proId">
						<div class="product-input">
							<input id="product-name" type="text" name="itemName2"
								placeholder=" 상품명">
						</div>

						<div class="product-input">
							<input id="product-price" type="text" name="itemPrice2"
								placeholder=" 상품 최저가격 ~ ">
						</div>

						<!-- <div class="product-input"> 
							<input id="product-phone" type="text" name="proPhoneNo" placeholder=" 전화번호 입력">
							</div> -->

						<div class="product-inputText">
							<input id="product-file" type="file" name="fileName2"
								placeholder=" 파일명">
						</div>

						<div class="product-inputText">
							<textarea id="product-descript" name="descript2"
								placeholder=" 상품 상세 정보" rows="5"></textarea>
						</div>

						<div class="product-inputText">
							<input id="product-detail" type="text" name="detail2"
								placeholder=" 상품 특징">
						</div>

						<div class="product-inputArea">
							<select name="area" id="product-area">
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="강원">강원</option>
								<option value="세종">세종</option>
								<option value="대전">대전</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
								<option value="광주">광주</option>
								<option value="대구">대구</option>
								<option value="제주">제주</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
							</select>
						</div>

						<div class="product-inputDetailLocation">
							<input id="product-Detailloc" type="text" name="loc"
								placeholder=" 상세 주소 입력">
						</div>

						<div class="product-input">
							<input id="product-tel" type="text" name="tel"
								placeholder=" 전화번호">
						</div>

						<div class="product-input">
							<input id="product-hours" type="text" name="hours"
								placeholder=" 운영시간 00:00 ~ 00:00">
						</div>

						<div class="product-Register">
							<input id="product-button" type="submit" name="proButton"
								value="상품 등록">
						</div>
					</form>
				</div>
			</section>
			<section>
				<div class="main-signup">
					<form name="product" action="insertItem.item" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="category" value="hospital"> 
						<input id="product-id" type="hidden" name="proId">
						<div class="product-input">
							<input id="product-name" type="text" name="itemName2"
								placeholder=" 상품명">
						</div>

						<div class="product-input">
							<input id="product-price" type="text" name="itemPrice2"
								placeholder=" 상품 최저가격 ~ ">
						</div>

						<!-- <div class="product-input"> 
							<input id="product-phone" type="text" name="proPhoneNo" placeholder=" 전화번호 입력">
							</div> -->

						<div class="product-inputText">
							<input id="product-file" type="file" name="fileName2"
								placeholder=" 파일명">
						</div>

						<div class="product-inputText">
							<textarea id="product-descript" name="descript2"
								placeholder=" 상품 상세 정보" rows="5"></textarea>
						</div>

						<div class="product-inputText">
							<input id="product-detail" type="text" name="detail2"
								placeholder=" 상품 특징">
						</div>

						<div class="product-inputArea">
							<select name="area" id="product-area">
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="강원">강원</option>
								<option value="세종">세종</option>
								<option value="대전">대전</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
								<option value="광주">광주</option>
								<option value="대구">대구</option>
								<option value="제주">제주</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
							</select>
						</div>

						<div class="product-inputDetailLocation">
							<input id="product-Detailloc" type="text" name="loc"
								placeholder=" 상세 주소 입력">
						</div>

						<div class="product-input">
							<input id="product-tel" type="text" name="tel"
								placeholder=" 전화번호">
						</div>

						<div class="product-input">
							<input id="product-hours" type="text" name="hours"
								placeholder=" 운영시간 00:00 ~ 00:00">
						</div>

						<div class="product-Register">
							<input id="product-button" type="submit" name="proButton"
								value="상품 등록">
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</body>
</html>