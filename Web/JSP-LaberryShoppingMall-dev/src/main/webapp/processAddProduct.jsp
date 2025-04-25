<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ include file="dbconn.jsp" %>
<%
	String where = null;
	String status = null;
	try {
		request.setCharacterEncoding("UTF-8");

		String realFolder = application.getRealPath("assets/img/product/");
		String encType = "UTF-8";
		int maxSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		String productId = multi.getParameter("productId");
		String productName = multi.getParameter("productName");
	    String unitPrice = multi.getParameter("unitPrice");
	    String description = multi.getParameter("description");
	    String category = multi.getParameter("category");
	    String condition = multi.getParameter("condition");
	    String quantity = multi.getParameter("quantity");
	    
	    int price;
	    if(unitPrice.isEmpty()) price = 0;
	    else price = Integer.valueOf(unitPrice);
	    
	    Enumeration files = multi.getFileNames();
	    String fname = (String)files.nextElement();
	    String fileName = multi.getFilesystemName(fname);
	    
	    int pquantity = Integer.valueOf(quantity);
	    
	    /* ProductRepository dao = ProductRepository.getInstance();
	    
	    Product newProduct = new Product();
	    newProduct.setProductId(productId);
	    newProduct.setProductName(productName);
	    newProduct.setUnitPrice(price);
	    newProduct.setDescription(description);
	    newProduct.setCategory(category);
	    newProduct.setCondition(condition);
	    newProduct.setFileName(fileName);
	    
	    dao.addProduct(newProduct);
	    System.out.print(newProduct.getProductId());
	    System.out.print("test");
	    System.out.print(dao); */
	    String sql = "insert into product (productName, unitPrice, description, category, condition, fileName, quantity) values (?,?,?,?,?,?,?)";
	    pstmt = conn.prepareStatement(sql);
	    /* pstmt.setString(1, productId); */
	    pstmt.setString(1, productName);
	    pstmt.setInt(2, price);
	    pstmt.setString(3, description);
	    pstmt.setString(4, category);
	    pstmt.setString(5, condition);
	    pstmt.setString(6, fileName);
	    pstmt.setInt(7, pquantity);
	    pstmt.executeUpdate();
	    
	    where = "index";
	    status = "AddProduct";
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