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
			manage.method="post";
			manage.action="/team/";
			manage.submit();
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
				<form name="manage" class="manage_update">
				<input type="hidden" name="t_gubun" value="DBmanage_update">
					<fieldset>
						<table style="width:90%">
							<colgroup>
								<col width="44%">
								<col width="10%">
								<col width="*">
							</colgroup>
							<tr>
								<td rowspan="7" class="manage_detail_img" style="position:relative;width:400px;height:400px;"><img id="preview-image" src="attach/${t_dto.getImages() }"></td>
								<th>상품번호</th>
								<td>
									<input type="text" name="t_product_no" value="${t_dto.getProduct_no() }">
								</td>	
							</tr>
							<tr>
								<th>상품명</th>
								<td>
									<input type="text" name="t_name" value="${t_dto.getName() }">
								</td>													
							</tr>
							<tr>
								<th>가격</th>
								<td>
									<input type="text" name="t_price" value="${t_dto.getPrice().trim() }">
								</td>													
							</tr>
							<tr>
								<th>원산지</th>
								<td>
									<input type="text" name="t_origin_country" value="${t_dto.getOrigin_country() }">
								</td>
							</tr>
							<tr>
								<th>판매국가</th>
								<td>
									<input type="text" name="t_sell_country" value="${t_dto.getSell_country() }">
								</td>	
							</tr>
							<tr>
								<th>등록일</th>
								<td>
									<input type="text" name="t_reg_date" value="${t_dto.getReg_date() }">
								</td>
							</tr>
							<tr>
								<th>재고</th>
								<td>
									<input type="text" name="t_stock" value="${t_dto.getStock() }">
								</td>
							</tr>
							<tr>
								<td><input type="file" class="input600" name="t_attach" id="input-image" value="${t_dto.getImages() }"></td>
								<th>상태</th>
								<td>
									<select name="t_status">
										<option value="1">판매 중</option>
										<option value="0">판매 중지</option>
									</select>
								</td>
							</tr>
							<tr>
								<th colspan="3" style="text-align:center;font-size:24px;">한줄 설명</th>
							</tr>
							<tr>
								<td colspan="3"><input type="text" name="t_c_one_sent" value="${t_dto.getOne_sentence() }"></td>
							</tr>
							<tr>
								<th colspan="3" style="text-align:center;font-size:24px;">상세 설명</th>
							</tr>
							<tr>
								<td colspan="3"><textarea name="t_c_desc" style="resize: none;">${t_dto.getDescription() }</textarea></td>
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