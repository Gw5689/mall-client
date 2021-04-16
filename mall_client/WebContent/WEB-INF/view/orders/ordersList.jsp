<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersList</title>
</head>
<body>
<%
	List<Map<String, Object>> ordersList = (List<Map<String, Object>>)request.getAttribute("ordersList");
	int currentPage = (int)request.getAttribute("currentPage");
	int lastPage = (int)request.getAttribute("lastPage");
%>
	<!-- 메인메뉴 인클루드 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<h1>주문리스트</h1>
	<table border="1">
		<tr>
			<td>ordersNo</td>
			<td>ebookNo</td>
			<td>ordersDate</td>
			<td>ordersState</td>
			<td>ordersTitle</td>
			<td>ordersPrice</td>
		</tr>
		<%
			for(Map m : ordersList) {
		%>
			<tr>
				<td><%=(Integer)(m.get("ordersNo"))%></td>
				<td><%=(Integer)(m.get("ebookNo"))%></td>
				<td><%=((String)(m.get("ordersDate"))).substring(0,10)%></td>
				<td><%=(String)(m.get("ordersState"))%></td>
				<td><%=(String)(m.get("ebookTitle"))%></td>
				<td><%=(Integer)(m.get("ebookPrice"))%></td>
			</tr>
		<%		
			}
		%>
	</table>
	<%
		if(currentPage > 1){
	%>
			<a href="<%=request.getContextPath()%>/OrdersListController?currentPage=<%=currentPage-1%>">이전</a>
	<%
		}
	
		if(currentPage < lastPage){
	%>
			<a href="<%=request.getContextPath()%>/OrdersListController?currentPage=<%=currentPage+1%>">다음</a>
	<%
		}
	%>
</body>
</html>