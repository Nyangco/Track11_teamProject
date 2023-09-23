<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goManage_detail(pn){
		product.t_product_no.value=pn;
		product.method="post";
		product.action="/team/";
		product.submit();
	}
</script>
<form name="product">
	<input type="hidden" name="t_product_no">
	<input type="hidden" name="t_gubun" value="manage_detail">
</form>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="">
								<div class="main_title">
									<h1>관리 페이지</h1>
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
											<col width="15%">
											<col width="10%">
										</colgroup>
										<tr>
											<th>상품번호</th>
											<th>상품명</th>
											<th>가격</th>
											<th>등록일</th>
											<th>상태</th>
										</tr>
										<c:forEach items="${arr }" var="dto">
											<tr>
												<td><a href="javascript:goManage_detail('${dto.getProduct_no() }')">${dto.getProduct_no() }</a></td>
												<td><a href="javascript:goManage_detail('${dto.getProduct_no() }')">${dto.getName() }</a></td>
												<td style="text-align:left;">${dto.getPrice() }</td>
												<td>${dto.getReg_date() }</td>
												<td>
													<c:choose>
														<c:when test="${dto.getStatus() eq '1' }">판매 중</c:when>
														<c:when test="${dto.getStatus() eq '0' }">판매 중지</c:when>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</table>
								</article>
							</section>
							<div class="btn_group sell">
								<input type="button" value="판매 통계" onclick="goPage('manage_statistics')">
								<input type="button" value="신규 등록하기" onclick="goPage('manage_create')">
							</div>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>