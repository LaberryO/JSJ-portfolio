<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Agency - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<%@ include file="nav.jsp" %>
<fmt:bundle basename="bundle.message">
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		String where = null;
		String status = null;
		Boolean isProblem = false;
		
		String user = (String) session.getAttribute("userId");
		if (!"admin".equals(user)) {
			isProblem = true;
			return;
		}
		DecimalFormat df = new DecimalFormat("00000");	
		String id = request.getParameter("id");
		
		try {
			if (id != null) {
				int productId = Integer.valueOf(id);
				String sql = "select * from product where productId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(!rs.next()) {
					System.out.println("id가 존재하지 않습니다.");
					isProblem = true;
					return;
				}
	%>
	<div class="container mt-5 pt-5">
		<div class="row mt-5">
			<div class="col-6">
				<h1><fmt:message key="updateProduct" /></h1>
			</div>
		</div>
		<div class="row">
	<form class="g-3" action="processUpdateProduct.jsp" method="post" name="updateProduct" onsubmit="return form_check('product')">
    <div class="row m-3">
        <div class="col-2">
            <label for="productId"><fmt:message key="productId" /></label>
        </div>
        <div class="col-4">
            <input type="text" class="form-control" id="productId" 
                   name="productId" 
                   value="<%=df.format(productId) %>" readonly>
        </div>
    </div>
    <div class="row m-3">
        <div class="col-2">
            <label for="productName"><fmt:message key="productName" /></label>
        </div>
        <div class="col-4">
            <input type="text" class="form-control" id="productName"
                   name="productName" 
                   value="<%= StringEscapeUtils.escapeHtml4(rs.getString("productName") != null ? rs.getString("productName") : "") %>">
        </div>
    </div>
    <div class="row m-3">
        <div class="col-2">
            <label for="unitPrice"><fmt:message key="unitPrice" /></label>
        </div>
        <div class="col-4">
            <input type="text" class="form-control" id="unitPrice"
                   name="unitPrice" 
                   value="<%= StringEscapeUtils.escapeHtml4(rs.getString("unitPrice") != null ? rs.getString("unitPrice") : "") %>">
        </div>
    </div>
    <div class="row m-3">
        <div class="col-2">
            <label for="description"><fmt:message key="description" /></label>
        </div>
        <div class="col-4">
            <input type="text" class="form-control" id="description"
                   name="description" 
                   value="<%= StringEscapeUtils.escapeHtml4(rs.getString("description") != null ? rs.getString("description") : "") %>">
        </div>
    </div>
    <div class="row m-3">
        <div class="col-2">
            <label for="category"><fmt:message key="category" /></label>
        </div>
        <div class="col-4">
            <input type="text" class="form-control" id="category"
                   name="category" 
                   value="<%= StringEscapeUtils.escapeHtml4(rs.getString("category") != null ? rs.getString("category") : "") %>">
        </div>
    </div>
    <div class="row m-3">
        <div class="col-2">
            <label for="condition"><fmt:message key="condition" /></label>
        </div>
        <div class="col-4">
            <%
                String condition = rs.getString("condition");
                if ("New".equals(condition)) {
            %>
                <input type="radio" id="New" value="New" name="condition" checked>
                <label for="New"><fmt:message key="condition_New" /></label>
                <input type="radio" id="Old" value="Old" name="condition">
                <label for="Old"><fmt:message key="condition_Old" /></label>
            <%
                } else {
            %>
                <input type="radio" id="New" value="New" name="condition">
                <label for="New"><fmt:message key="condition_New" /></label>
                <input type="radio" id="Old" value="Old" name="condition" checked>
                <label for="Old"><fmt:message key="condition_Old" /></label>
            <%
                }
            %>
        </div>
    </div>
    <div class="row m-3">
        <div class="col-2">
            <label for="quantity"><fmt:message key="quantity" /></label>
        </div>
        <div class="col-4">
            <input type="text" class="form-control" id="quantity"
                   name="quantity" 
                   value="<%= StringEscapeUtils.escapeHtml4(rs.getString("quantity") != null ? rs.getString("quantity") : "") %>">
        </div>
    </div>
    <div class="row m-3">
        <div class="col-6">
            <button type="submit" class="btn btn-secondary mb-3 btn-block">
                <fmt:message key="updateProduct" />
            </button>
        </div>
    </div>
</form>
			</div>
	</div>
	<%	
			}
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
			
			if (isProblem == true) {
				if (where == null) where = "index";
			    if (status == null) status = "InvalidRequest";
				response.sendRedirect(where+".jsp?status="+status);
			}
		}
	%>
	<%@ include file="footer.jsp" %>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script src="js/validation.js"></script>
</body>
</fmt:bundle>
</html>