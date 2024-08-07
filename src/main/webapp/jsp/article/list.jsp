<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
int currentPage = (Integer) request.getAttribute("currentPage");
int totalPages = (Integer) request.getAttribute("totalPages");
int currentPageSize = (Integer) request.getAttribute("currentPageSize");
int[] pageSizes = (int[]) request.getAttribute("pageSizes");

int pageRange = 5; // 앞뒤로 보일 페이지 번호 수
int startPage = Math.max(1, currentPage - pageRange);
int endPage = Math.min(totalPages, currentPage + pageRange);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>

	<h2>게시물 목록</h2>

	<a href="../home/main">메인 페이지로 </a>
	
	<!-- 글 작성 페이지로 이동하는 링크 추가 -->
    <div>
        <a href="write">글 작성하기</a>
        <div>
        
        </div>
    </div>

    <!-- 페이지개수 정하기  -->
	
	<form method="get" action="">
        <label for="pageSize">페이지당 항목 수:</label>
        <select id="pageSize" name="pageSize" onchange="this.form.submit()">
            <% for (int size : pageSizes) { %>
                <option value="<%= size %>" <%= (size == currentPageSize) ? "selected" : "" %>><%= size %></option>
            <% } %>
        </select>
    </form>

	<table style="border-collapse: collapse; border-color: green;"
		border="1px">
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>제목</th>
				<th>내용</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Map<String, Object> articleRow : articleRows) {
			%>
			<tr style="text-align: center;">
				<td><%=articleRow.get("id")%></td>
				<td><%=articleRow.get("regDate")%></td>
				<td><%=articleRow.get("title")%></td>
				<td><%=articleRow.get("body")%></td>
				<td><a href="modify?id=<%=articleRow.get("id")%>">수정</a></td>
				<td><a href="doDelete?id=<%=articleRow.get("id")%>">삭제</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	
	<div>
        <% if (startPage > 1) { %>
            <a href="?page=1&pageSize=<%=currentPageSize%>">1</a>
            <% if (startPage > 2) { %>
                <span>...</span>
            <% } %>
        <% } %>
        <% for (int i = startPage; i <= endPage; i++) { %>
            <% if (i == currentPage) { %>
                <span><%=i%></span>
            <% } else { %>
                <a href="?page=<%=i%>&pageSize=<%=currentPageSize%>"><%=i%></a>
            <% } %>
        <% } %>
        <% if (endPage < totalPages) { %>
            <% if (endPage < totalPages - 1) { %>
                <span>...</span>
            <% } %>
            <a href="?page=<%=totalPages%>&pageSize=<%=currentPageSize%>"><%=totalPages%></a>
        <% } %>
    </div>

    <form method="get" action="">
        <label for="gotoPage">페이지로 이동:</label>
        <input type="number" id="gotoPage" name="page" min="1" max="<%=totalPages%>" value="<%=currentPage%>">
        <input type="hidden" name="pageSize" value="<%=currentPageSize%>">
        <button type="submit">이동</button>
    </form>

	<!-- 	<ul> -->
	<%-- 		<% --%>
	<%--// 		for (Map<String, Object> articleRow : articleRows) {--%>
	<%-- 		%> --%>
	<%-- 		<li><a href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("id")%>번, --%>
	<%-- 				<%=articleRow.get("regDate")%>,<%=articleRow.get("title")%>,<%=articleRow.get("body")%></a></li> --%>
	<%-- 		<% --%>
	<%--// 		}--%>
	<%-- 		%> --%>
	<!-- 	</ul> -->


</body>
</html>