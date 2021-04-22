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
<title>ebookOne</title>
</head>
<body class="bg-theme bg-theme1  pace-done">
	<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<!-- mainMenu -->
				<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
			
				<h1>ebookOne</h1>
				
				<table class="table table-hover">
						<tr>
							<th>ebookNo</th>
							<td>${ebook.ebookNo}</td>
						</tr>
						
						<tr>
							<th>categoryName</th>
							<td>${ebook.categoryName}</td>
						</tr>
						<tr>
							<th>ebookISBN</th>
							<td>${ebook.ebookISBN}</td>
						</tr>
						<tr>
							<th>ebookTitle</th>
							<td>${ebook.ebookTitle}</td>
						</tr>		
						<tr>
							<th>ebookState</th>
							<td>${ebook.ebookState}</td>
						</tr>
						<tr>
							<th>ebookAuthor</th>
							<td>${ebook.ebookAuthor}</td>
						</tr>
						<tr>
							<th>ebookImg</th>
							<td><img src="${pageContext.request.contextPath}/img/default.jpg"></td>
						</tr>
						<tr>
							<th>ebookCompany</th>
							<td>${ebook.ebookCompany}</td>
						</tr>
						<tr>
							<th>ebookDate</th>
							<td>${ebook.ebookDate}</td>
						</tr>
						<tr>
							<th>ebookSummary</th>
							<td>${ebook.ebookSummary}</td>
						</tr>
						<tr>
							<th>ebookPrice</th>
							<td>${ebook.ebookPrice}</td>
						</tr>
						<tr>
							<th>ebookPageCount</th>
							<td>${ebook.ebookPageCount}</td>
						</tr>
				</table>
				
				
				<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebook.ebookNo}">
			
						<c:if test="${loginClient == null || !ebook.ebookState.equals('판매중')}">
						
						<button type="button" disabled="disabled" class="btn btn-light btn-round px-4">장바구니 추가</button>	
						</c:if>
						
						<c:if test="${loginClient != null && ebook.ebookState.equals('판매중')}">
							<button type="button" class="btn btn-light btn-round px-4">장바구니 추가</button>
						</c:if>
				</a>
				<a href="${pageContext.request.contextPath}/IndexController">
					<button type="button" class="btn btn-light btn-round px-4">돌아가기</button>
				</a>
		</div>
	</div>
</body>
</html>