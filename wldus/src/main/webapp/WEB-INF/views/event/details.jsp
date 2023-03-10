<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="file1saved" value="${eventVO.file1saved }" />
<c:set var="file1" value="${eventVO.file1 }" />
<c:set var="size1" value="${eventVO.file1 }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
	    $('#btn_delete').on('click', deleteFrom);    
	});
	
	function deleteFrom() {
		if(confirm("삭제하시겠습니까?") == true) {
			location.href="./delete.do?event2_no=${eventVO.event2_no}"
		}
	}
</script>
<style type="text/css">
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
<div id="panel_details">
	<fieldset class="fieldset_basic"> 
    <ul>
      	<li class="li_none">
      		<DIV style="width: 100%; height: 30px; margin-right: 10px;">
          		<span style="font-size: 1.5em; font-weight: bold;">${eventVO.title}</span>
          		<c:choose>
            		<c:when test="${sessionScope.users_grade < 10 }">
            			<button type="button" id="btn_update">수정</button>
            			<button type="button" id="btn_delete">삭제</button>
            	</c:when>
            </c:choose>
    		</DIV><br>
        <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
        <DIV style="width: 50%; margin-right: 10px;">
            <c:choose>
            	<c:when test="${file1.endsWith('jpg') || file1.endsWith('png') || file1.endsWith('gif')}">
                	<IMG src="/event/storage/${file1saved }" style="width: 100%;">
                </c:when> 
                <c:otherwise> 
                	<IMG src="/event/images/ab.jpeg" style="width: 100%;"> 
              	</c:otherwise>
            </c:choose>
        </DIV>	 
    
    <DIV style="font-size: 15px;">${eventVO.content }</DIV>
    </li>
    <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/event/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> (${size1_label})  
          </c:if>
        </DIV>
    </li> 
    <li class="li_none">
	    <div>
	    	<button type="button" onclick="location.href='./list.do?searchType=title&keyword='">목록</button>
	    </div>
    </li>
    </ul>
    </fieldset>
</div>

<div id="panel_update">
	<form name='updateForm' method='POST' action='./update.do'>
		<table style='width: 80%;'>
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