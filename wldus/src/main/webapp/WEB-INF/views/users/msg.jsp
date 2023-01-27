<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알림</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
  
</script>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
	<div class='message'>
		<fieldset class='fieldset_basic'>
			<c:choose>
        		<c:when test="${param.code == 'create_success'}">
          			<li class='li_none'><span>등록 완료!!</span></li>
          			<li class='li_none'>
						<button type="button" onclick="location.href='/event/event.do'">확인</button>
					</li>
       			</c:when>
       			<c:when test="${param.code == 'create_fail'}">
          			<li class='li_none'><span>등록 실패,,</span></li>
          			<li class='li_none'>
						<button type="button" onclick="location.href='/event/event.do'">확인</button>
					</li>
       			</c:when>
       			<c:otherwise>
       				<ul>
						<li class='li_none' style="color:blue;">${msg} </li>
						<li class='li_none'>
						<button type="button" onclick="location.href='/index.do'">확인</button>
					</li>
			</ul>
       			</c:otherwise>
       		</c:choose>
       			
		</fieldset>
	</div>
</body>
</html>