<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	System.out.println("processAddCart 진행 시작");
	String id = request.getParameter("id");
	String user = (String) session.getAttribute("userId");
	if (user == null) {
		response.sendRedirect("product.jsp?id="+id+"&status=NeedLogin");
		return;
	}
	
	// stmt = conn.createStatement();
	
	try {
	    /* // 1. 테이블 존재 여부 확인
	    String checkTableSQL = "SELECT COUNT(*) FROM all_tables WHERE table_name = ?";
	    pstmt = conn.prepareStatement(checkTableSQL);
	    pstmt.setString(1, user.toUpperCase());  // 테이블 이름은 대소문자 구분됨
	    rs = pstmt.executeQuery();

	    // 2. 테이블이 없으면 생성
	    if (rs.next() && rs.getInt(1) == 0) {
	        String createTableSQL = "CREATE TABLE " + user + " (" +
	                "productId VARCHAR2(10) NOT NULL, " +
	        		"userId varchar2(10) not null" +
	                "quantity NUMBER NOT NULL, " +
	                "CONSTRAINT buy FOREIGN KEY (productId) REFERENCES product(productId), " +
	                "constraint who foreign key (userId) references member(userId) " +
	                ")";
	        stmt.executeUpdate(createTableSQL);
	        System.out.println("Table 생성에 성공하였습니다!");
	    } else {
	        System.out.println("이미 존재하는 Table");
	    } */

	    // 3. `UPDATE` 또는 `INSERT` 처리
	    String updateSQL = "UPDATE cart SET quantity = quantity + 1 WHERE productId = ?";
	    pstmt = conn.prepareStatement(updateSQL);
	    pstmt.setString(1, id);
	    
	    int rowsUpdated = pstmt.executeUpdate();
	    
	    // 4. `UPDATE` 실패 시, `INSERT` 처리
	    if (rowsUpdated == 0) {
	        String insertSQL = "INSERT INTO cart VALUES (?, ?, ?)";
	        pstmt = conn.prepareStatement(insertSQL);
	        pstmt.setString(1, id);
	        pstmt.setString(2, user);
	        pstmt.setInt(3, 1);
	        
	        pstmt.executeUpdate();
	    }
	    
	    System.out.println("상품 추가 완료!");
	    
	} catch (SQLException e) {
	    System.out.println("SQL 문제 발생: " + e.getMessage());
	} finally {
		System.out.println("processAddCart 진행 완료");
		response.sendRedirect("product.jsp?id="+id+"&status=cart");
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