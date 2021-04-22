<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>ebookCalendar</title>
</head>
<body class="bg-theme bg-theme1  pace-done">
	<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<!-- mainmenu -->
			   <jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
			   
			   <h2>Ebook 달력</h2>
			
			   <div>
			      <a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable"
			      	 href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${preYear}&currentMonth=${preMonth}">
			         이전달
			      </a>
			      <span>${currentYear}년</span> <span>${currentMonth}월</span> 
			      <a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable"
			       href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${nextYear}&currentMonth=${nextMonth}">
			         다음달
			      </a>
			   </div>
			   
			   <table class="table table-hover">
			      <tr>
			         <td>일</td>
			         <td>월</td>
			         <td>화</td>
			         <td>수</td>
			         <td>목</td>
			         <td>금</td>
			         <td>토</td>
			      </tr>
			      <tr>
			         <!-- 공백 + endDay 만큼 td가 필요 -->
			         <c:forEach var="i" begin="1" end="${endDay+(firstDayOfWeek-1)}" step="1">
			            
			            <c:if test="${i-(firstDayOfWeek-1) <= 0}">
			               <td>&nbsp;</td>
			            </c:if>
			            <c:if test="${i-(firstDayOfWeek-1) > 0}">
			               <td>
			                  <div>${i-(firstDayOfWeek-1)}</div>
			                  <div>
			                     <c:forEach var="m" items="${ebookListByMonth}">
			                        <c:if test="${(i-(firstDayOfWeek-1)) == m.d}">
			                           <div>
			                              <a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable"
			                               href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
			                                 <c:if test="${m.ebookTitle.length() > 10}">
			                                    ${m.ebookTitle.substring(0, 10)}...
			                                 </c:if>
			                                 <c:if test="${m.ebookTitle.length() < 10}">
			                                    ${m.ebookTitle}
			                                 </c:if>
			                              </a>
			                           </div>
			                        </c:if>
			                     </c:forEach>
			                  </div>
			               </td>
			            </c:if>
			            
			            <c:if test="${i%7 == 0}">
			               </tr><tr>
			            </c:if>
			         </c:forEach>
			         <!-- td반복후 채워지지 않는 자리가 있다면.... -->
			         <c:if test="${(endDay+(firstDayOfWeek-1)) % 7 != 0}">
			            <c:forEach begin="1" end="${7 - ((endDay+(firstDayOfWeek-1))%7)}" step="1">
			               <td>&nbsp;</td>
			            </c:forEach>   
			         </c:if>
			      </tr>
			   </table>
		   </div>
	   </div>
</body>
</html>
