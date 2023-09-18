<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
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
		}else{
			$('#cash_name').show();
			$('#cash_receipt').show();
		}
	}function shipping(){
		if($('#shipping_sel').val()=='n'){
			fm.t_receive_name.value="";
			fm.t_receive_tel1.value="";
			fm.t_receive_tel2.value="";
			fm.t_receive_tel3.value="";
			fm.t_receive_postal_code.value="";
			fm.t_receive_address.value="";
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
		if(checkValue(fm.t_receive_name,999,"수령인"))return;
		else if(checkValue(fm.t_receive_tel1,999,"연락처"))return;
		else if(checkValue(fm.t_receive_tel2,999,"연락처"))return;
		else if(checkValue(fm.t_receive_postal_code,999,"배송지 주소"))return;
		else if(checkValue(fm.t_receive_address,999,"배송지 주소"))return;
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
			location.href='purchase_complete.jsp'	
		}
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
									<h1>구매 페이지</h1>
								</div>
							</section>
							<section>
								<form class="purchase" name="fm">
									<div class="purchase_desc">
										<table class="purchase_top">
											<colgroup>
												<col width="15%">
												<col width="*">
												<col width="10%">
												<col width="7%">
												<col width="15%">
											</colgroup>
											<tr>
												<th colspan="2">
													상품정보
												</th>
												<th>
													배송비
												</th>
												<th>
													수량
												</th>
												<th>
													상품금액
												</th>
											</tr>
											<tr>
												<td>
													<img src="../images/door.png">
												</td>
												<td>
													어디로든 문
												</td>
												<td>
													￦2,500
												</td>
												<td>
													1
												</td>
												<td>
													￦9,000,000,000
												</td>
											</tr>
										</table>
										<table class="purchase_who">
											<colgroup>
											
											</colgroup>
											<tr>
												<th colspan="2" class="purchase_table_header">구매자 정보</th>
											</tr>
											<tr>
												<td>김개똥</td>
											</tr>
											<tr>
												<td>012-3456-7890</td>
											</tr>
											<tr>
												<td>abc@naver.com</td>
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
													<input type="text" value="김개똥" name="t_receive_name">
												</td>
											</tr>	
											<tr>
												<th>
													연락처
												</th>
												<td>
													<input type="tel" value="012" name="t_receive_tel1">-
													<input type="tel" value="3456" name="t_receive_tel2">-
													<input type="tel" value="7890" name="t_receive_tel3">
												</td>
											</tr>	
											<tr>
												<th>
													배송지 주소
												</th>
												<td>
													<input type="text" name="t_receive_postal_code" style="width:70%;display:inline" readonly value="(03172)">
													<input type="button" onclick="" value="주소 검색">
													<input type="text" name="t_receive_address" readonly value="서울 종로구 세종대로 175 세종이야기">
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
												<td>￦9,000,002,500</td>
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
											<input type="button" value="결제하기" onclick="goBuy()">
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>