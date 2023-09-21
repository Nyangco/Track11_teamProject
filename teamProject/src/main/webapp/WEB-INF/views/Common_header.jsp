<%@ page pageEncoding="UTF-8"%>
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
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://kit.fontawesome.com/34253ab9f2.js" crossorigin="anonymous"></script>
	</head>
	<script type="text/javascript">
		function goPage(gubun){
			team.t_gubun.value=gubun;
			team.method="post";
			team.action="/team/";
			team.submit();
		}
	</script>
	<body class="is-preload">
<form name="team">
	<input type="hidden" name="t_gubun">
</form>	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="javascript:goIndex()" class="logo">
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
									<a href="javascript:goPage('manage_list','Product')">관리페이지</a>
									<a href="javascript:goPage('memberMypage','Member')">Mypage</a>
									<a href="javascript:goPage('basket','Product')">장바구니</a>
									<a href="javascript:goPage('memberLogin','Member')" style="margin-right:0.5em;">LogIn</a>
									<a href="javascript:goPage('memberJoin','Member')">Join</a>
								</div>

						</div>
					</header>
				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="javascript:goPage('shop','Product')">식료품</a></li>
							<li><a href="javascript:goPage('shop','Product')">의류</a></li>
							<li><a href="javascript:goPage('shop','Product')">앤티크</a></li>
							<li><a href="javascript:goPage('shop','Product')">원예</a></li>
							<li><a href="javascript:goPage('shop','Product')">음반</a></li>
							<li><a href="javascript:goPage('shop','Product')">공구</a></li>
							<li><a href="javascript:goPage('qna_list','Board')">QNA</a></li>
							<li><a href="javascript:goPage('faq_list','Board')">FAQ</a></li>
							<li><a href="javascript:goPage('free_board','Board')">담벼락</a></li>
							<li><a href="elements.jsp">Elements</a></li>
						</ul>
					</nav>

					