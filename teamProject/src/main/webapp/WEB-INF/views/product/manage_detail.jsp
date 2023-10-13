<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goUpdate(){
		manage.t_gubun.value="manage_update";
		manage.method="post";
		manage.action="/team/";
		manage.submit();
	}function goDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			manage.t_gubun.value="DBmanage_delete";
			manage.method="post";
			manage.action="/team/";
			manage.submit();
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
									<input type="hidden" name="t_gubun">
									<input type="hidden" name="t_product_no" value="${t_dto.getProduct_no() }">
										<fieldset>
											<table style="width:90%">
												<colgroup>
													<col width="50%">
													<col width="10%">
													<col width="*">
												</colgroup>
												<tr>
													<td rowspan="9" class="manage_detail_img" style="position:relative;"><img src="attach/${t_dto.getImages() }"></td>
													<th>상품번호</th>
													<td>
														${t_dto.getProduct_no() }
													</td>	
												</tr>
												<tr>
													<th>상품명</th>
													<td>
														${t_dto.getName() }
													</td>													
												</tr>
												<tr>
													<th>가격</th>
													<td>
														${t_dto.getPrice() }
													</td>													
												</tr>
												<tr>
													<th>상품 구분</th>
													<td>${t_dto.getShop() }</td>
												</tr>
												<tr>
													<th>원산지</th>
													<td>
														${t_dto.getOrigin_country() }
													</td>
												</tr>
												<tr>
													<th>판매국가</th>
													<td>
														${t_dto.getSell_country() }
													</td>	
												</tr>
												<tr>
													<th>등록일</th>
													<td>
														${t_dto.getReg_date() }
													</td>
												</tr>
												<tr>
													<th>재고</th>
													<td>${t_dto.getStock() }</td>
												</tr>
												<tr>
													<th>판매 수량</th>
													<td>${t_dto.getSell_count() }</td>
												</tr>
												<tr>
													<td>${fn:substring(t_dto.getImages(),fn:indexOf(t_dto.getImages(),'_')+1,fn:length(t_dto.getImages())) }</td>
													<th>상태</th>
													<td>
														<c:choose>
															<c:when test="${t_dto.getStatus() eq '1' }">판매 중</c:when>
															<c:when test="${t_dto.getStatus() eq '0' }">판매 중지</c:when>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th colspan="3" style="text-align:center;font-size:24px;">한줄 설명</th>
												</tr>
												<tr>
													<td colspan="3">${t_dto.getOne_sentence() }</td>
												</tr>
												<tr>
													<th colspan="3" style="text-align:center;font-size:24px;">상세 설명</th>
												</tr>
												<tr>
													<td colspan="3"><textarea name="t_c_desc" readonly style="resize: none;white-space:pre-wrap;">${t_dto.getDescription() }</textarea></td>
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