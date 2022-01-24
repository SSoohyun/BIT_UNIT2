<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/loginFrm.css" rel="stylesheet" type="text/css"/>
<style>
.tabs {
	left: 50%;
	transform: translateX(-50%);
	position: relative;
	background: rgba(245, 245, 245, 0.8);
	padding: 0px 50px 50px 50px;
	padding-bottom: 80px;
	width: 40%;
	height: 600px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	border-radius: 5px;
	min-width: 240px;
	margin-top:100px;
	margin-bottom: 100px;
}
</style>
</head>
<script type="text/javascript">
		function login(){
			var form = document.loginFrm;
			var id = form.userId.value;
			var pwd = form.userPwd.value;
			
			if(id ==""){
				alert("아이디를 입력해주세요");
				form.userId.focus();
				//debugger;
				return false;
			}else if(pwd ==""){
				alert("패스워드를 입력해주세요")
				form.userPwd.focus();
				return false;
			}
			return true;	
		}
	</script>
	
<body>
<%
		request.setCharacterEncoding("utf-8");
		String msg = (String)request.getAttribute("msg");
	%>
	<script>
		var msg = "<%=msg%>";
		/* alert(msg); */
		if(!(msg == 'null')){
			alert(msg);
		}
	</script>
	
	
	<jsp:include page="header.jsp"/>
	
   <div class="tabs">
    <div class="main-container">
		<div class="main-wrap">
		<section class="login-input-section-wrap">
			<div class="login-container"><h1>Welcome, &nbsp;ZIP사</h1></div>
				<form action="loginProc.member" onsubmit="return login()" name="loginFrm" method="post">
					<div class="login-input-wrap">
						<input placeholder=" UserId" type="text" name="userId"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input placeholder=" Password" type="password" name="userPwd"></input>
					</div>
					<div class="login-button-wrap">
						<a class="fb"><button class="login-button"><h2>Login</h2></button></a>
					</div>
				</form>
			<p class="forget-msg">Don`t you have ZIP:DA ID? | <a class="fb" href='signupFrm.jsp'>Sign up</a></p>
		</section>
		</div>
	</div>
	</div>
	<jsp:include page="footer.jsp"/>
	
	
	

</body>
</html>