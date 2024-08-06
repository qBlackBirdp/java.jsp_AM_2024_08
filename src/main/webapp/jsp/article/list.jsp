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

	<h2>게시물 목록 v1</h2>

	<ul>
    <% 
        if (articleRows != null && !articleRows.isEmpty()) {
            for (int i = 0; i < articleRows.size(); i++) {
                Map<String, Object> article = articleRows.get(i);
    %>
        <li><%=article.get("id")%>번, <%=article.get("regDate")%>, <%=article.get("title")%>, <%=article.get("body")%></li>
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