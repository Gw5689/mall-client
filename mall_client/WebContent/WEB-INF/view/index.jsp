<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mall.client.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 로그인/회원가입/내정보/장바구니(세션)-->
	<!-- 추천(시간)/베스트셀러(주문량)-->
	<!-- 메뉴2 카테고리-->
	<!-- 캘린더(이달에 나온 책들) -->
	
	<h1>index</h1>
	<%
	List<Map<String, Object>> bestOrdersList = (List<Map<String, Object>>)(request.getAttribute("bestOrdersList"));
		List<Ebook> ebookList = (List<Ebook>)(request.getAttribute("ebookList"));
		
		// 페이징
		int currentPage = (int)request.getAttribute("currentPage");
		int lastPage = (int)request.getAttribute("lastPage");
		
		// 검색창
		String categoryName = null;
		if(request.getAttribute("categoryName") != null){
			categoryName = (String)request.getAttribute("categoryName");
		}
		String searchWord = null;
		
		if(request.getAttribute("searchWord") !=null) {
			searchWord = (String)request.getAttribute("searchWord");
		}
		// 카테고리 목록
		List<String> categoryList = (List<String>)(request.getAttribute("categoryList"));
	%>
			<a href="<%=request.getContextPath()%>/IndexController">전체보기</a>
	<%
		for(String cn : categoryList) {
	%>
			<a href="<%=request.getContextPath()%>/IndexController?categoryName=<%=cn%>"><%=cn %></a>
	<%		
		}
	%>
	<!-- 검색창 -->
	<form action="<%=request.getContextPath()%>/IndexController" method="post">
		<input type="text" name="searchWord" placeholder="ebookTitle">
		<button type="submit">검색</button>
	</form>
	
	<!-- 베스트 ebook 상품 (최대 5개) -->
	<h3>베스트 상품</h3>
	<table border="1">
		<tr>
			<%
				for(Map m : bestOrdersList) {
			%>
					<td>
						<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
						<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
						<div>
							<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=m.get("ebookNo")%>">
								<%=m.get("ebookTitle")%>
							</a>
						</div>

						<div>￦<%=m.get("ebookPrice")%></div>
					</td>
			<%		
				}
			%>
		</tr>
	</table>
	
	
	
	<!-- ebook상품 출력 테이블 -->
	<h3>Ebook 리스트</h3>
	<table border="1">
		<tr>
		<%
			int i = 0;
			for(Ebook ebook : ebookList) {
				i++;
		%>
			
				<td>
					<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
					
					<!-- EbookOneController -> EbookDao.selectEbookOne() -> view/EbookOne.jsp -->
					<div>
						<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=ebook.getEbookNo()%>"><%=ebook.getEbookTitle()%></a>
					</div>
					
					<div>>&#8361;<%=ebook.getEbookPrice()%></div>
				</td>
		<%		
			if(i%5==0){
		%>
			</tr><tr>
		<%		
				}
			}
		%>
		</tr>
	</table>
	
	<!-- 페이징 -->
	<%
		if(currentPage > 1){
			if(categoryName == null){
				if(searchWord == null){
	%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>">이전</a>
	<%
				} else{
	%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&searchWord=<%=searchWord%>">이전</a>
	<%
				}
			} else{
	%>
			<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&categoryName=<%=categoryName%>">이전</a>
	<%
			}
		}
	
		if(currentPage < lastPage){
			if(categoryName == null){
				if(searchWord == null){
	%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>">다음</a>
	<%	
				} else{
	%>
				<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>&searchWord=<%=searchWord%>">다음</a>
	<%	
				}
			}else{
	%>	
				<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>&categoryName=<%=categoryName%>">다음</a>
	<%
				}
			}
		
	%>
</body>
</html>