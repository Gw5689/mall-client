<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
	<%
		List<Map<String, Object>> cartList = (List<Map<String, Object>>)(request.getAttribute("cartList"));
	%>
	<table border="1">
		<thead>
			<tr>
				<td>cartNo</td>
				<td>ebookNo</td>
				<td>ebookTitle</td>
				<td>cartDate</td>
				<td>삭제</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
				<tr>
			<%
				for(Map<String,Object> map : cartList){
					int cartNo = (int)map.get("cartNo");
					String ebookTitle = (String)map.get("ebookTitle");
					int ebookNo = (int)map.get("ebookNo");
					String cartDate = (String)map.get("cartDate");
			%>
				<tr>
					<td><%=map.get("cartNo")%></td>
					<td><%=map.get("ebookNo")%></td>
					<td><%=map.get("ebookTitle")%></td>
					<td><%=map.get("cartDate")%></td>
					<!-- DeleteCartController -> CartDao.deleteCart() -> redirect:/CartListController -->
					<td><a href="<%=request.getContextPath()%>/DeleteCartController?ebookNo=<%=ebookNo%>">삭제</a></td>
					<!-- InsertOrdersController -> insertOrders(), deleteCart():ISSUE 트랜잭션처리 -> redirect:/OrdersListController-->
					<td><a href="<%=request.getContextPath()%>/InsertOrdersController?ebookNo=<%=ebookNo%>">주문</a></td>
				</tr>
			<%			
				}
			%>

		</tbody>
	</table>
</body>
</html>