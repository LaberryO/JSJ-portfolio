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
	<div class="container mt-5 pt-5">
		<div class="row mt-5">
			<div class="col-6">
				<h1><fmt:message key="cartTitle" /></h1>
			</div>
		</div>
		<div class="row mt-5">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="processDeleteCart.jsp" class="btn btn-danger"><fmt:message key="cartDelete" /></a>
					</td>
					<td align="right">
						<a href="" class="btn btn-success"><fmt:message key="cartOrder" /></a>
					</td>
				</tr>
			</table>
		</div>
		<div class="row">
			<table width="100%">
				<tr>
					<th><fmt:message key="cartProduct" /></th>
					<th><fmt:message key="unitPrice" /></th>
					<th><fmt:message key="cartQuantity" /></th>
					<th><fmt:message key="cartSubTotal" /></th>
					<th><fmt:message key="cartMisc" /></th>
				</tr>
				<%
					int sum = 0; // 결제 총액
					String sql = "select * from v_cart where userId=?";
					String user = (String) session.getAttribute("userId");
                	pstmt = conn.prepareStatement(sql);
                	pstmt.setString(1, user);
                	rs = pstmt.executeQuery();
                	while(rs.next()) {
					sum += rs.getInt("subTotal");
                		/* ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartList == null) cartList = new ArrayList<Product>();
					for(int i=0; i<cartList.size(); i++) {
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity(); // total = 소계
						sum += total; */
				%>
				<tr>
					<td><%=rs.getString("productId") %> - <%=rs.getString("productName") %></td>
					<td><%=rs.getString("unitPrice") %></td>
					<td><%=rs.getString("quantity") %></td>
					<td><%=rs.getString("subTotal") %></td>
					<td><a href="processDeleteCart.jsp?id=<%=rs.getString("productId") %>" class="badge badge-danger"><fmt:message key="cartSingleDelete" /></a></td>
				</tr>
				
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th><fmt:message key="cartTotal" /></th>
					<th><%=sum %></th>
					<th></th>
				</tr>
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
</body>
</fmt:bundle>
</html>