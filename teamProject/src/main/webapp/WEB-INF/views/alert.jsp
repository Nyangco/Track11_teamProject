<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form name="fm">
		<input type="hidden" name="t_gubun" value="${url }">
		<input type="hidden" name="t_product_no" value="${t_product_no }">
		<input type="hidden" name="t_purchase_no" value="${t_purchase_no }">
		<input type="hidden" name="t_pay_method" value="${t_pay_method }">
		<input type="hidden" name="t_total" value="${t_total }">
	</form>
</body>
<script>
	alert("${msg}");
	fm.method="post";
	fm.action="/team/";
	fm.submit();
</script>
</html>