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
<title>clientOne</title>
</head>
<body class="bg-theme bg-theme1  pace-done">
	<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<!-- mainMenu -->
				<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
				<div class="col-lg-10">
				<div class="card-body">		
				<h1 class="card-title">회원정보</h1>
				<div class="table-responsive">
				<table class="table table-hover">
					
						<tr>
							<th>clientNo</th>
							<td>${clientOne.clientNo}</td>
						</tr>
						<tr>
							<th>clientMail</th>
							<td>${clientOne.clientMail}</td>
						</tr>
						<tr>
							<th>clientDate</th>
							<td>${clientOne.clientDate}</td>
						</tr>		
				</table>
				</div>
				
				<a href="${pageContext.request.contextPath}/UpdateClientPwController">
					<button type="button" class="btn btn-light btn-round px-4">비밀번호 수정</button>
				</a>
				<a href="${pageContext.request.contextPath}/DeleteClientController">
					<button type="button" class="btn btn-light btn-round px-4">회원탈퇴</button>
				</a>
				</div>
				</div>
		</div>
	</div>
</body>
</html>