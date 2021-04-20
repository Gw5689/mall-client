<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersList</title>
</head>
<body>

	<!-- 메인메뉴 인클루드 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<h1>주문리스트</h1>
	<table border="1">
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
				<td>${m.ordersDate}</td>
				<td>${m.ordersState}</td>
				<td>${m.ebookTitle}</td>
				<td>${m.ebookPrice}</td>

			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 버튼 -->
	<c:if test="${currentPage > 1 }">
		<a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage -1}">이전</a>
	</c:if>

	<c:if test="${currentPage < lastPage }">
		<a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage +1}">다음</a>
	</c:if>
</body>
</html>