<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>LOGIN</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btn_create').on('click', create);
	});
	
	function create() {
		/* location.href="#"; */
		alert("회원가입")
	}
</script>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
	<h3>LOGIN</h3>
	<form name="form1" method="post">
	<div class="form-group">
  		<div class="form-floating mb-3">
    		<input type="text" class="form-control" id="uses_id" name="users_id" placeholder="ID" style="width:30%" autofocus required>
  		</div>
  		<div class="form-floating">
    	<input type="password" class="form-control" id="users_passwd" name="users_passwd" placeholder="Password" style="width:30%" required>
  		</div>
	</div>
	<div>
		<button type="submit" id="btnLogin">로그인</button>
		<button type="button" id="btn_create">회원가입</button>
		
	</div>
	</form>
	<div>
		<ul>
			<li class='li_none' style="color:red;">${msg} </li>
		</ul>
	</div>
</body>
</html>