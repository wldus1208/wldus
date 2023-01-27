<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록[관리자 권한]</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	input, textarea {
		width: 60%;
	}
	
	Button {
		width: 150px;
		height: 40px;
		background-color: black;
		color: white;
	}
</style>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<div>
	<form name="frm" method="POST" action="./create.do" enctype="multipart/form-data" class="form-horizontal">
		<table style="width:80%">
		<colgroup>
      		<col style='width: 20%;'/>
    	</colgroup>
			<tr>
				<th>구분</th>
				<td>
					<select name="state">
						<option value="">선택</option>
						<option value="공지">공지</option>
						<option value="이벤트 진행중">이벤트 진행중</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id=content style="height: 100px;"></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택"></td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit">등록</button>
					<button type="button" onclick="location.href='./event.do'">목록</button>
				</td>
			</tr>
		</table>
		
	</form>
</div>
</body>
</html>