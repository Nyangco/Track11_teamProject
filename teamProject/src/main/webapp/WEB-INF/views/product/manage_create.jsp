<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
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
	}function confirmValue(dir,len,obj){
		if(dir.value==""){
			alert(obj+"을/를 입력하세요");
			dir.focus();
			return true;
		}else if(dir.value.length!=len){
			alert(obj+"은/는 "+len+"자로 입력해주세요.");
			dir.focus();
			return true;
		}else return false;
	}function goSave(){
		const extension = manage.t_images.value.substr(manage.t_images.value.indexOf(".")+1).toLowerCase();
		if(checkValue(manage.t_images,80,"상품 이미지")) return;
		else if(extension!="jpg"&&extension!="png"&&extension!="svg"&&extension!="gif"){
			alert("확장자는 jpg, png, svg, gif만 가능합니다");
			return;
		}
		else if(confirmValue(manage.t_product_no,5,"상품번호")) return;
		else if(checkValue(manage.t_name,40,"상품명")) return;
		else if(checkValue(manage.t_price,10,"가격")) return;
		else if(checkValue(manage.t_stock,5,"재고")) return;
		else if(checkValue(manage.t_origin_country,10,"원산지")) return;
		else if(checkValue(manage.t_sell_country,10,"판매국가")) return;
		else if(checkValue(manage.t_one_sentence,100,"한줄 설명")) return;
		else if(checkValue(manage.t_description,2000,"상세 설명")) return;
		else {
			manage.method="post";
			manage.action="/team/?t_gubun=DBmanage_create";
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
	        const reader = new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image");
	            previewImage.src = e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
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
	    readImage(e.target);
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
									<form name="manage" enctype="multipart/form-data">
										<fieldset>
											<table style="width:90%">
												<colgroup>
													<col width="10%">
													<col width="40%">
													<col width="10%">
													<col width="40%">
												</colgroup>
												<tr>
													<td colspan="4"><img id="preview-image" style="float:right;border:1px solid gray;display:none;width:100%;height:100%;"></td>
												</tr>
												<tr>
													<td colspan="4"><span>이미지는 400px*400px로 등록해주세요</span><br><input type="file" class="input600" name="t_images" id="input-image" ></td>
												</tr>
												<tr>
													<th>상품번호</th>
													<td>
														<input type="text" name="t_product_no" value="${product_no }" readonly>
													</td>
													<th>상품명</th>
													<td>
														<input type="text" name="t_name">
													</td>	
												</tr>
												<tr>
													<th>가격</th>
													<td>
														<input type="text" name="t_price">
													</td>
													<th>재고</th>
													<td>
														<input type="text" name="t_stock" >
													</td>
												</tr>
												<tr>
													<th>원산지</th>
													<td>
														<input type="text" name="t_origin_country" >
													</td>
													<th>판매국가</th>
													<td>
														<input type="text" name="t_sell_country" >
													</td>	
												</tr>
												<tr>
													<th>한줄 설명</th>
													<td colspan="3">
														<input type="text" name="t_one_sentence" >
													</td>
												</tr>
												<tr>
													<th>상세 설명</th>
													<td colspan="3"><textarea name="t_description"></textarea></td>
												</tr>
												<tr>
													<th colspan="4" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="상품 등록" onclick="goSave()" style="display:inline-block;">
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