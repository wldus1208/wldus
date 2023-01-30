<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<title>Event</title>
<script type="text/javascript">
	if(typeof param.searchType == 'undefined') {
		param.searchType = 'title';
	}
</script>
</head>
<body>
<div>
	<div>
		 <c:choose>
            	<c:when test="${sessionScope.users_grade < 10 }">
            		<a href="./create.do">등록</a>
            	</c:when>
         </c:choose>
         <div>
			<form action="">
				<select name="searchType">
					<option <c:if test="${param.searchType == 'title' }">selected</c:if> value="title">제목</option>
					<option <c:if test="${param.searchType == 'content' }">selected</c:if> value="content">내용</option>
					<option <c:if test="${param.searchType == 'titleAndContent' }">selected</c:if> value="titleAndContent">제목+내용</option>
				</select>
				<input type="text" name="keyword" value="${param.keyword }">
				<input type="submit" value="검색">
			</form>		
		</div>
	</div>
	<table style="width:100%;">
		<colgroup>
  		<col width="10%" />
  		<col width="50%" />
  		<col width="10%" />
  		<col width="10%" />
  		<col width="10%" />
  	</colgroup>
		<tbody>
		<c:forEach var="EventVO" items="${list }">
        	<c:set var="event2_no" value="${EventVO.event2_no }" />
        	<tr>
        		<td>
            		[${EventVO.state}] 
            		 
          		</td>
          		<td>
          			<a href="./details.do?event2_no=${event2_no}"><strong>${EventVO.title}</strong></a>
          		</td>
          		<td style="text-align:right">
          			관리자|  
          		</td>
          		<td style="text-align:center">
          			${EventVO.reg_date}|
          		</td>
          		<td>
          			조회수: ${EventVO.cnt}
          		</td>
        	</tr>
        </c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>