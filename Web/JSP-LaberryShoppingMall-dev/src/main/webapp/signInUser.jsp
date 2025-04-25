<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Agency - Start Bootstrap Theme</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<%@ include file="nav.jsp"%>
<fmt:bundle basename="bundle.message">
	<body>
		
		<%@ include file="dbconn.jsp"%>
		<div class="container mt-5 pt-5">
			<div class="row mt-5">
				<h1 class="text-center">
					<fmt:message key="loginUser" />
				</h1>
			</div>
			<div class="row mt-5 d-flex justify-content-center">
				<div class="col-4">
					<form action="processSignInUser.jsp" method="post" enctype="utf-8"
						name="signInUser" class="border border-dark border-3 rounded" onsubmit="return form_check('signin')">
						<div class="row m-3">
							<div class="col-5">
								<label for="userId" class=""><fmt:message key="userId" /></label>
							</div>
							<div class="col-7">
								<input type="text" class="form-control" id="userId"
									placeholder="" name="userId">
							</div>
						</div>
						<div class="row m-3">
							<div class="col-5">
								<label for="userPW" class=""><fmt:message key="userPW" /></label>
							</div>
							<div class="col-7">
								<input type="password" class="form-control" id="userPW"
									placeholder="" name="userPW">
							</div>
						</div>
						<div class="row m-3 mt-5 d-flex justify-content-center">
							<button type="submit" class="btn btn-secondary"
								style="flex-grow: 0; width: auto;">
								<fmt:message key="loginUser" />
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="js/scripts.js"></script>
		<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
		<!-- * *                               SB Forms JS                               * *-->
		<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
		<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
		<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
		<!-- <script src="js/language.js"></script> -->
		<script src="js/checkStatus.js"></script>
		<script src="js/validation.js"></script>
	</body>
</fmt:bundle>
</html>