<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goDetail(pn){
		purchase.t_purchase_no.value=pn;
		purchase.method="post";
		purchase.action="/team/";
		purchase.submit();
	}function alertSelect(){
		if(purchase.t_select.value=="status"){
			alert("0:입금 대기중\n1:결제 완료\n2:배송 대기중\n3:배송중\n4:배송완료\n5:구매 완료\n6:반품 대기중\n7:반품 완료\n8:교환 대기중\n9:교환 완료");
		}
	}function goSearch(){
		purchase.t_nowPage.value="1";
		purchase.t_gubun.value="sold_list";
		purchase.method="post";
		purchase.action="/team/";
		purchase.submit();
	}function goPaging(pn){
		purchase.t_nowPage.value=pn;
		purchase.t_gubun.value="sold_list";
		purchase.method="post";
		purchase.action="/team/";
		purchase.submit();
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section class="">
								<form name="purchase">
									<input type="hidden" name="t_gubun" value="sold_detail">
									<input type="hidden" name="t_purchase_no">
									<input type="hidden" name="t_nowPage" value="${t_nowPage }">
									<div class="main_title">
										<h1>판매 관리</h1>
										<a href="javascript:" onclick="goSearch()" style="float:right;font-size:27px;margin-left:0.25em;"><i class="fa-solid fa-magnifying-glass"></i></a>
										<input type="text" name="t_search" onkeypress="if(event.keycode==13){goSearch()}" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
										<select onchange="alertSelect()" name="t_select" style="width:170px;float:right;margin-left:0.5em;">
											<option value="purchase_no">구매번호</option>
											<option value="status">배송상태</option>
										</select>
									</div>
								</form>
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
									<input type="button" value="상품 관리" onclick="goPage('manage_list')" style="margin-top:10px;float:right;">
									<input type="button" value="회원 관리" onclick="goPage('manage_member_list')" style="margin-top:10px;float:right;">
								</article>
							</section>
							<div class="paging">
								${t_paging }
							</div>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>