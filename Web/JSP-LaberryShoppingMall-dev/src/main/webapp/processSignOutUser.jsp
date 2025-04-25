<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String) session.getAttribute("userId");
	if (userId != null) session.removeAttribute("userId");

	response.sendRedirect("index.jsp?status=logout");
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