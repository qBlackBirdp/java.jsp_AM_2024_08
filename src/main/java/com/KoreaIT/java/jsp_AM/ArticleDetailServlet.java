package com.KoreaIT.java.jsp_AM;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/detail")
public class ArticleDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // DB 연결
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("클래스 로드 실패");
            e.printStackTrace();
        }

        String url = "jdbc:mysql://127.0.0.1:3306/AM_JDBC_2024_07?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul";
        String user = "root";
        String password = "1234";

        Connection conn = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("DB 연결 성공!");

            DBUtil dbUtil = new DBUtil(request, response);

            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                response.getWriter().append("ID 파라미터가 없습니다.");
                return;
            }

            int id = Integer.parseInt(idParam);

            String sql = String.format("SELECT * FROM article WHERE id = %d", id);
            System.out.println("실행할 SQL: " + sql);

            Map<String, Object> articleRow = dbUtil.selectRow(conn, sql);
            if (articleRow == null) {
                response.getWriter().append("해당 ID의 게시물이 없습니다.");
                return;
            }

            request.setAttribute("articleRow", articleRow);
            request.getRequestDispatcher("/jsp/article/detail.jsp").forward(request, response);

        } catch (SQLException e) {
            System.out.println("SQL 에러: " + e.getMessage());
            e.printStackTrace(response.getWriter());
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
