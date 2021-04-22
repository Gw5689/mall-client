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
<title>index</title>
</head>
<body class="bg-theme bg-theme1  pace-done">	
	<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<!-- main menu -->
				<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
				
				<!-- 금일 접속자 -->
				<div>오늘 접속자 : ${statsCount}</div>
				<div>전체 접속자 : ${total}</div>
				<hr>
				
				<!-- ebook 전체보기 -->
				<div class="form-group">
					<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable"
					 href="${pageContext.request.contextPath}/IndexController">전체보기</a>
					
					<!-- 카테고리별 목록보기 네이게이션 -->
					<c:forEach var="cn" items="${categoryList}">
						<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable" 
						href="${pageContext.request.contextPath}/IndexController?categoryName=${cn}">${cn}</a>
					</c:forEach>
				</div>
				
				<!-- 검색창 -->
				<form action="${pageContext.request.contextPath}/IndexController" method="get" class="search-bar">
					<div class="form-group">
						<div>
							<input type="text" name="searchWord" placeholder="ebookTitle" size="20">
							<button type="submit" class="btn btn-light btn-round px-4">
								<i class="icon-magnifier"></i>
							</button>
						</div>
					</div>
				</form>
				
				<!-- 베스트 ebook 상품 (최대 5개) -->
				<h3 class="card-title">베스트 상품</h3>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<c:forEach var="map" items="${bestOrdersList}">
								<td>
										<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
	
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
				</div>
				<hr>
				<!-- ebook상품 출력 테이블 -->
				<h3 class="card-title">Ebook 리스트</h3>
				<div class="table-responsive">
					<table class="table table-hover">
						<c:forEach begin="0" end="14" var="i" step="${i+5}">
							<tr>
								<c:forEach var="ebook" begin="${i }" end="${i+4 }" items="${ebookList }">
									<td>
										<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
										
										<!-- EbookOneController -> EbookDao.selectEbookOne() -> view/EbookOne.jsp -->
										<div>
											<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebook.ebookNo}">${ebook.ebookTitle }</a>
										</div>
										
										<div>&#8361;${ebook.ebookPrice }</div>
									</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<!-- 페이징 -->
				<c:if test="${currentPage > 1}">
					<c:if test="${categoryName == null}">
						<c:if test="${searchWord == null}">
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}">
								<button class="btn btn-light btn-round px-4">이전</button>
							</a>
						</c:if>
						<c:if test="${searchWord != null}">
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}&searchWord=${searchWord}">
								<button class="btn btn-light btn-round px-4">이전</button>
							</a>
						</c:if>
					</c:if>
					<c:if test="${categoryName != null}">
						<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}&categoryName=${categoryName}">
							<button class="btn btn-light btn-round px-4">이전</button>
						</a>
					</c:if>
				</c:if>
			
				<c:if test="${currentPage < lastPage}">
					<c:if test="${categoryName == null}">
						<c:if test="${searchWord == null}">
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}">
								<button class="btn btn-light btn-round px-4">다음</button>
							</a>
						</c:if>
						<c:if test="${searchWord != null}">
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}&searchWord=${searchWord}">
								<button class="btn btn-light btn-round px-4">다음</button>
							</a>
						</c:if>
					</c:if>
					<c:if test="${categoryName != null}">
						<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}&categoryName=${categoryName}">
							<button class="btn btn-light btn-round px-4">다음</button>
						</a>
					</c:if>
				</c:if>
			</div>
		</div>
</body>
</html>