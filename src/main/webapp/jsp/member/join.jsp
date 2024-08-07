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
<title>회원가입</title>
</head>
<body>

    <h2>회원가입</h2>
	<!-- 게시물 작성 폼 -->
    <form action="dojoin" method="post">
        <div>
            <label for="loginId">아이디:</label>
            <input autocomplete = "off" type="text" id="loginId" name="loginId" required>
        </div>
        <div>
            <label for="loginPw">비밀번호:</label>
            <input autocomplete = "off" id="content" name="loginPw" required></input>
        </div>
        <div>
            <label for="loginPw">비밀번호 확인:</label>
            <input autocomplete = "off" id="content" name="loginPw" required></input>
        </div>
        <div>
            <label for="name">이름:</label>
            <input autocomplete = "off" id="content" name="name" required></input>
        </div>
        <div>
            <button type="submit">가입</button>
        </div>
    </form>
    
    <div>
        <a style="color: green" href="list">리스트로 돌아가기</a>
    </div>

</body>
</html>
