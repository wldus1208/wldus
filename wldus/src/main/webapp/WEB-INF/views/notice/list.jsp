<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 

<title>공지사항</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
     
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
<DIV>
	<h1>공지사항</h1>
</DIV>
<DIV>
    <c:choose>
      <c:when test="${sessionScope.users_grade < 10}">
        <A href="./create.do">등록</A>
      </c:when>
    </c:choose>

  <div style="text-align:center;">
  <table border="1" style='width: 100%;'>
     <thead>
      <tr>
        <th>NO</th>
		<th>제목</th>
		<th>공지 내용</th>
		<th>등록일</th>
		<th>수정일</th>
      </tr>
    
    </thead> 
    
    <tbody>
      <c:forEach var="noticeVO" items="${list }">
        <c:set var="notice_no" value="${noticeVO.notice_no }" />
        
        <tr> 
          <td>${notice_no }</td>
          <td><a href="./details.do?notice_no=${notice_no}">${noticeVO.notice_title}</a></td> 
          <td><a href="./details.do?notice_no=${notice_no}">${noticeVO.notice_content}</a></td>
          <td>${noticeVO.notice_rdate}</td>
          <td>${noticeVO.updatedate}</td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
</DIV>
</DIV>
</body>
 
</html>