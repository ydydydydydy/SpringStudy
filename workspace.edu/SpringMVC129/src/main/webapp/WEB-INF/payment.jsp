<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
            type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
    
    <meta charset="UTF-8"/>
    <title>Sample Payment</title>
</head>
<body>
<form name="pgForm">
	<input type="hidden" name="Amt" value="1000">
	<input type="hidden" name="BuyerName" value="홍길동">
	<input type="hidden" name="OrderName" value="결제테스트">
</form>
<!-- 결제하기 버튼 생성 -->
</body>
<script>
IMP.request_pay({
	amount : 1000,
	buyer_name : '홍길동',
	name : '결제테스트'
}, function(response) {
	//결제 후 호출되는 callback함수
	if ( response.success ) { //결제 성공
		console.log(response);
	} else {
		alert('결제실패 : ' + response.error_msg);
	}
})
</script>
</html>