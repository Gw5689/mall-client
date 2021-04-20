<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<!-- ebook 전체보기 -->
	<a href="${pageContext.request.contextPath}/IndexController">전체보기</a>
	
	<!-- 카테고리별 목록보기 네이게이션 -->
	<c:forEach var="cn" items="${categoryList}">
		<a href="${pageContext.request.contextPath}/IndexController?categoryName=${cn}">${cn}</a>
	</c:forEach>
	
	<!-- 검색창 -->
	<form action="${pageContext.request.contextPath}/IndexController" method="get">
		<input type="text" name="searchWord" placeholder="ebookTitle">
		<button type="submit">검색</button>
	</form>
	
	<!-- 베스트 ebook 상품 (최대 5개) -->
	<h3>베스트 상품</h3>
	<table border="1">
		<tr>
			<c:forEach var="map" items="${bestOrdersList}">
				<td>
						<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
						<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
						<div>
							<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${map.ebookNo}">
								${map.ebookTitle}
							</a>
						</div>

						<div>&#8361;${map.ebookPrice}</div>
					</td>
			</c:forEach>
		</tr>
	</table>
	
	
	
	<!-- ebook상품 출력 테이블 -->
	<h3>Ebook 리스트</h3>
	<table border="1">
		<c:forEach begin="0" end="14" var="i" step="${i+5}">
			<tr>
				<c:forEach var="ebook" begin="${i }" end="${i+4 }" items="${ebookList }">
					<td>
						<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
						
						<!-- EbookOneController -> EbookDao.selectEbookOne() -> view/EbookOne.jsp -->
						<div>
							<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebook.ebookNo}">${ebook.ebookTitle }</a>
						</div>
						
						<div>>&#8361;${ebook.ebookPrice }</div>
					</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<c:if test="${currentPage > 1}">
		<c:if test="${categoryName == null}">
			<c:if test="${searchWord == null}">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<c:if test="${searchWord != null}">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
			</c:if>
		</c:if>
		<c:if test="${categoryName != null}">
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}&categoryName=${categoryName}">이전</a>
		</c:if>
	</c:if>

	<c:if test="${currentPage < lastPage}">
		<c:if test="${categoryName == null}">
			<c:if test="${searchWord == null}">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}">다음</a>
			</c:if>
			<c:if test="${searchWord != null}">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
			</c:if>
		</c:if>
		<c:if test="${categoryName != null}">
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}&categoryName=${categoryName}">다음</a>
		</c:if>
	</c:if>
</body>
</html>