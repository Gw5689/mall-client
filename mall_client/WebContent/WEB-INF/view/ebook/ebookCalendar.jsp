<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebookCalendarController</title>
</head>
<body>
		<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<h1>EbookCalendarController</h1>
	
	<%
		List<Map<String, Object>> ebookListByMonth = (List<Map<String, Object>>)request.getAttribute("ebookListByMonth");
		int currentYear = (Integer)request.getAttribute("currentYear");
		int currnetMonth = (Integer)request.getAttribute("currnetMonth");
		int firstDayOfWeek = (Integer)request.getAttribute("firstDayOfWeek");
		int endDay = (Integer)request.getAttribute("endDay");
		
		int preYear = currentYear;
		int preMonth = currnetMonth-1;
		
		if(preMonth == 0) {
			preMonth = 12;
			preYear -=1;
		}
		
		int nextYear = currentYear;
		int nextMonth = currnetMonth+1;
		
		if(nextMonth == 13) {
			nextMonth = 1;
			nextYear +=1;
		}
	%>
	
	<!-- n행 7열 -->
	<div>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=preYear%>&currnetMonth=<%=preMonth%>">이전달</a>
		<span><%=currentYear %>년</span>
		<span><%=currnetMonth %>월</span>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=nextYear%>&currnetMonth=<%=nextMonth%>">다음달</a>
	</div>
	
	<table border="1">
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		<tr>
		<%
      	   for(int i=1; i<firstDayOfWeek; i++){
		%>
	            <td></td>
		<%
	         }
        	 for(int i=1; i<=endDay; i++){
		%>            
	            <td>
	            	<%=i %> <!-- 날짜 ~ 일이 일치하면 신간이 나와있음 -->
	            	<%
	            		for(Map m : ebookListByMonth) {
	            			if(i == (Integer)m.get("d")) {
	            	%>
	            		<div>
	            			<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=m.get("ebookNo")%>">
	            				<%
	            					String ebookTitle = (String)m.get("ebookTitle");
	            					if(ebookTitle.length() > 10) {
	            				%>
	            					<%=ebookTitle.substring(0, 10)%>...
	            				<%
	            					} else {
	            				%>
	            					<%=ebookTitle %>
	            				<%		
	            					}
	            				%>
	            			</a>
	            		</div>
	            	<%			
	            			}
	            		}
	            	%>
	            	
	            </td>
		<%
           		 if(firstDayOfWeek%7==0){
		%>               
		            </tr><tr>
		<%               
	            }
	            firstDayOfWeek += 1;
	         }
	         firstDayOfWeek -= 1;
	         if((firstDayOfWeek%7) != 0){
	            for(int i=1; i<=7-(firstDayOfWeek%7); i++){
		%>               
		
	           	 <td></td>
		<%               
		            }
		         }
		%>
      </tr>
   </table>
</body>
</html>