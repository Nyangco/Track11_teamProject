<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goRefund(){
		if(confirm("정말 환불/교환 신청을 하시겠습니까?")){
			if(mem.t_search.value==""){
				alert("환불/반품 사유를 적어주세요");
				mem.t_search.focus();
				return;
			}else{
				mem.method="post";
				mem.action="/team/";
				mem.submit();
			}
		}
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section class="">
								<div class="main_title">
									<h1 style="text-align:center;">환불/교환</h1>
								</div>
							</section>
							<section class="lines">
								<article>
									<form name="mem">
										<input type="hidden" name="t_gubun" value="DBrefund">
										<input type="hidden" name="t_purchase_no" value="${t_purchase_no }">
										<table style="width:45%">
											<colgroup>
												<col width="30%">
												<col width="*">
											</colgroup>
											<tr>
												<th>환불/교환</th>
												<td>
													<select name="t_select">
														<option value="refund">환불</option>
														<option value="change">교환</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>환불/교환 사유</th>
												<td>
													<input type="text" name="t_search">
												</td>
											</tr>
											<tr>
												<th colspan="2" style="padding-top:0.75em;">
													<input type="button" value="환불/교환 신청" onclick="goRefund()">
													<input type="button" value="목록" onclick="goPage('purchase_list')">
												</th>
											</tr>
										</table>
									</form>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>