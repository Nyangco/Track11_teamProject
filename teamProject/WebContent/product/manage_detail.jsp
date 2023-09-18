<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goUpdate(){
		location.href='manage_update.html'
	}function goDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='manage_detail.html'
		}
	}
</script>
<style>
	#preview-image {
		border:1px solid gray;
	}					
</style>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="">
								<div class="main_title" style="text-align:center;">
									<h1>관리 페이지</h1>
								</div>
							</section>
							<section class="">
								<div>
									<form name="manage">
										<fieldset>
											<table style="width:90%">
												<colgroup>
													<col width="47.5%">
													<col width="10%">
													<col width="*">
												</colgroup>
												<tr>
													<td rowspan="6"><img id="preview-image" style="border:1px solid gray;display:none;width:100%;" src="../images/door.png"></td>
													<th>상품번호</th>
													<td>
														C0001
													</td>	
												</tr>
												<tr>
													<th>상품명</th>
													<td>
														어디로든 문
													</td>													
												</tr>
												<tr>
													<th>가격</th>
													<td>
														￦9,000,000,000
													</td>													
												</tr>
												<tr>
													<th>원산지</th>
													<td>
														일본
													</td>
												</tr>
												<tr>
													<th>판매국가</th>
													<td>
														대한민국
													</td>	
												</tr>
												<tr>
													<th>등록일</th>
													<td>
														2025-40-21
													</td>
												</tr>
												<tr>
													<td>door.png</td>
													<th>한줄 설명</th>
													<td>
														어디로든 문입니다.
													</td>
												</tr>
												<tr>
													<th colspan="3" style="text-align:center;font-size:24px;">상세 설명</th>
												</tr>
												<tr>
													<td colspan="3"><textarea name="t_c_desc" readonly style="resize: none;">어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.</textarea></td>
												</tr>
												<tr>
													<th colspan="3" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="상품 수정" onclick="goUpdate()" style="display:inline-block;">
														<input type="button" value="상품 삭제" onclick="goDelete()" style="display:inline-block;">
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