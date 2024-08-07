package com.KoreaIT.java.jsp_AM.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.jsp_AM.util.DBUtil;
import com.KoreaIT.java.jsp_AM.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/write")
public class ArticleWriteServlet extends HttpServlet {
	

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("/jsp/article/write.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // DB 연결
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("클래스를 찾을 수 없습니다.");
            e.printStackTrace();
        }

        String url = "jdbc:mysql://127.0.0.1:3306/AM_JDBC_2024_07?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul";
        String user = "root";
        String password = "1234";

        Connection conn = null;

        try {
            conn = DriverManager.getConnection(url, user, password);

            String title = request.getParameter("title");
            String body = request.getParameter("content");

            SecSql sql = SecSql.from("INSERT INTO article");
            sql.append("SET regDate = NOW(),");
            sql.append("updateDate = NOW(),");
            sql.append("title = ?,", title);
            sql.append("`body`= ?,", body);
            sql.append("memberId = ?", 1); // 작성자 ID는 하드코딩 (예시용, 실제로는 세션에서 가져와야 함)

            int id = DBUtil.insert(conn, sql);

            response.getWriter().append(String.format(
                "<script>alert('%d번 글이 작성되었습니다.'); location.replace('detail?id=%d');</script>", id, id));

        } catch (SQLException e) {
            System.out.println("SQL 에러: " + e.getMessage());
            response.getWriter().append("<script>alert('글 작성에 실패했습니다.'); history.back();</script>");
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}