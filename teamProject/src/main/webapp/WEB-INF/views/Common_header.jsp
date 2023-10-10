<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Track11 팀프로젝트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script type="text/javascript" src="assets/js/jquery.min.js"></script>
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://kit.fontawesome.com/34253ab9f2.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	</head>
	<script type="text/javascript">
		function goPage(gubun){
			team.t_gubun.value=gubun;
			team.method="post";
			team.action="/team/";
			team.submit();
		}function goShop(shop){
			team.t_gubun.value='shop';
			team.t_shop.value=shop;
			team.method="post";
			team.action="/team/";
			team.submit();
		}function comma(num){
			var len, point, str;  
			  
			num = num + "";  
			point = num.length % 3 ;
			len = num.length;  
		  
			str = num.substring(0, point);  
			while (point < len) {  
			    if (str != "") str += ",";  
			    str += num.substring(point, point + 3);  
			    point += 3;  
			}  
			
			return str;
		
		}
	</script>
	<body class="is-preload">
<form name="team">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_shop">
</form>	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="javascript:goPage('index')" class="logo">
									<span class="symbol"><img src="images/logo.png" alt="" /></span>
								</a>

							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

							<!-- Account -->
								<div class="account">
									<c:if test="${empty sLevel }">
										<a href="javascript:goPage('login')">LogIn</a>
										<a href="javascript:goPage('join')">Join</a>
									</c:if>
									<c:if test="${not empty sLevel }">
										<c:if test="${sLevel>=2 }">
											<a href="javascript:goPage('manage_list')">관리페이지</a>
										</c:if>
										<c:if test="${sLevel==1 }">
											<a href="javascript:goPage('basket')">장바구니</a>
										</c:if>
										<a href="javascript:goPage('mypage')">Mypage</a>
										<a href="javascript:goPage('logout')">LogOut</a>
									</c:if>
								</div>

						</div>
					</header>
				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="javascript:goShop('식료품')">식료품</a></li>
							<li><a href="javascript:goShop('의류')">의류</a></li>
							<li><a href="javascript:goShop('앤티크')">앤티크</a></li>
							<li><a href="javascript:goShop('원예')">원예</a></li>
							<li><a href="javascript:goShop('음반')">음반</a></li>
							<li><a href="javascript:goShop('공구')">공구</a></li>
							<li><a href="javascript:goPage('qna_list')">QNA</a></li>
							<li><a href="javascript:goPage('faq_list')">FAQ</a></li>
						</ul>
					</nav>

					