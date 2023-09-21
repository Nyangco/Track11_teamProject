<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goList(){
		location.href='purchase_list.jsp';
	}function goRefund(){
		location.href='refund.jsp';
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="purchase_detail">
								<div>
									<form name="mem">
										<fieldset>
											<legend>상세 보기</legend>
											<table style="width:80%">
												<colgroup>
													<col width="20%">
													<col width="*">
													<col width="7%">
													<col width="20%">
												</colgroup>
												<tr>
													<th colspan="4" class="title">구매 목록</th>
												</tr>
												<tr>
													<th colspan="2">상품명</th>
													<th>갯수</th>
													<th>총금액</th>
												</tr>
												<tr>
													<td colspan="2"><a href="">어디로든 문</a></td>
													<td>1</td>
													<td>￦9,000,000,000</td>
												</tr>
												<tr>
													<td colspan="3">배송비</td>
													<td>￦2,500</td>
												</tr>
												<tr>
													<td colspan="3">총 금액</td>
													<td>￦9,000,002,500</td>
												</tr>
												<tr>
													<th colspan="4" class="title">배송지 정보</th>
												</tr>
												<tr>
													<th>수령인</th>
													<td colspan="3">김개똥</td>
												</tr>
												<tr>
													<th>연락처</th>
													<td colspan="3">012-3456-7890</td>
												</tr>
												<tr>
													<th>배송지</th>
													<td colspan="3">(03172)서울 종로구 세종대로 175 세종이야기</td>
												</tr>
												<tr>
													<th>배송메모</th>
													<td colspan="3">-</td>
												</tr>
												<tr>
													<th colspan="4" class="title">결제 정보</th>
												</tr>
												<tr>
													<th>결제 수단</th>
													<td colspan="3">현금</td>
												</tr>
												<tr>
													<th>현금영수증</th>
													<td colspan="3">소득공제(012-3456-7890)</td>
												</tr>
												<tr>
													<th colspan="4" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="목록으로" onclick="goWork('purchase_list','Member')" style="display:inline-block;">
														<input type="button" value="반품/교환" onclick="goWork('refund','Member')" style="display:inline-block;">
													</th>
												</tr>
											</table>
										</fieldset>
									</form>
								</div>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>