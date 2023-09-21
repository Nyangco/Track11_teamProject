<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	let chk = 1;
	function checkValue(dir,len,obj){
		if(dir.value==""){
			alert(obj+"을/를 입력하세요");
			dir.focus();
			return true;
		}else if(dir.value.length>len){
			alert(obj+"은/는 "+len+"자 까지 입력 가능합니다.");
			dir.focus();
			return true;
		}else return false;
	}function goSave(){
		if(checkValue(manage.t_c_count,999,"상품번호")) return;
		else if(checkValue(manage.t_c_name,999,"상품명")) return;
		else if(checkValue(manage.t_c_price,999,"가격")) return;
		else if(checkValue(manage.t_c_ori_country,999,"원산지")) return;
		else if(checkValue(manage.t_c_sell_country,999,"판매국가")) return;
		else if(checkValue(manage.t_c_reg_date,999,"등록일")) return;
		else if(checkValue(manage.t_c_one_sent,999,"한줄 설명")) return;
		else if(checkValue(manage.t_c_desc,999,"상세 설명")) return;
		else {
			location.href='manage_detail.jsp'
		}
	}function goReset(){
		manage.reset();
		manage.t_c_count.focus();
	}
</script>
<script type="text/javascript">
	$(function(){					
		function readImage(input) {
			// 인풋 태그에 파일이 있는 경우
			if(input.files && input.files[0]) {
				// 이미지 파일인지 검사 (생략)
				// FileReader 인스턴스 생성
				const reader = new FileReader()
				// 이미지가 로드가 된 경우
				reader.onload = e => {
					const previewImage = document.getElementById("preview-image")
					previewImage.src = e.target.result;
				}
				// reader가 이미지 읽도록 하기
				reader.readAsDataURL(input.files[0])
			} else {
				// 이미지 안올렸으면
				$("#preview-image").attr('src','');
				$("#preview-image").css("display","none");
			}
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image");
		inputImage.addEventListener("change", e => {
			$("#preview-image").css("display","block");
			readImage(e.target)
		})	
	});	
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
													<td rowspan="6"><img id="preview-image" style="border:1px solid gray;display:none;height:400px;width:400px;"></td>
													<th>상품번호</th>
													<td>
														<input type="text" name="t_c_count" value="C0001">
													</td>	
												</tr>
												<tr>
													<th>상품명</th>
													<td>
														<input type="text" name="t_c_name" value="어디로든 문">
													</td>													
												</tr>
												<tr>
													<th>가격</th>
													<td>
														<input type="text" name="t_c_price" value="9000000000">
													</td>													
												</tr>
												<tr>
													<th>원산지</th>
													<td>
														<input type="text" name="t_c_ori_country" value="일본">
													</td>
												</tr>
												<tr>
													<th>판매국가</th>
													<td>
														<input type="text" name="t_c_sell_country" value="대한민국">
													</td>	
												</tr>
												<tr>
													<th>등록일</th>
													<td>
														<input type="text" name="t_c_reg_date" value="2025-40-21">
													</td>
												</tr>
												<tr>
													<td><input type="file" class="input600" name="t_attach" id="input-image"></td>
													<th>한줄 설명</th>
													<td>
														<input type="text" name="t_c_one_sent" value="어디로든 문입니다.">
													</td>
												</tr>
												<tr>
													<th colspan="3" style="text-align:center;font-size:24px;">상세 설명</th>
												</tr>
												<tr>
													<td colspan="3"><textarea name="t_c_desc">어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.어디로든 문입니다.</textarea></td>
												</tr>
												<tr>
													<th colspan="3" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="상품 수정" onclick="goSave()" style="display:inline-block;">
														<input type="button" value="다시 쓰기" onclick="goReset()" style="display:inline-block;">
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