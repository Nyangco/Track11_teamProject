<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	function receipt_change(){
		if($('#receipt_sel').val()!='n'){
			$('#receipt_text').show();
		}else{
			$('#receipt_text').hide();
		}
	}function method_change(){
		if($('#method_sel').val()!='cash'){
			$('#cash_name').hide();
			$('#cash_receipt').hide();
			$('#cashBtn').hide();
			$('#cardBtn').show();
		}else{
			$('#cash_name').show();
			$('#cash_receipt').show();
			$('#cashBtn').show();
			$('#cardBtn').hide();
		}
	}function shipping(){
		if($('#shipping_sel').val()=='n'){
			fm.t_receive_name.value="";
			fm.t_receive_tel1.value="";
			fm.t_receive_tel2.value="";
			fm.t_receive_tel3.value="";
			fm.t_addr1.value="";
			fm.t_addr2.value="";
			fm.t_addr3.value="";
			fm.t_receive_memo="";
		}else{
			fm.reset();
		}
	}function checkValue(dir,len,obj){
		if(dir.value==""){
			alert(obj+"을/를 입력하세요");
			dir.focus();
			return true;
		}else if(dir.value.length>len){
			alert(obj+"은/는 "+len+"자 까지 입력 가능합니다.");
			dir.focus();
			return true;
		}else return false;
	}function goBuy(){
		if(checkValue(fm.t_receive_name,999,"수령인"))return true;
		else if(checkValue(fm.t_receive_tel1,999,"연락처"))return true;
		else if(checkValue(fm.t_receive_tel2,999,"연락처"))return true;
		//else if(checkValue(fm.t_addr1,999,"배송지 주소"))return true;
		//else if(checkValue(fm.t_addr2,999,"배송지 주소"))return true;
		//else if(checkValue(fm.t_addr3,999,"배송지 주소"))return true;
		else return false;
	}function goCash(){
		if(goBuy())return;
		else if(fm.t_pay_method.value=="cash"&&fm.t_pay_name.value==""){
			alert("입금자명을 입력해주세요");
			fm.t_pay_name.focus();
			return;
		}
		else if(fm.t_cash_receipt.value!="n"&&fm.t_cash_recipt_number.value==""){
			alert("인증번호를 입력해주세요");
			fm.t_cash_recipt_number.focus();
			return;
		}else{
    	    fm.t_gubun.value="DBpurchase";
			fm.method="post";
			fm.action="/team/";
			fm.submit();
		}
	}function goCard(){
		if(goBuy())return;
		else{
			requestPay();
		}
	}function requestPay() {
		const addr = fm.t_addr2.value+fm.t_addr3.value;
		const mname = "<c:if test='${p_arr.size()>1}'>${p_arr.get(0).getName()}등..</c:if><c:if test='${p_arr.size()==1}'>${p_arr.get(0).getName()}</c:if>";
		  IMP.init('iamport'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg: "INIBillTst",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : mname,
		    amount : 100,
		    buyer_email : '${m_dto.getEmail() }',
		    buyer_name : '${m_dto.getName() }',
		    buyer_tel : '${m_dto.getContact() }',
		    buyer_addr : addr,
		    buyer_postcode : fm.t_addr1.value
		  }, function (rsp) { // callback
		      if (rsp.success) {
		    	  fm.t_merchant_uid.value=rsp.merchant_uid;
		    	  fm.t_gubun.value="DBpurchase";
		    	  fm.method="post";
				  fm.action="/team/";
				  fm.submit();
		      } else {
		    	  alert("결제에 실패했습니다");
		      }
		  });
		}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section class="">
								<div class="main_title">
									<h1>구매 페이지</h1>
								</div>
							</section> 
							<section>
								<form class="purchase" name="fm">
									<input type="hidden" name="t_gubun" >
									<input type="hidden" name="t_id" value="${sId }">
									<input type="hidden" name="t_count" value="${t_count }">
									<input type="hidden" name="t_bd" value="${t_bd }">
									<input type="hidden" name="t_merchant_uid">
									<div class="purchase_desc">
										<table class="purchase_top">
											<colgroup>
												<col width="15%">
												<col width="*">
												<col width="7%">
												<col width="15%">
											</colgroup>
											<tr>
												<th colspan="2">
													상품정보
												</th>
												<th>
													수량
												</th>
												<th>
													상품금액
												</th>
											</tr>
											<c:forEach items="${p_arr }" var="p_dto" varStatus="status">
												<tr>
													<td>
														<img src="attach/${p_dto.getImages() }">
														<input type="hidden" name="t_product_no_${status.count }" value="${p_dto.getProduct_no() }">
													</td>
													<td>
														${p_dto.getName() }
													</td>
													<td>
														${p_dto.getCount() }
														<input type="hidden" name="t_count_${status.count }" value="${p_dto.getCount() }">
													</td>
													<td>
														${p_dto.getPrice() }
													</td>
												</tr>
											</c:forEach>
										</table>
										<table class="purchase_who">
											<colgroup>
											
											</colgroup>
											<tr>
												<th colspan="2" class="purchase_table_header">구매자 정보</th>
											</tr>
											<tr>
												<td>${m_dto.getName() }</td>
											</tr>
											<tr>
												<td>${m_dto.getContact() }</td>
											</tr>
											<tr>
												<td>${m_dto.getEmail() }</td>
											</tr>
										</table>
										<table class="purchase_where">
										
											<colgroup>
											
											</colgroup>
											<tr>
												<th colspan="2" class="purchase_table_header">배송지 정보</th>
											</tr>
											<tr>
												<th>
													배송지 선택
												</th>
												<td>
													<select id="shipping_sel" onchange="shipping()">
														<option value="o">기존 배송지</option>
														<option value="n">신규 배송지</option>
													</select>														
												</td>
											</tr>	
											<tr>
												<th>
													수령인
												</th>
												<td>
													<input type="text" value="${m_dto.getName() }" name="t_receive_name">
												</td>
											</tr>	
											<tr>
												<th>
													연락처
												</th>
												<td>
													<input type="tel" value="${fn:substring(m_dto.getContact(),0,3) }" name="t_receive_tel1">-
													<input type="tel" value="${fn:substring(m_dto.getContact(),4,8) }" name="t_receive_tel2">-
													<input type="tel" value="${fn:substring(m_dto.getContact(),9,13) }" name="t_receive_tel3">
												</td>
											</tr>	
											<tr>
												<th>
													배송지 주소
												</th>
												<!-- 
												<input type="text" name="t_addr1" style="width:70%;display:inline" readonly value="${m_dto.getAddr1() }">
												 -->
												<td>
													<input type="text" name="t_addr1" style="width:70%;display:inline" readonly value="1">
													<input type="button" onclick="" value="주소 검색">
													<input type="text" name="t_addr2" readonly value="2">
													<input type="text" name="t_addr3" readonly value="3">
												</td>
											</tr>	
											<tr>
												<th>
													배송 메모
												</th>
												<td>
													<input type="text" name="t_receive_memo">
												</td>
											</tr>											
										</table>
										<table class="purchase_how">
											<colgroup>
												<col width="30%">
												<col width="*">
											</colgroup>
											<tr>
												<th>주문 금액</th>
												<td><input type="text" name="t_total" value="${t_total }" readonly></td>
											</tr>
											<tr>
												<th>결제 수단 선택</th>
												<td>
													<select onchange="method_change()" id="method_sel" name="t_pay_method">
														<option value="cash">현금</option>
														<option value="card">카드</option>
													</select>
												</td>
											</tr>
											<tr id="cash_name">
												<th>입금자명 입력</th>
												<td>
													<input type="text" name="t_pay_name">
												</td>
											</tr>
											<tr id="cash_receipt">
												<th>현금 영수증</th>
												<td>
													<select onchange="receipt_change()" id="receipt_sel" name="t_cash_receipt"> 
														<option value="n">신청 안함</option>
														<option value="c">소득 공제용</option>
														<option value="b">사업자증빙용,세금계산서</option>
													</select>
													<input type="text" name="t_cash_recipt_number" placeholder="인증 번호를 이곳에 입력" id="receipt_text" style="display:none;">
												</td>
											</tr>
										</table>
										<div class="btn_group">
											<input type="button" value="결제하기" id="cashBtn" onclick="goCash()">
											<input type="button" value="결제하기" id="cardBtn" onclick="goCard()" style="display:none;">
											<input type="button" value="뒤로가기" onclick="history.go(-1)">
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>