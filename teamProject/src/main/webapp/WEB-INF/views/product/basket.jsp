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
	}function decover(str){
		return str.replaceAll("￦","").replaceAll(",","");
	}function cover(str){
		return "￦"+comma(str);
	}function plus(pn){
		const count = "#count_"+pn;
		$(count).val(Number($(count).val())+1);
		check_merchan_count(pn);
	}function minus(pn){
		const count = "#count_"+pn;
		$(count).val(Number($(count).val())-1);
		check_merchan_count(pn);
	}function check_merchan_count(pn){
		const count = "#count_"+pn;
		const stock = "#stock_"+pn;
		const price = "#price_"+pn;
		const total = "#total_"+pn;
		
		const count_val = Number($(count).val());
		const stock_val = Number($(stock).text());
		const price_val = Number($(price).text());
		
		if(Number(count_val)>stock_val){
			alert("재고보다 많은 수량을 구매할 수 없습니다.");
			$(count).val(1);
		}else if(count_val<=0){
			if(confirm("장바구니에서 상품을 삭제하시겠습니까?")){
				$.ajax({
					type : "post",
					url : "BasketDelete",
					dataType : "text",
					data : "t_product_no="+pn+"&t_id="+basket.t_id.value,
					error : function(){
						alert("삭제에 실패했습니다. 다시 시도해주세요");
					},
					success : function(data){
						if(data==1){
							alert("삭제되었습니다");
							history.go(0);
						}else{
							alert("삭제에 실패했습니다. 다시 시도해주세요");
						}
					}
				});
			}
		}else{
			const numeric = price_val*count_val;
			$(total).text("￦"+comma(numeric));
			let total_all = 0;
			for(let k=1; k<=${t_count}; k++){
				let price_str = ".price_"+k;
				let count_str = ".count_"+k;
				total_all+= Number($(price_str).text())*Number($(count_str).val());
			}
			$('#total_all').text(cover(total_all+2500));
			
			$.ajax({
				type : "post",
				url : "changeBasket",
				dataType : "text",
				data : "t_product_no="+pn+"&t_id="+basket.t_id.value+"&t_count="+count_val,
				error : function(){
					alert("상품 갯수 갱신에 실패하였습니다. 다시 시도해주세요");
				},
				success : function(data){
					if(data!=1)
						alert("상품 갯수 갱신에 실패하였습니다. 다시 시도해주세요");
				}
			});
		}
	}function goBasket(){
		basket.method="post";
		basket.action="/team/";
		basket.submit();
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
										<input type="hidden" name="t_gubun" value="DBbasket">
										<input type="hidden" name="t_total_count" value="${t_count }">
										<input type="hidden" name="t_id" value="${sId }">
										<table style="width:100%">
											<colgroup>
												<col width="10%">
												<col width="*">
												<col width="10%">
												<col width="10%">
												<col width="15%">
											</colgroup>
											<tr>
												<th>상품번호</th>
												<th>상품명</th>
												<th>단가</th>
												<th>갯수</th>
												<th>총 가격</th>
											</tr>
											<c:forEach items="${t_arr}" var="dto" varStatus="status">
												<tr>
													<td>
														<span id="pn_${dto.getProduct_no() }">${dto.getProduct_no() }</span>
														<span style="display:none;" id="stock_${dto.getProduct_no() }">${dto.getStock() }</span>
														<span style="display:none;" id="price_${dto.getProduct_no() }" class="price_${status.count }">${dto.getPrice() }</span>
														<input type="hidden" name="t_product_no_${dto.getProduct_no() }" value="${dto.getProduct_no() }">
													</td>
													<td>${dto.getName() }</td>
													<td>${dto.getCprice() }</td>
													<td>
														<div onclick="minus('${dto.getProduct_no() }')"><i class="fa-solid fa-square-minus fa-2xl"></i></div>
														<input type="text" value="${dto.getCount() }" id="count_${dto.getProduct_no() }" class="merchan_count count_${status.count }" name="t_count_${dto.getProduct_no() }" onchange="check_merchan_count('${dto.getProduct_no() }')">
														<div onclick="plus('${dto.getProduct_no() }')"><i class="fa-solid fa-square-plus fa-2xl"></i></div>
													</td>
													<td id="total_${dto.getProduct_no() }">
														${dto.getTotal() }
													</td>
												</tr>
											</c:forEach>
											<c:if test="${t_arr.size() ne 0 }">
												<tr>
													<td colspan="4">배송비</td>
													<td >￦2,500</td>
												</tr>
												<tr>
													<td colspan="4">총 금액</td>
													<td id="total_all">${t_total }</td>
												</tr>
											</c:if>
											<c:if test="${t_arr.size() eq 0 }">
												<tr>
													<td colspan="5" style="text-align:center;">장바구니에 상품이 없습니다.</td>
												</tr>
											</c:if>
										</table>
									</form>
								</article>
							</section>
							<c:if test="${t_arr.size() ne 0 }">
								<div class="btn_group sell">
									<input type="button" value="구매하기" onclick="goBasket()">
								</div>
							</c:if>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>