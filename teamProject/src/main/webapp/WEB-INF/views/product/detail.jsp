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
		if(buy.m_count.value<1||!$.isNumeric(buy.m_count.value)){
			alert("구매수량은 1 이상이여아 합니다.");
			$('.merchan_count').val(1);
			buy.m_count.focus();
		}	
	}function goBucket(){
		alert("상품이 장바구니에 담겼습니다");
		location.href='detail.jsp'
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<div id="tags">
									<div class="tag_box">
										<span style="float:right;border-right:1px solid white;border-left:1px solid gray;">장바구니</span>
									</div>
								</div>	
							</header>
							<section class="">
								<div class="main_title">
									<h1>Detail</h1>
								</div>
							</section>
							<section>
								<div class="detail">
									<div class="detail_img">
										<img src="../images/door.png">
									</div>
									<div class="detail_description">
										<div class="merchan_name">어디로든 문</div>
										<div class="merchan_simple_desc">도라에몽에 나오는 어디로든 문 입니다.</div>
										<div class="merchan_price">9,000,000,000￦	</div>
										<div class="merchan_info">
											<div>상품번호<span>001</span></div>
											<div>원산지<span>일본</span></div>
											<div>판매국가<span>대한민국</span></div>
											<div>등록일<span>2025-40-21</span></div>
										</div>
										<div class="merchan_desc">
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
											도라에몽에 나오는 어디로든 문 입니다.
										</div>
									</div>
								</div>
								<form class="side_bar" name="buy">
									<div class="merchan_title">상품 </div>
									<div>제품명<div>어디로든 문</div></div>
									<div>가격<div>￦9,000,000,000</div></div>
									<div>배송비<div>￦2,500</div></div>
									<div class="merchan_number">개수
										<div>
											<div onclick="minus()"><i class="fa-solid fa-square-minus fa-2xl"></i></div>
											<input type="text" value="1" class="merchan_count" name="m_count" onchange="check_merchan_count()">
											<div onclick="plus()"><i class="fa-solid fa-square-plus fa-2xl"></i></div>
										</div>
									</div>
									<div>총 금액<div>￦9,000,002,500</div></div>
									<div class="merchan_butt">
										<input type="button" onclick="location.href='purchase.jsp'" value="구매">
										<input type="button" onclick="goBucket()" value="장바구니">
									</div>
								</form>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>