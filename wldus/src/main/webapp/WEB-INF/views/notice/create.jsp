<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"> 
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
	<form name='frm' method='POST' action='./create.do'>
	<input type="hidden" name="users_no" id="users_no" value="${sessionScope.users_no }">
		<table>
			<tr>
				<th><label for="notice_title">제목</label></th>
				<td><input type="text" name="notice_title" required="required" autofocus></td>
			</tr>
			<tr>
				<th><label for="notice_content">공지 내용</label></th>
				<td><textarea name="notice_content" required="required" rows="12"></textarea></td>
			</tr>
		</table>
		<div>
			<button type="submit">등록</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>