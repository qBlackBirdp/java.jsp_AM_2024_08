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
<title>게시물 작성</title>
</head>
<body>

    <h2>게시물 작성</h2>
	<!-- 게시물 작성 폼 -->
    <form action="write" method="post">
        <div>
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div>
            <label for="body">내용:</label>
            <textarea id="content" name="content" rows="10" cols="50" required></textarea>
        </div>
        <div>
            <button type="submit">게시물 등록</button>
        </div>
    </form>
    
    <div>
        <a style="color: green" href="list">리스트로 돌아가기</a>
    </div>

</body>
</html>
