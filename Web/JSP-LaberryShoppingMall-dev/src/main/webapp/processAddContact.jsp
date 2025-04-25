<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String where = null;
	String status = null;
	try {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String date = request.getParameter("contactDate");
		String subject = request.getParameter("boardSubject");
		String message = request.getParameter("boardMessage");
		System.out.println(userId);
		System.out.println(userName);
		System.out.println(date);
		System.out.println(subject);
		System.out.println(message);
		
		String sql = "insert into board (userId, userName, boardDate, boardSubject, boardMessage) values (?,?,TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS'),?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		pstmt.setString(2, userName);
		pstmt.setString(3, date);
		pstmt.setString(4, subject);
		pstmt.setString(5, message);
		pstmt.executeUpdate();
		
		where = "index";
		status = "AddContact";
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
	        if (pstmt != null) pstmt.close();
	        if (conn != null) conn.close();
		} catch (SQLException e) {   
			e.printStackTrace();
		}
		if (where == null) where = "index";
	    if (status == null) status = "InvalidRequest";
		response.sendRedirect(where+".jsp?status="+status);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>