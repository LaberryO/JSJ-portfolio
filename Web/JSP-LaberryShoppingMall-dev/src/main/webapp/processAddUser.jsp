<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
	String where = null;
	String status = null;
	try {
		request.setCharacterEncoding("UTF-8");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");


		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPw = request.getParameter("userPW");
		String userPhone = request.getParameter("userPhone");
		String userAddr = request.getParameter("userAddr");
		String userBirth = birthYear + "-" + birthMonth + "-" + birthDay;
		String userEmail = request.getParameter("userEmail");
		
		String sql = "insert into member values(?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD'),?,sysdate)";
		pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, userId);
	    pstmt.setString(2, userPw);
	    pstmt.setString(3, userName);
	    pstmt.setString(4, userPhone);
	    pstmt.setString(5, userAddr);
	    pstmt.setString(6, userBirth);
	    pstmt.setString(7, userEmail);
	    pstmt.executeUpdate();
	    
	    where = "index";
	    status = "register";
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
	        if (pstmt != null) pstmt.close();
	        if (conn != null) conn.close();
		}  catch (SQLException e) {   
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