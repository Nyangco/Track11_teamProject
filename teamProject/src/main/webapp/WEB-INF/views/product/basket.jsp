<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function plus(){
		$('.merchan_count').val(Number($('.merchan_count').val())+1);
		check_merchan_count();
	}function minus(){
		$('.merchan_count').val(Number($('.merchan_count').val())-1);
		check_merchan_count();
	}function check_merchan_count(){
		if(basket.m_count.value<1||!$.isNumeric(basket.m_count.value)){
			alert("구매수량은 1 이상이여아 합니다.");
			$('.merchan_count').val(1);
			basket.m_count.focus();
		}	
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="">
								<div class="main_title">
									<h1>장바구니</h1>
								</div>
							</section>
							<section class="basket">
								<article>
									<form name="basket">
										<table style="width:100%">
											<colgroup>
												<col width="10%">
												<col width="*">
												<col width="10%">
												<col width="15%">
											</colgroup>
											<tr>
												<th>상품번호</th>
												<th>상품명</th>
												<th>가격</th>
												<th>갯수</th>
											</tr>
											<tr>
												<td>001</td>
												<td>어디로든 문</td>
												<td>
													<div onclick="minus()"><i class="fa-solid fa-square-minus fa-2xl"></i></div>
													<input type="text" value="1" class="merchan_count" name="m_count" onchange="check_merchan_count()">
													<div onclick="plus()"><i class="fa-solid fa-square-plus fa-2xl"></i></div>
												</td>
												<td>2025-40-21</td>
											</tr>
										</table>
									</form>
								</article>
							</section>
							<div class="btn_group sell">
								<input type="button" value="구매하기" onclick="goPage('purchase')">
							</div>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>