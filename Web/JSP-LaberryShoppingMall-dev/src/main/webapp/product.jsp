<%@page import="java.text.DecimalFormat"%>
<%@page import="com.jsj.util.ConditionTranslator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <script>
        	function addToCart() {
        		if(confirm("상품을 추가하시겠습니까?")) {
        			document.addForm.submit();
        		} else {
        			document.addForm.reset();
        		}
        	}
        </script>
</head>
<%@ include file="nav.jsp" %>
<fmt:bundle basename="bundle.message">
<body id="page-top">
	<div class="container mt-5 pt-5">
		<div class="row mt-5">
			<div class="col-6">
				<h1><fmt:message key="productInfo" /></h1>
			</div>
			<%-- <div class="col-6" align="right">
				<a class="btn btn-secondary m-1" onclick="changeLanguage('ko')"><fmt:message key="korean" /></a>
				<a class="btn btn-secondary m-1" onclick="changeLanguage('en')"><fmt:message key="english" /></a>
			</div> --%>
		</div>
		<%@ include file="dbconn.jsp" %>
		<%
			String id = request.getParameter("id");
			String sql = "select * from product where productId='"+id+"'";
        	pstmt = conn.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	if(!rs.next()) {
        		response.sendRedirect("index.jsp?status=InvalidRequest");
        		return;
        	}
        		int productId = rs.getInt("productId");
				DecimalFormat df = new DecimalFormat("00000");
        		String condition = ConditionTranslator.translateCondition(rs.getString("condition"));
		%>
		<div class="row">
			<div class="col-md-6">
				<img src="assets/img/product/<%=rs.getString("fileName") %>" class="img-fluid">
			</div>
			<div class="col-md-6">
	  			<h3><%=rs.getString("productName") %></h3>
	  			<p><%=rs.getString("description") %></p>
	  			<p><b><fmt:message key="productId" /> : </b><span><%=df.format(productId) %></span></p>
	  			<p><b><fmt:message key="category" /> : </b><span><%=rs.getString("category") %></span></p>
	  			<p><b><fmt:message key="condition" /> : </b><span><%=condition %></span></p>
	  			<p><b><fmt:message key="unitPrice" /> : </b><span><%=rs.getString("unitPrice") %></span></p>
  				<p>
  				<form action="processAddCart.jsp?id=<%=rs.getString("productId")%>" name="addForm" method="post">
  					<button class="btn btn-info" onclick="addToCart();"><fmt:message key="addToCart" /></button>
  					<a href="cart.jsp" class="btn btn-danger me-1" ><fmt:message key="intoCart" /> &raquo;</a>
  					<a onclick="gotoIndex('portfolio',event)" class="btn btn-secondary"><fmt:message key="returnProduct" /> &raquo;</a>
  				</form>
  					
  				</p>
			</div>
		</div>
	</div>
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
	<script src="js/checkStatus.js"></script>
</body>
</fmt:bundle>
</html>
