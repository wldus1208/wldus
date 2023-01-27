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
    <c:choose>
      <c:when test="${sessionScope.users_grade < 10}">
        <A href="./create.do">등록</A>
      </c:when>
    </c:choose>
</DIV>
	<form name='viewForm' method='POST' action='./update.do'>
		<table style='width: 30%; text-align:center;'>
        	<tr>
        		<th>NO: </th>
        		<td><input name="notice_no" type="text" value="${noticeVO.notice_no }" readonly></td>
        	</tr>
        	<tr>
        		<th>제목: </th>
        		<td id="dis"><input name="notice_title" type="text" value="${noticeVO.notice_title }"></td>
        	</tr>
        	<tr>
        		<th>공지 내용: </th>
        		<td id="dis"><textarea name="notice_content" style="height:200px;">${noticeVO.notice_content } </textarea></td>
        	</tr>
		</table>
		<button type="button" onclick="location.href='./list.do'">목록</button>
		<c:choose>
        	<c:when test="${sessionScope.users_grade < 10}">
            	<button id="btn_modify" type="submit" style="color:blue">수정</button>
				<button id="btn_delete" type="button" style="color:red">삭제</button>
            </c:when>
        </c:choose>
	</form>
</body>
<script type="text/javascript">

$(function() {
    $('#btn_delete').on('click', deleteFrom);    
});

function deleteFrom() {
	if(confirm("삭제하시겠습니까?") == true) {
		location.href="./delete.do?notice_no=${noticeVO.notice_no}"
	}
}
</script>
</html>