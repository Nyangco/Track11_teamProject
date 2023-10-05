<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section class="purchase_complete">
								<div>
									<h1>주문이 완료되었습니다.</h1>
									<h6>주문 번호 : ${t_purchase_no }</h6>
									<c:if test="${t_pay_method eq 'cash' }">
										<p>입금하실 계좌 : 012345-67-890123</p>
										<p>입금하실 금액 : ${t_total }</p>
									</c:if>
									<c:if test="${t_pay_method ne 'cash' }">
										<p>배송에는 통상 2~3일 정도 소요됩니다.</p>
									</c:if>
									<p>자세한 사항은 마이 페이지의 구매 이력을 참조해주세요.</p>
								</div>
								<div style="text-align:center;"><input type="button" value="홈으로" onclick="goPage('index')"></div>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>