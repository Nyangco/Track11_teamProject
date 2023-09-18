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
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section class="">
								<div class="main_title">
									<h1>Shop</h1>
									<input type="text" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
									<select style="width:170px;float:right;margin-left:0.5em;">
										<option>가나다라마바사</option>
									</select>
									<a href="javascript:icon_change()" class="list_icon" style="float:right;font-size:32px;border:none;"><i class="fa-solid fa-list-ul"></i></a>
								</div>
							</section>
							<section class="tiles viewpage">
								<article class="style1">
									<span class="image">
										<img src="../images/door.png" alt="" />
									</span>
									<a href="detail.jsp">
										<h2>어디로든 문</h2>
										<div class="content">
											<p>9,000,000,000￦</p>
										</div>
									</a>
								</article>
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
										<tr>
											<td><a href="detail.jsp">001</a></td>
											<td><a href="detail.jsp">어디로든 문</a></td>
											<td style="text-align:left;">9,000,000,000￦</td>
											<td>2025-40-21</td>
											<td>3,214</td>
										</tr>
									</table>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>