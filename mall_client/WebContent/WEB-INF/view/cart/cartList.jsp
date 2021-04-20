<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartList</title>
</head>
<body>
	<!-- 메인메뉴 인클루드 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- cartList -->
	<h1>cartList</h1>

	<table border="1">
		<thead>
			<tr>
				<td>cartNo</td>
				<td>ebookNo</td>
				<td>ebookTitle</td>
				<td>ebookPrice</td>
				<td>cartDate</td>
				<td>삭제</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
				<tr>

			<c:forEach var="m" items="${cartList}">	
			
				<tr>
					<td>${m.cartNo }</td>
					<td>${m.ebookNo }</td>
					<td>${m.ebookTitle }</td>
					<td>${m.ebookPrice }</td>
					<td>${m.cartDate.substring(0,10) }</td>
					
					<!-- DeleteCartController -> CartDao.deleteCart() -> redirect:/CartListController -->
					<td><a href="${pageContext.request.contextPath}/DeleteCartController?ebookNo=${m.ebookNo }">삭제</a></td>
					<!-- InsertOrdersController -> insertOrders(), deleteCart():ISSUE 트랜잭션처리 -> redirect:/OrdersListController-->
					<td><a href="${pageContext.request.contextPath}/InsertOrdersController?ebookNo=${m.ebookNo }">주문</a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</body>
</html>