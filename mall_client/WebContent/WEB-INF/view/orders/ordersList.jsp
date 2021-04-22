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
<title>ordersList</title>
</head>
<body class="bg-theme bg-theme1  pace-done">
	<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<!-- 메인메뉴 인클루드 -->
				<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
				
				<h2>주문리스트</h2>
				<table class="table table-hover">
					<tr>
						<td>ordersNo</td>
						<td>ebookNo</td>
						<td>ordersDate</td>
						<td>ordersState</td>
						<td>ebookTitle</td>
						<td>ebookPrice</td>
					</tr>
					
					<c:forEach var="m" items="${ordersList }">
						<tr>
							<td>${m.ordersNo}</td>
							<td>${m.ebookNo}</td>
							<td>
								<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable" 
								href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">${m.ebookTitle}</a>
							</td>
							<td>${m.ordersDate}</td>
							<td>${m.ordersState}</td>
							<td>${m.ebookPrice}</td>
			
						</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징 버튼 -->
				<c:if test="${currentPage > 1 }">
					<a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage -1}">
						<button class="btn btn-light btn-round px-4">이전</button>
					</a>
				</c:if>
			
				<c:if test="${currentPage < lastPage }">
					<a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage +1}">
						<button class="btn btn-light btn-round px-4">다음</button>
					</a>
				</c:if>
		</div>	
	</div>
</body>
</html>