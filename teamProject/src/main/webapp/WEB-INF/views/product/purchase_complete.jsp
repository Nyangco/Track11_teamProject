<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<div id="tags">
									<div class="tag_box">
										<span style="float:right;border-right:1px solid white;border-left:1px solid gray;">장바구니</span>
									</div>
								</div>	
							</header>
							<section class="purchase_complete">
								<div>
									<h1>구매가 완료되었습니다.</h1>
									<h6>구매 번호 : ${t_purchase_no }</h6>
									<p>배송에는 통상 2~3일 정도 소요됩니다.</p>
									<p>자세한 사항은 마이 페이지의 구매 이력을 참조해주세요.</p>
								</div>
								<div style="text-align:center;"><input type="button" value="홈으로" onclick="goPage('index')"></div>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>