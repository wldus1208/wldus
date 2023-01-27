<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<style>

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
#tabcontent {
	display: block;
	background-color: #fffff0;
	padding: 6px 12px;
	color: #fff;
}
#tab {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
a:visited { 
	color: black; 
	text-decoration: none;
	
	}


li {
	float: left;
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
}
}
</style>

<script>
	$(function() {
		// tab operation
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('li').css('background-color', 'white');
			$(this).css('background-color', '#fffff0');
			$.ajax({
				type : 'GET',                 //get방식으로 통신
				url : activeTab + ".do",    //
				dataType : "html",            //html형식으로 값 읽기
				error : function() {          //통신 실패시
					console.log(url);
					alert('통신실패!');
				},
				success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();          
	});
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
	<div>
		<ul class="tab">
			<li data-tab="tab2" class='tabmenu' id="default"><a href="#" id="tab">event1</a></li>
			<li data-tab="tab1" class='tabmenu'><a href="#" id="tab">event2</a></li>
			<li data-tab="tab3" class='tabmenu'><a href="#" id="tab">event3</a></li>
		</ul>
		<div id="tabcontent"></div>
	</div>
</body>
</body>
 
</html>