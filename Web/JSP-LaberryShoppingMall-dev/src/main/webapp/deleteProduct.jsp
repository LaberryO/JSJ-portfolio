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
</head>
<%@ include file="nav.jsp" %>
<fmt:bundle basename="bundle.message">
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		String user = (String) session.getAttribute("userId");
		if (!"admin".equals(user)) {
			response.sendRedirect("index.jsp?status=InvalidRequest");
			return;
		}
	%>
	<div class="container mt-5 pt-5">
		<div class="row mt-5">
			<div class="col-6"><h1><fmt:message key="deleteProduct" /></h1></div>
		</div>
		<div class="row mt-5">
			<table width="100%">
				<tr>
					<th><fmt:message key="cartProduct" /></th>
					<th><fmt:message key="unitPrice" /></th>
					<th><fmt:message key="category" /></th>
					<th><fmt:message key="cartMisc" /></th>
				</tr>
				<%
					String sql = "select * from product";
                	pstmt = conn.prepareStatement(sql);
                	rs = pstmt.executeQuery();
                	while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("productId") %> - <%=rs.getString("productName") %></td>
					<td><%=rs.getString("unitPrice") %></td>
					<td><%=rs.getString("category") %></td>
					<td><a href="processDeleteProduct.jsp?id=<%=rs.getString("productId") %>" class="badge badge-danger"><fmt:message key="cartSingleDelete" /></a></td>
				</tr>
				
				<%
					}
				%>
			</table>
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