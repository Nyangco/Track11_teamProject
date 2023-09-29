<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	let chk = 1;
	function icon_change(){
		if(chk==1){
			$('.list_icon').html('<i class="fa-solid fa-table-cells-large"></i>');
			$('.tiles').hide();
			$('.lines').show();
			chk = 0;
		}else{
			$('.list_icon').html('<i class="fa-solid fa-list-ul"></i>');
			$('.lines').hide();
			$('.tiles').show();
			chk = 1;
		}
	}function goDetail(pn){
		product.t_product_no.value=pn;
		product.method="post";
		product.action="/team/";
		product.submit();
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<c:if test="${empty arr }"><h1>상품 준비중입니다.</h1></c:if>
							<c:if test="${not empty arr }">
								<section class="">
									<form name="product">
										<input type="hidden" name="t_gubun" value="detail">
										<input type="hidden" name="t_product_no">
										<div class="main_title">
											<h1>${t_shop }</h1>
											<a href="javascript:" onclick="goSearch()" style="float:right;font-size:27px;margin-left:0.25em;"><i class="fa-solid fa-magnifying-glass"></i></a>
											<input type="text" name="t_search" value="${search }" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
											<select name="t_select" style="width:170px;float:right;margin-left:0.5em;" onchange="stsconfirm()">
												<option value="product_no" <c:if test="${select eq 'product_no' }">selected</c:if>>상품번호</option>
												<option value="name" <c:if test="${select eq 'name' }">selected</c:if>>상품명</option>
												<option value="status" <c:if test="${select eq 'status' }">selected</c:if>>상태</option>
											</select>
											<a href="javascript:icon_change()" class="list_icon" style="float:right;font-size:32px;border:none;"><i class="fa-solid fa-list-ul"></i></a>
										</div>
									</form>
								</section>
								<section class="tiles viewpage">
									<c:forEach items="${arr}" var="dto">
										<article class="style1">
											<span class="image">
												<img src="attach/${dto.getImages()}" alt="" />
											</span>
											<a href="javascript:goDetail('${dto.getProduct_no() }')">
												<h2>${dto.getName() }</h2>
												<div class="content">
													<p>${dto.getPrice() }</p>
												</div>
											</a>
										</article>
									</c:forEach>
								</section>
								<section class="lines" style="display:none;">
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
												<th>판매 건수</th>
											</tr>
											<c:forEach items="${arr}" var="dto">
												<tr>
													<td><a href="javascript:goDetail('${dto.getProduct_no() }')">${dto.getProduct_no() }</a></td>
													<td><a href="javascript:goDetail('${dto.getProduct_no() }')">${dto.getName() }</a></td>
													<td style="text-align:left;">${dto.getPrice() }</td>
													<td>${dto.getReg_date() }</td>
													<td>${dto.getSell_count() }</td>
												</tr>
											</c:forEach>
										</table>
									</article>
								</section>
							</c:if>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>