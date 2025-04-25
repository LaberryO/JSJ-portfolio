<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String where = null;
	String status = null;

	String id = request.getParameter("id");
	try {
		if (id != null) {
			int productId = Integer.valueOf(id);
			String sql = "select productId from product where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				where = "deleteProduct";
				status = "IdNotFound";
				return;
			} else {
				String deleteSQL = "delete from product where productId=?";
				pstmt = conn.prepareStatement(deleteSQL);
				pstmt.setInt(1, productId);
				pstmt.executeUpdate();
				where = "deleteProduct";
				status = "DeleteProduct";
			}
		}
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