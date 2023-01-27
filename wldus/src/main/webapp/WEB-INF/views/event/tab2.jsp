<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
</head>
<body>
<div>
	<div>
		검색 | <c:choose>
            	<c:when test="${sessionScope.users_grade < 10 }">
            		<a href="./create.do">등록</a>
            	</c:when>
              </c:choose>
	</div>
	<table style="width:100%;">
		<tbody>
		<c:forEach var="EventVO" items="${list }">
        	<c:set var="event2_no" value="${EventVO.event2_no }" />
        	<tr>
        		<td>
            		[${EventVO.state}] <a href="./details.do?event2_no=${event2_no}"><strong>${EventVO.title}</strong></a>
            		 
          		</td>
          		<td>
          			관리자 | ${EventVO.reg_date} | 조회수: ${EventVO.cnt}
          		</td>
        	</tr>
        </c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>