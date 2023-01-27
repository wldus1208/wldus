<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>혜택</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<style>

</style>

<script>
	
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
	<div style="margin-right: 0;">
		<h5 style="font-weight: bold;">단 한번, 첫구매 최저가</h5>
		<img src="/images/ff.png" style="width: 100%;">
	</div>
	<div class="accordion" id="accordionExample">
  	<div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Tip!!!
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>- 첫구매 인생딜 상품쿠폰 할인율은 상품마다 달라지며, 전 대상 사용 가능합니다. <br>
        		- 최종 첫구매 혜택가는 <span style="color:red;">주문서에서 확인 가능</span>합니다.
        </strong>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        유의사항
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>1. 상품쿠폰은 구매이력이 없으신 고객만 운로드 가능합니다. <br>
        		2. 할인율은 상품마다 달라집니다. <br>
        		3. 최대 혜택가는 실시간 판매가, 보유한 쿠폰 및 마일리지에 따라 변동 될 수 있습니다. <br>
        		4. 본 이벤트는 당사 사정에 의해 사전 고지 없이 변경 혹은 중단될 수 있습니다.
        </strong>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        확인하기!
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>* 전시노출가는 첫구매혜택 미적용 가격입니다. <br>
        		* 상품쿠폰을 다운받으신 후, 주문서에서 최종혜택가를 꼭 확인해주세요!
        </strong>
      </div>
    </div>
  </div>
</div>
</body>
</body>
 
</html>