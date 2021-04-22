<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <!-- loader-->
  <link href="assets/css/pace.min.css" rel="stylesheet"/>
  <script src="assets/js/pace.min.js"></script>
  <!--favicon-->
  <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
  <!-- simplebar CSS-->
  <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
  <!-- Bootstrap core CSS-->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Sidebar CSS-->
  <link href="assets/css/sidebar-menu.css" rel="stylesheet"/>
  <!-- Custom Style-->
  <link href="assets/css/app-style.css" rel="stylesheet"/>
<title>updateClientPw</title>
</head>
<body class="bg-theme bg-theme1  pace-done">
	<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<h2>비밀번호 수정 </h2>
				<form action="${pageContext.request.contextPath}/UpdateClientPwController" method="post">
				<table class="table table-hover">
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" name="clientPw" required pattern="^[a-z0-9\W]{4,20}$" class="form-control input-shadow" placeholder="Enter Your New PW"></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-light btn-round px-4">변경</button>
				</form>
				<a href="${pageContext.request.contextPath}/IndexController">
					<button type="submit" class="btn btn-light btn-round px-4">HOME</button>
				</a>
		</div>
	</div>
</body>
</html>