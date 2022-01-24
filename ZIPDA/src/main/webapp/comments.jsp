<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="myCss/comments.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
		 if(${userId==null}){
		      alert("로그인이 필요합니다.");
		      return false;
		   }
	}
</script>
</head>
<body>
	<div id="frame">
		<label for="content">comment</label>
		<form name="newWrite" action="writeProc.comment" method="post" onsubmit="return checkForm()">
			<div class="input-group">
				<input type="hidden" name="itemNo" value="${param.itemNo}" />
				<textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력하세요."></textarea>
			</div>
			<span class="input-group-btn">
                   <button class="btn btn-outline-dark" style="margin-top: 10px;" name="commentInsertBtn">등록</button>
            </span>
		</form>
		
		<div class="commentList">
			<table class="table">
				<thead>
					<tr>
						<th scope="col" width="10%">번호</th>
						<th scope="col" width="10%">작성자</th>
						<th scope="col">내용</th>
						<th scope="col" width="10%">작성일</th>
						<th scope="col" width="10%"></th>
					</tr>
				</thead>
				<c:forEach var="item" items="${CAL}" varStatus="status">
					<tbody>
						<tr>
							<th scope="row">${status.count}</th>
							<td>${item.userId}</td>
							<td>${item.content}</td>
							<td>${item.regdate}</td>
							<c:choose>
								<c:when test="${userId eq 'admin' or userId eq item.userId}">
									<td align="center" style="vertical-align: middle;"><a href="deleteComment.comment?comNo=${item.comNo}"><span class="badge badge-pill badge-danger">삭제</span></a></td>
								</c:when>
								<c:when test="${empty userId or userId ne item.userId}">
									<td></td>
								</c:when>
							</c:choose>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>