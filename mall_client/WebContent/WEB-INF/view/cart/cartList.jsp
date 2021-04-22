<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>cartList</title>
</head>
<body class="bg-theme bg-theme1  pace-done">
	<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<!-- 메인메뉴 인클루드 -->
				<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
				<!-- cartList -->
				<div class="form-group"> 
					<h2>장바구니</h2>
				</div>
			
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<td>cartNo</td>
								<td>ebookNo</td>
								<td>ebookTitle</td>
								<td>ebookPrice</td>
								<td>cartDate</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</thead>
						<tbody>
								<tr>
				
							<c:forEach var="m" items="${cartList}">	
							
								<tr>
									<td>${m.cartNo }</td>
									<td>${m.ebookNo }</td>
									<td>
										<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable"
										 href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">${m.ebookTitle }</a>
									</td>
									<td>${m.ebookPrice }</td>
									<td>${m.cartDate.substring(0,10) }</td>
									
									
									<td>
										<a href="${pageContext.request.contextPath}/DeleteCartController?ebookNo=${m.ebookNo }">
											<button class="btn btn-light btn-round px-4">삭제</button>
										</a>
									</td>
									
									<td>
										<a href="${pageContext.request.contextPath}/InsertOrdersController?ebookNo=${m.ebookNo }">
											<button class="btn btn-light btn-round px-4">주문</button>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</body>
</html>