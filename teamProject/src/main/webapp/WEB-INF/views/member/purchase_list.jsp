<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goDetail(pn){
		purchase.t_purchase_no.value=pn;
		purchase.method="post";
		purchase.action="/team/";
		purchase.submit();
	}
</script>
<form name="purchase">
	<input type="hidden" name="t_gubun" value="purchase_detail">
	<input type="hidden" name="t_purchase_no">
</form>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<div id="tags">
									<div class="tag_box">
										<span>#태그1</span>
										<span>#태그2</span>
										<span>#태그3</span>
										<span>#태그4</span>
										<span>#태그5</span>
										<span style="float:right;border-right:1px solid white;border-left:1px solid gray;">장바구니</span>
									</div>
								</div>	
							</header>
							<section class="">
								<div class="main_title">
									<h1>구매 이력</h1>
									<input type="text" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
									<select style="width:170px;float:right;margin-left:0.5em;">
										<option>가나다라마바사</option>
									</select>
								</div>
							</section>
							<section class="lines">
								<article>
									<table style="width:100%">
										<colgroup>
											<col width="10%">
											<col width="*">
											<col width="10%">
											<col width="12%">
											<col width="15%">
										</colgroup>
										<tr>
											<th>구매번호</th>
											<th>상품명</th>
											<th>금액</th>
											<th>배송 상태</th>
											<th>상세보기</th>
										</tr>
										<c:forEach items="${ t_arr}" var="t_dto">
											<tr>
												<td>${t_dto.getPurchase_no() }</td>
												<td>${t_dto.getProduct_name() }</td>
												<td>${t_dto.getPurchase_total() }</td>
												<td>
													<c:choose>
														<c:when test="${t_dto.getStatus() eq '0' }">입금 대기중</c:when>
														<c:when test="${t_dto.getStatus() eq '1' }">결제 완료</c:when>
														<c:when test="${t_dto.getStatus() eq '2' }">배송 대기중</c:when>
														<c:when test="${t_dto.getStatus() eq '3' }">배송중</c:when>
														<c:when test="${t_dto.getStatus() eq '4' }">배송완료</c:when>
														<c:when test="${t_dto.getStatus() eq '5' }">구매 완료</c:when>
														<c:when test="${t_dto.getStatus() eq '6' }">반품 대기중</c:when>
														<c:when test="${t_dto.getStatus() eq '7' }">반품 완료</c:when>
														<c:when test="${t_dto.getStatus() eq '8' }">교환 대기중</c:when>
														<c:when test="${t_dto.getStatus() eq '9' }">교환 완료</c:when>
													</c:choose>
												</td>
												<td><input type="button" value="상세 보기" onclick="goDetail('${t_dto.getPurchase_no() }')"></td>
											</tr>
										</c:forEach>
									</table>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>