<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebookOne</title>
</head>
<body>
		<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>

	<h1>ebookOne</h1>
	
	<table border="1">
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
	
	<!-- InsertCartController?ebookNo -> CartDao.insertCart() -> 리다이렉트 카트리스트 컨트롤러 -->
	<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebook.ebookNo}">

			<c:if test="${loginClient == null || !ebook.ebookState.equals('판매중')}">
			
			<button type="button" disabled="disabled">장바구니 추가</button>	
			</c:if>
			
			<c:if test="${loginClient != null && ebook.ebookState.equals('판매중')}">
				<button type="button">장바구니 추가</button>
			</c:if>
	</a>
</body>
</html>