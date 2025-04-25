<%@page import="com.jsj.util.DateController"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	// String tempUser = "test"; // 임시 유저
	
	System.out.println("[ "+DateController.ft5Date()+" ]");
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "C##dbexam";
		String password = "m1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 등록 성공");
		
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("접속 성공");
		
		if(conn != null) System.out.println("db연결 확인 성공");
	} catch(Exception e) {
		System.out.println("데이터베이스 연결에 실패하였습니다. <br>");
		System.out.println("Exception: "+e.getMessage());
	}
	System.out.println("----------");
%>
</body>
</html>