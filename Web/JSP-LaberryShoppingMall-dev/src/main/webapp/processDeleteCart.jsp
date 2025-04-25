<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String where = null;
	String status = null;
	try {
		String id = request.getParameter("id");
		String user = (String) session.getAttribute("userId");
		
		if (id != null) {
			String deleteSQL = "delete from cart where userId=? and productId=?";
			pstmt = conn.prepareStatement(deleteSQL);
			pstmt.setString(1, user);
			pstmt.setString(2, id);	
			System.out.println(id+"를 삭제했습니다.");
			status = "DeleteSingleCart";
		} else {
			String deleteSQL = "delete from cart where userId=?";
			pstmt = conn.prepareStatement(deleteSQL);
			pstmt.setString(1, user);
			System.out.println("모든 항목을 삭제했습니다.");
			status = "DeleteCart";
		}
		pstmt.executeUpdate();
		where = "cart";
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