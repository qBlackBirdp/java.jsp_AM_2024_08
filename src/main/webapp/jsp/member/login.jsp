<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Map<String, Object> articleRow = (Map<String, Object>) request.getAttribute("articleRow");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<h2>로그인</h2>
	<!-- 게시물 작성 폼 -->
	<script type="text/javascript">
		function JoinForm__submit(form) {
			// 확인용 콘솔 로
			// 			console.log('form.loginId.value : ' + form.loginId.value);
			// 			console.log('form.loginId.value.trim() : '
			// 					+ form.loginId.value.trim());
			// 			console.log('form.loginId.value.trim : ' + form.loginId.value.trim);
			// 			console.log('form.loginPw.value : ' + form.loginPw.value);
			// 			console.log('form.loginPwConfirm.value : '
			// 					+ form.loginPwConfirm.value);
			// 			console.log('form.name.value : ' + form.name.value);
			// 			form.loginId.value = form.loginId.value.trim();
			// 			console.log("loginId : " + loginId);

			let loginId = form.loginId.value.trim();
			let loginPw = form.loginPw.value.trim();
			let loginPwConfirm = form.loginPwConfirm.value.trim();
			let name = form.name.value.trim();

			if (loginId.length == 0) {
				alert('아이디 입력해주세요');
				return;
			}
			if (loginPw.length == 0) {
				alert('비밀번호 입력해주세요');
				return;
			}

			form.submit();

		}
	</script>

	<!-- 	<a onclick="if(confirm('진짜 이동???') == false) return false;" href="https://www.naver.com" target="_blank">네이버</a> -->

	<form action="dologin" method="post"
		onsubmit="JoinForm__submit(this); return false;">
		<div>
			<label for="loginId">아이디:</label> <input autocomplete="off"
				type="text" id="loginId" name="loginId" required>
		</div>
		<div>
			<label for="loginPw">비밀번호:</label> <input autocomplete="off"
				id="content" name="loginPw" type="password" required></input>
		</div>
		
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>

	<div>
		<a style="color: green" href="list">리스트로 돌아가기</a>
	</div>

</body>
</html>
