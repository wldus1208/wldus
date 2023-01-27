<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">

<script type="text/javascript">
  
  $(function() {
	  $('#users_name').on('focusout', checkName);
	  $('#users_id').on('focusout', ID);
	  $("#btn_checkID").on("click", checkID);
	  $('#users_passwd').on('focusout', PW);
	  $('#users_passchk').on('focusout', checkPW);
	  $('#users_email').on('focusout', checkEmail);
	  $('#btn_send').on("click", send);
  });
  
  function checkName() {
	  let frm = $('#frm');
	  let name = $('#users_name', frm).val();
	  
	  if(name == "" || name.length < 2) {
		  $('#NameChk').html("이름은 2자 이상 8자 이하로 설정해주세요.")
		  $('#NameChk').css("color", "red")
		  $("#nameDoubleChk").val("false");
	  } else {
		  $('#NameChk').html("");
		  $("#nameDoubleChk").val("true");
	  }
  }
  function ID() {
	  	var idPattern = /^(?=.*[a-z])(?=.*\d)[a-z0-9_-]{6,16}$/
	  	var userid = $("#users_id").val();

	  	if(!userid.match(idPattern)){
	  		alert("아이디는 8~16자 영문+숫자 조합입니다.");
	  		return;
	  	}
	
  }
  
  function checkID() {
	  let frm = $("#frm");
	  let users_id = $("#users_id", frm).val();
	  let params = "";
	  
	  if ($.trim(users_id).length == 0) {
		  $("#IdChk").text("ID를 입력하세요.");
		  $("#IdChk").css("color", "red");
		  return false;
	  } else {
		  params = "users_id=" + users_id;
		  
		  $.ajax({
			  url: './checkID.do',
			  type: 'get',
			  cache: false,
			  async: true,
			  dataType: 'json',
			  dats: params,
			  success: function(rdata) {
				  console.log(rdata)
				  if (rdata.cnt > 0) {
					  $("#IdChk").text("이미 사용중인 ID입니다.");
					  $("#IdChk").css("color", "red");
					  $("#idDoubleChk").val("false");
				  } else {
					  $("#IdChk").text("사용 가능한 ID입니다.");
					  $("#IdChk").css("color", "green");
					  $("#idDoubleChk").val("true");
				  }
				  
			  },
			 error: function(request, status, error) {
				 console.log(error);
			 }
		  });
	  }
  }
  
  function PW() {
	  var pwPattern = /^(?=.*[a-z])(?=.*\d)[a-z0-9_-]{8,16}$/
	  var userpw=$("#users_passwd").val();
	  
	  if(userpw.match(pwPattern)){
			$("#Pw").text("사용가능한 비밀번호입니다.").css("color","green");
			$("#pwDoubleChk2").val("true");
		}else{
			$("#Pw").text("비밀번호는 영문+숫자 조합 8~16자리입니다.").css("color","red");
			$("#pwDoubleChk2").val("false");
		}
  }
  
  function checkPW() {
	  let frm = $('#frm');
	  let pw1 = $('#users_passwd', frm).val();
	  let pw2 = $('#users_passchk', frm).val();
	  
	  if(pw1 != "" || pw2 != "") {
		  if(pw1 == pw2) {
			  $('#PwChk').html("비밀번호가 일치합니다.")
			  $("#PwChk").css("color", "green"); 
			  $("#pwDoubleChk").val("true");
		  } else {
			  $('#PwChk').html("비밀번호가 일치하지 않습니다.")
			  $("#PwChk").css("color", "red");
			  $("#pwDoubleChk").val("false");
			  $("#users_passwd").val("");
			  $("#users_passchk").val("");
		  }
	  }
  }
  
  function checkEmail() {
	  var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var input_email = $("#user_email").val();
	  
	  if(!input_email.match(emailPattern)){
			alert("이메일 형식이 올바르지 않습니다.");
			return;
		}
  }
  
  function send() {
	if($("#users_name").val() == ""){
		alert("이름을 입력해주세요.");
		$("#users_name").focus();
		return;
	}
	if($("#users_id").val() == ""){
		alert("아이디를 입력해주세요.");
		$("#users_id").focus();
		return;
	}
	if($("#idDoubleChk").val()!="true"){
		alert("아이디 중복체크를 해주세요");
		return;
	}
	if($("#users_passwd").val() == ""){
		alert("비밀번호를 입력해주세요.");
		$("#users_passwd").focus();
		return;
	}
	if($("#users_email").val() == ""){
		alert("이메일을 입력해주세요.");
		$("#users_email").focus();
		return;
	}
	if($("#users_tel").val() == ""){
		alert("전회번호를 입력해주세요.");
		$("#users_tel").focus();
		return;
	}
	
	$('#frm').submit();  
  }
  
</script>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  
	<h2>회원가입</h2>
	<span style="color:blue; font-size: 20px;">기본정보 </span><span style="font-size: 20px;">입력</span>
	<form name="frm" id="frm" method="POST" action="./create.do">
			<table class="form-group" style="padding:10px">
				<tr>
				<th><label for="users_name">이&emsp;름&emsp;</label></th>
				<td>
					<input type="text" id="users_name" name="users_name" maxlength="8" autofocus/>
					<small class="form-text text-muted"><span class="point" id="NameChk">이름을 입력해주세요.</span></small>
					<input type="hidden" id="nameDoubleChk"/>
				</td>
				</tr>
				<tr>
				<th><label for="users_id">I&emsp;D&emsp;</label></th>
				<td>
					<input type="text" id="users_id" name="users_id" maxlength="16"/>
					<button type="button" id="btn_checkID">중복 확인 &emsp;</button>
					<span class="point" id = "IdChk"><br></span>
					<input type="hidden" id="idDoubleChk"/>
				</td>
				</tr>
				<tr>
				<th><label for="users_passwd">P&emsp;W&emsp;</label></th>
				<td>
					<input id="users_passwd" type="password" name="users_passwd" maxlength="16" autocomplete="off"/>
					<span class="point" id="Pw"></span>
					<input type="hidden" id="PwDoubleChk2"/>
				</td>
				</tr>
				<tr>
				<th><label for="users_passchk">P&emsp;W 확인</label></th>
				<td>
					<input id="users_passchk" type="password" name="users_passchk" placeholder="동일하게 입력해주세요." maxlength="16" autocomplete="off"/>
					<span class="point" id="PwChk"></span>
					<input type="hidden" id="pwDoubleChk"/>
				</td>
				</tr>
				<tr>
				<th><label for="users_gender">성&emsp;별</label></th>
				<td>
					<input id="users_gender" type="radio" name="users_gender" value="m"/>남
					<input id="users_gender" type="radio" name="users_gender" value="w"/>여
				</td>
				</tr>
				<tr>
				<th><label for="users_email">이메일</label></th>
				<td>
					<input id="users_email" type="text" name="users_email" placeholder="example@naver.com"/>
				</td>
				</tr>
				<tr>
				<th><label for="users_tel">휴대폰 번호</label></th>
				<td>
					<input id="users_tel" type="tel" name="users_tel" placeholder="전화번호 입력"/>
				</td>
				</tr>
			</table>
	<div>
		<button type="button" id="btn_send">가입</button>
		<button type="reset">취소</button>
	</div>
	</form>
</body>
</html>