<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goUpdate(){
		location.href='update.jsp';
	}function goExit(){
		location.href='../index.jsp';
	}function goPurchase_list(){
		location.href='purchase_list.jsp'
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="">
								<div>
									<form name="mem">
										<input type="hidden" name="t_id">
										<input type="hidden" name="t_requestPage">
										<fieldset>
											<legend>MyPage</legend>
											<table style="width:50%">
												<colgroup>
												
												</colgroup>
												<tr>
													<th>ID</th>
													<td>manager</td>
												</tr>
												<tr>
													<th>성함</th>
													<td>김개똥</td>
												</tr>
												<tr>
													<th>닉네임</th>
													<td>홍길동</td>
												</tr>
												<tr>
													<th>이메일</th>
													<td>abc@naver.com</td>
												</tr>
												<tr>
													<th>연락처</th>
													<td>012-3456-7890</td>
												</tr>
												<tr>
													<th>주소지</th>
													<td>(03172)서울 종로구 세종대로 175 세종이야기</td>
												</tr>
												<tr></tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="회원 정보 변경" onclick="goUpdate()" style="display:inline-block;">
														<input type="button" value="회원 탈퇴" onclick="goExit()" style="display:inline-block;">
														<input type="button" value="구매 이력" onclick="goPurchase_list()" style="display:inline-block;">
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