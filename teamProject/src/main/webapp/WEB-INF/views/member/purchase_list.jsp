<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goDetail(){
		location.href='purchase_detail.jsp';
	}
</script>
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
											<col width="10%">
											<col width="15%">
										</colgroup>
										<tr>
											<th>구매번호</th>
											<th>상품명</th>
											<th>구매일자</th>
											<th>금액</th>
											<th>상세보기</th>
										</tr>
										<tr>
											<td>2080940001</td>
											<td>어디로든 문</td>
											<td>2020-80-94</td>
											<td>9,000,002,500￦</td>
											<td><input type="button" value="상세 보기" onclick="goWork('purchase_detail','Member')"></td>
										</tr>
									</table>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>