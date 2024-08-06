<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>

	<h2>게시물 목록</h2>

	<ul>
		<%
		if (articleRows != null && !articleRows.isEmpty()) {
			for (Map<String, Object> articleRow : articleRows) {
		%>
		<li><%=articleRow.get("id")%>번, <%=articleRow.get("regDate")%>, <%=articleRow.get("title")%>,
			<%=articleRow.get("body")%></li>
		<%
		}
		} else {
		%>
		<li>게시물이 없습니다.</li>
		<%
		}
		%>
	</ul>
</body>
</html>