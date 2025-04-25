<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String where = null;
	String status = null;
	try {
		request.setCharacterEncoding("UTF-8");
		
		int productId = Integer.valueOf(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		String unitPrice = request.getParameter("unitPrice");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		String condition = request.getParameter("condition");
		String quantity = request.getParameter("quantity");
		
		int price;
		if (unitPrice.isEmpty()) price = 0;
		price = Integer.valueOf(unitPrice);
		
		int iquantity;
		if (quantity.isEmpty()) iquantity = 0;
		iquantity = Integer.valueOf(quantity);
		
		String sql = "update product set productName=?, unitPrice=?, description=?, category=?, condition=?, quantity=? where productId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productName);
	    pstmt.setInt(2, price);
	    pstmt.setString(3, description);
	    pstmt.setString(4, category);
	    pstmt.setString(5, condition);
	    pstmt.setInt(6, iquantity);
	    pstmt.setInt(7, productId);
	    pstmt.executeUpdate();
	    
	    where = "index";
	    status = "UpdateProduct";
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