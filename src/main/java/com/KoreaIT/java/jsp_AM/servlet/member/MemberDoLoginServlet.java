package com.KoreaIT.java.jsp_AM.servlet.member;

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


@WebServlet("/member/dologin")
public class MemberDoLoginServlet extends HttpServlet {
	

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

            String loginId = request.getParameter("loginId");
            String loginPw = request.getParameter("loginPw");
            
            SecSql sql = SecSql.from("SELECT *");
			sql.append("FROM `member`");
			sql.append("WHERE loginId = ?;", loginId);

			Map<String, Object> memberRow = DBUtil.selectRow(conn, sql);

			if (memberRow.isEmpty()) {
				response.getWriter().append(String
						.format("<script>alert('%s는 존재하지 않습니다.'); location.replace('../member/login');</script>", loginId));
				return;
			}
			
			if (!memberRow.get("loginPw").equals(loginPw)) {
				response.getWriter().append(String
						.format("<script>alert('비밀번호가 일치하지 않습니다.'); location.replace('../member/login');</script>"));
				return;
			}

//            sql = SecSql.from("INSERT INTO `member`");
//            sql.append("SET regDate = NOW(),");
//            sql.append("updateDate = NOW(),");
//            sql.append("loginId = ?,", loginId);
//            sql.append("loginPw= ?,", loginPw);
//            sql.append("`name` = ?", name);


            response.getWriter().append(String.format(
                "<script>alert('%s 회원님 로그인 되었습니다.'); location.replace('../article/list');</script>", memberRow.get("name")));

        } catch (SQLException e) {
            System.out.println("SQL 에러: " + e.getMessage());
            response.getWriter().append("<script>alert('회원가입에 실패했습니다.'); history.back();</script>");
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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doGet(request, response);
        
    }
    
}