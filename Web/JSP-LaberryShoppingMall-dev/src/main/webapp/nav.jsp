<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String lang = (String) session.getAttribute("language");
	if (lang == null || lang.isEmpty()) lang = "ko"; 
%>
<script>
	document.cookie = "language=<%=lang %>; path=/;";
</script>
<fmt:setLocale value='<%=lang %>' />
<fmt:bundle basename="bundle.message">
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: black">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><img src="assets/img/navbar-logo.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse d-flex justify-content-around" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" onclick="gotoIndex('services',event)" href="#services"><fmt:message key="whatService" /></a></li>
                        <li class="nav-item"><a class="nav-link" onclick="gotoIndex('portfolio',event)" href="#portfolio"><fmt:message key="whatProduct" /></a></li>
                        <li class="nav-item"><a class="nav-link" onclick="gotoIndex('about',event)" href="#about"><fmt:message key="whatAbout" /></a></li>
                        <li class="nav-item"><a class="nav-link" onclick="gotoIndex('team',event)" href="#team"><fmt:message key="whatTeam" /></a></li>
                        <li class="nav-item"><a class="nav-link" onclick="gotoIndex('contact',event)" href="#contact"><fmt:message key="whatContact" /></a></li>
                        <%
                        	/* System.out.println(session.getAttribute("userId")); */
                        	String userId = (String) session.getAttribute("userId");
                        	if ("admin".equals(userId)) {
                        %>
                        <li class="nav-item dropdown">
                        	<a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><fmt:message key="admin" /></a>
                        	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        		<li><a class="dropdown-item" href="addProduct.jsp"><fmt:message key="registerProduct" /></a></li>
                        		<li><a class="dropdown-item" href="index.jsp?edit=update#product"><fmt:message key="updateProduct" /></a></li>
                        		<li><a class="dropdown-item" href="deleteProduct.jsp"><fmt:message key="deleteProduct" /></a></li>
                        	</ul>
                        </li>
                        <%
                        	}
                        %>
                        <li class="nav-item dropdown">
                        	<a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        		<%
                        			if (userId != null) {
                        		%>
                        		<fmt:message key="navUser" />
                        		<%
                        			} else {                        		
                        		%>
                        		<fmt:message key="loginUser" />
                        		<%
                        			}
                        		%>
                        	</a>
                        	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        	<%
	                        	if (userId == null) {
                        	%>
                        		<li><a class="dropdown-item" href="signInUser.jsp"><fmt:message key="loginUser" /></a></li>
                        	<%
	                        	} else {
                        	%>
                        		<li><a class="dropdown-item" href="processSignOutUser.jsp"><fmt:message key="logoutUser" /></a></li>
                        	<%
	                        	}
                        	%>
                        		<li><a class="dropdown-item" href="registerUser.jsp"><fmt:message key="registerUser" /></a></li>
                        	</ul>
                        </li>
                    </ul>
                    <div class="d-flex" align="right">
                    	<a class="btn btn-secondary m-1" onclick="changeLanguage('ko')"><fmt:message key="korean" /></a>
						<a class="btn btn-secondary m-1" onclick="changeLanguage('en')"><fmt:message key="english" /></a>
                    </div>
                </div>
            </div>
        </nav>
        
</fmt:bundle>
<script src="js/language.js"></script>
<script src="js/gotoIndex.js"></script>