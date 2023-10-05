<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goChange(pn){
		console.log(${t_purchase_no});
		$.ajax({
			type:'post',
			url:'Change_status',
			data:'t_purchase_no='+${t_purchase_no}+'&t_status='+pn,
			dataType:'text',
			error : function(){
				alert('통신 실패');
			},
			success : function(data){
				if(Number(data)==1){
					alert('배송상태 변경에 성공했습니다');
				}else{
					alert('배송상태 변경에 실패했습니다');
				}
			}
		})
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="purchase_detail">
								<div>
									<form name="mem">
										<fieldset>
											<legend>상세 보기</legend>
											<table style="width:80%">
												<colgroup>
													<col width="20%">
													<col width="*">
													<col width="7%">
													<col width="20%">
												</colgroup>
												<tr>
													<th colspan="4" class="title">구매 목록</th>
												</tr>
												<tr>
													<th colspan="2">상품명</th>
													<th>갯수</th>
													<th>총금액</th>
												</tr>
												<c:forEach items="${t_arr }" var="dto">
													<tr>
														<td colspan="2"><a href="">${dto.getProduct_name() }</a></td>
														<td>${dto.getProduct_count() }</td>
														<td>${dto.getProduct_total() }</td>
													</tr>
												</c:forEach>
												<tr>
													<td colspan="3">배송비</td>
													<td>￦2,500</td>
												</tr>
												<tr>
													<td colspan="3">총 금액</td>
													<td>${t_total }</td>
												</tr>
												<tr>
													<th colspan="4" class="title">배송지 정보</th>
												</tr>
												<tr>
													<th>수령인</th>
													<td colspan="3">${t_dto.getReceiver_name() }</td>
												</tr>
												<tr>
													<th>연락처</th>
													<td colspan="3">${t_dto.getReceiver_contact() }</td>
												</tr>
												<tr>
													<th>배송지</th>
													<td colspan="3">(${t_dto.getReceiver_addr1() })${t_dto.getReceiver_addr2() }<br>${t_dto.getReceiver_addr3() }</td>
												</tr>
												<tr>
													<th>배송상태</th>
													<td colspan="3">
														<select name="t_status" onchange="goChange(this.value)">
															<option value="0" <c:if test="${t_dto.getStatus() eq '0' }">selected</c:if>>입금 대기중</option>
															<option value="1" <c:if test="${t_dto.getStatus() eq '1' }">selected</c:if>>결제 완료</option>
															<option value="2" <c:if test="${t_dto.getStatus() eq '2' }">selected</c:if>>배송 대기중</option>
															<option value="3" <c:if test="${t_dto.getStatus() eq '3' }">selected</c:if>>배송중</option>
															<option value="4" <c:if test="${t_dto.getStatus() eq '4' }">selected</c:if>>배송완료</option>
															<option value="5" <c:if test="${t_dto.getStatus() eq '5' }">selected</c:if>>구매 완료</option>
															<option value="6" <c:if test="${t_dto.getStatus() eq '6' }">selected</c:if>>반품 대기중</option>
															<option value="7" <c:if test="${t_dto.getStatus() eq '7' }">selected</c:if>>반품 완료</option>
															<option value="8" <c:if test="${t_dto.getStatus() eq '8' }">selected</c:if>>교환 대기중</option>
															<option value="9" <c:if test="${t_dto.getStatus() eq '9' }">selected</c:if>>교환 완료</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>배송메모</th>
													<td colspan="3">${t_dto.getDelivery_memo() }</td>
												</tr>
												<tr>
													<th colspan="4" class="title">결제 정보</th>
												</tr>
												<tr>
													<th>결제 수단</th>
													<td colspan="3">
														<c:choose>
															<c:when test="${t_dto.getPay_method() eq 'cash' }">현금</c:when>
															<c:when test="${t_dto.getPay_method() eq 'card' }">카드</c:when>
														</c:choose>
													</td>
												</tr>
												<c:if test="${not empty t_dto.getCash_receipt() }">
													<tr>
														<th>현금영수증 번호</th>
														<td colspan="3">${t_dto.getCash_receipt() }</td>
													</tr>
												</c:if>
												<tr>
													<th colspan="4" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="목록으로" onclick="goPage('purchase_list')" style="display:inline-block;">
													</th>
												</tr>
											</table>
										</fieldset>
									</form>
								</div>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>