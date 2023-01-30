<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>HOME</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
<script type="text/javascript">
$(document).ready(function () {
	$(".mySlides").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김

});

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
</script>

</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
 	<div class="slideshow-container">
		<div class="mySlides fade2 active">
			<a href='/event/first.do'><img class="main_slideImg" src="/images/aa1.png"></a>
			<div class="text">aa1</div>
		</div>
		<div class="mySlides fade2" >
			<img class="main_slideImg" src="/images/a2.jpg">
			<div class="text">a2</div>
		</div>
		<div class="mySlides fade2" >
			<img class="main_slideImg" src="/images/a3.jpg"> 
			<div class="text">a3</div>
		</div>
		<div class="mySlides fade2" >
			<img class="main_slideImg" src="/images/a4.jpg"> 
			<div class="text">a4</div>
		</div>
		<div class="mySlides fade2" >
			<img class="main_slideImg" src="/images/a5.jpg"> 
			<div class="text">a5</div>
		</div>
		<!-- <a class="prev" onclick="plusSlides(-1)">❮</a>
		<a class="next"onclick="plusSlides(1)">❯</a> -->
	</div>
	<br>

	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> 
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
		<span class="dot" onclick="currentSlide(4)"></span>
		<span class="dot" onclick="currentSlide(5)"></span>
	</div>
</body>
</html>