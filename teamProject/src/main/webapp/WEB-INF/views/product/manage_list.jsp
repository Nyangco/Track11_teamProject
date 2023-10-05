<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goManage_detail(pn){
		product.t_product_no.value=pn;
		product.method="post";
		product.action="/team/";
		product.submit();
	}function stsconfirm(){
		if(product.t_select.value=="status"){
			alert("판매중은 1, 판매 중지는 2를 입력해주세요");			
		}
	}function goSearch(){
		product.t_gubun.value="manage_list";
		product.method="post";
		product.action="/team/";
		product.submit();
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="manage_list">
								<form name="product">
									<input type="hidden" name="t_product_no">
									<input type="hidden" name="t_gubun" value="manage_detail">
									<div class="main_title">
										<h1>관리 페이지</h1>
										<a href="javascript:" onclick="goSearch()" style="float:right;font-size:27px;margin-left:0.25em;"><i class="fa-solid fa-magnifying-glass"></i></a>
										<input type="text" name="t_search" value="${search }" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
										<select name="t_select" style="width:170px;float:right;margin-left:0.5em;" onchange="stsconfirm()">
											<option value="product_no" <c:if test="${select eq 'product_no' }">selected</c:if>>상품번호</option>
											<option value="name" <c:if test="${select eq 'name' }">selected</c:if>>상품명</option>
											<option value="status" <c:if test="${select eq 'status' }">selected</c:if>>상태</option>
											<option value="shop" <c:if test="${select eq 'shop' }">selected</c:if>>상품구분</option>
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
												<td style="text-align:right;">${dto.getPrice() }</td>
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