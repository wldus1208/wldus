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
<script>
	$(document).ready(function(){
		$("#panel_update").hide();
	});
	
	$(function() {
	    $('#btn_delete').on('click', deleteFrom);    
	    $('#btn_update').on('click', details_ajax);   
	});

	function deleteFrom() {
		if(confirm("삭제하시겠습니까?") == true) {
			location.href="./delete.do?notice_no=${noticeVO.notice_no}"
		}
	}
	
	/* function details_ajax(notice_no) {
		console.log("update");
		$("#panel_details").hide();
		$("#panel_update").show(); 
		
		let param = 'notice_no=' + notice_no;
		
		$.ajax({
			url: '/notice/details_ajax.do',
			type: 'get',
			dataType: 'json',
			data: param,
			success: function(rdata) {
				console.log("param", param);
				let event2_no = rdata.event2_no;
				let title = rdata.title;
				let content = rdata.content;
				let state = rdata.state;
				let frm_update = $("#frm_update");
				$("#event2_no", frm_update).val(event2_no);
				title = title.replaceAll("&nbsp;", " ");
				$("#title", frm_update).val(title);
				content = content.replaceAll("<BR>", "\n");
				content = content.replaceAll("&nbsp;", " ");
				$("#content", frm_update).val(content);
				$("#state", frm_update).val(state);
				console.log("rdata", rdata);
			},
			error: function(request, status, error) { 
              console.log(error);
            }
		} */
		
</script>
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
<div id="panel_details">
		<table style='width: 30%; text-align:center;'>
        	<tr>
        		<th>NO: </th>
        		<td><input name="notice_no" type="text" value="${noticeVO.notice_no }" readonly></td>
        	</tr>
        	<tr>
        		<th>제목: </th>
        		<td><input name="notice_title" type="text" value="${noticeVO.notice_title }" readonly></td>
        	</tr>
        	<tr>
        		<th>공지 내용: </th>
        		<td><textarea name="notice_content" style="height:200px;" disabled>${noticeVO.notice_content } </textarea></td>
        	</tr>
		</table>
		<button type="button" onclick="location.href='./list.do'">목록</button>
		<c:choose>
        	<c:when test="${sessionScope.users_grade < 10}">
            	<button type="button" id="btn_update">수정</button>
				<button id="btn_delete" type="button" style="color:red">삭제</button>
            </c:when>
        </c:choose>
</div>

<div id="panel_update">
	<form name='updateForm' method='POST' action='./update.do'>
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
        	<tr>
				<th></th>
				<td>
					<button type="button" onclick="location.href='./list.do'">목록</button>
					<button type="submit">확인</button>
					<button type="button" id="btn_cancel">취소</button>
				</td>
			</tr>
		</table>
		
		
	</form>
</div>
</body>

</html>