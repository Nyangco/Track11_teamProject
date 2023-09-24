<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function comma(num){
		var len, point, str;  
		  
		num = num + "";  
		point = num.length % 3 ;
		len = num.length;  
	  
		str = num.substring(0, point);  
		while (point < len) {  
		    if (str != "") str += ",";  
		    str += num.substring(point, point + 3);  
		    point += 3;  
		}  
		return str;
	}function plus(){
		$('.merchan_count').val(Number($('.merchan_count').val())+1);
		check_merchan_count();
	}function minus(){
		$('.merchan_count').val(Number($('.merchan_count').val())-1);
		check_merchan_count();
	}function check_merchan_count(){
		let price = Number($('#price').text().replace(',', '').replaceAll('￦',''));
		console.log(price);
		if(buy.m_count.value<1||!$.isNumeric(buy.m_count.value)){
			alert("구매수량은 1 이상이여아 합니다.");
			$('.merchan_count').val(1);
			buy.m_count.focus();
		}else{
			$('#t_total').val(comma(price*Number($('.merchan_count').val()))+"￦");
		}
	}function goPurchase(){
		
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
										<img src="attach/${dto.getImages() }">
									</div>
									<div class="detail_description">
										<div class="merchan_name">${dto.getName() }</div>
										<div class="merchan_simple_desc">${dto.getOne_sentence() }</div>
										<div class="merchan_price">${dto.getPrice() }</div>
										<div class="merchan_info">
											<div>상품번호<span>${dto.getProduct_no() }</span></div>
											<div>원산지<span>${dto.getOrigin_country() }</span></div>
											<div>판매국가<span>${dto.getSell_country() }</span></div>
											<div>등록일<span>${dto.getReg_date() }</span></div>
										</div>
										<div class="merchan_desc">${dto.getDescription() }</div>
									</div>
								</div>
								<form class="side_bar" name="buy">
									<input type="hidden" name="t_gubun">
									<input type="hidden" name="t_product_no">
									<div class="merchan_title">상품 </div>
									<div>제품명<div>${dto.getName() }</div></div>
									<div>가격<div id="price">${dto.getPrice() }</div></div>
									<div class="merchan_number">개수
										<div>
											<div onclick="minus()"><i class="fa-solid fa-square-minus fa-2xl"></i></div>
											<input type="text" value="1" class="merchan_count" name="m_count" onchange="check_merchan_count()">
											<div onclick="plus()"><i class="fa-solid fa-square-plus fa-2xl"></i></div>
										</div>
									</div>
									<div>총 금액<input type="text" name="t_total" readonly id="t_total"></div>
									<div class="merchan_butt">
										<input type="button" onclick="goPage('purchase')" value="구매">
										<input type="button" onclick="goBucket()" value="장바구니">
									</div>
								</form>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>