<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/signupFrm.css" rel="stylesheet" type="text/css"/>
<style>
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
<script type="text/javascript">
		function joinCheck(){
			var form = document.joinFrm;
			var id = form.userId.value;
			var pwd = form.userPwd.value;
			var pwd2 = form.userPwd2.value;
			var name = form.userName.value;
			var birth = form.birthday.value;
			var address = form.address.value;
			var email = form.email.value;
			var phoneNo = form.phoneNo.value;
			
			if(id ==""){
				form.reset();
				alert("아이디를 입력해주세요");
				//form.userId.focus();
				//debugger;
				return false;
			}else if(pwd ==""){
				alert("패스워드를 입력해주세요")
				form.userPwd.focus();
				return false;
			}else if(pwd2 ==""){
				alert("패스워드 재확인을 입력해주세요")
				form.userPwd.focus();
				return false;
			}
			else if(name ==""){
				alert("이름을 입력해주세요")
				form.userPwd.focus();
				return false;
			}
			else if(birth ==""){
				alert("생년월일을 입력해주세요")
				form.userPwd.focus();
				return false;
			}
			else if(address ==""){
				alert("주소를 입력해주세요")
				form.userPwd.focus();
				return false;
			}
			else if(email ==""){
				alert("이메일을 입력해주세요")
				form.userPwd.focus();
				return false;
			}
			else if(phoneNo ==""){
				alert("전화번호를 입력해주세요")
				form.userPwd.focus();
				return false;
			}
			return true;	
		}
	</script>
</head>
<body>
 	<%
		request.setCharacterEncoding("utf-8");
		String msg = (String)request.getAttribute("msg");
		System.out.println(msg);
	%>
	<script>
		var msg = "<%=msg%>";
		/* alert(msg); */
		
		if(!(msg == 'null')){
			alert(msg);
		}
	</script>
	
   <jsp:include page="header.jsp"/>
   <h1 style="text-align: center;
	color: #a48be0;
	font-weight: 300;
	padding: 40px 0 20px 0;
	margin: 0;">집사 등록</h1>
   <div class="tabs">
   <div class="main-signup">
        <!--회원가입 부분-->
		<section class="signup-wrap">
			<form name="joinFrm" action="joinProc.member" onsubmit="return joinCheck()" method="post">
				<div>
					<!--아이디,비번,비번재확인-->
					<h3 class="font_base">아이디</h3>
					<span class="signup-input"> 
					<input id="signup-id" type="text" name="userId" placeholder=" ID">
					</span>

					<h3 class="font_base">비밀번호</h3>
					<span class="signup-input">
					<input id="signup-pw" type="password" name="userPwd" placeholder=" PW">
					<span class="pw-lock"></span>
					</span>
					
					<h3 class="font_base">비밀번호 재확인</h3>
					<span class="signup-input">
					<input id="signup-pw" type="password" name="userPwd2" placeholder=" PW 재확인">
					<span class="pw-lock"></span>
					</span>
				</div>
				<div>
					<!--이름,생년월일,성별,이메일-->
					<h3 class="font_base">이름</h3>
					<span class="signup-input">
					<input id="signup-name" type="text" name="userName" placeholder=" 이름">
					</span>
					
					<h3 class="font_base">생년월일</h3>
					<span class="signup-input">
					<input id="signup-birth-yy" type="date" name="birthday" value="1995-01-01">
					</span>
					
					<h3 class="font_base">주소</h3>
					<span class="signup-input">
					<input id="signup-address" type="text" name="address" placeholder=" 주소">
					</span>
					
					<h3 class="font_base">이메일</h3>
					<span class="signup-input"> 
					<input id="signup-email" type="text" name="email" placeholder=" e-mail">
					</span>
				</div>
				<div>
					<!--휴대전화-->
					<h3 class="font_base">휴대전화</h3>
					<span class="signup-input">
					<input id="signup-phone" type="text" name="phoneNo" placeholder=" 전화번호 입력">
					</span>
				</div>
				<!--가입하기-->
				<div class="signup-btn-wrap">
					<input type="submit" id="signup-btn" value="Complete">
				</div>
			</form>
		</section>
    </div>
    </div>
    <jsp:include page="footer.jsp"/>
    
</body>
</html>