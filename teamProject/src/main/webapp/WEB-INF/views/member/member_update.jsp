<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function address_confirm(){
	 new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }
                  	//주소변수 문자열과 참고항목 문자열 합치기
                  	 addr += extraAddr;
               
               } else {
                   addr += '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   $("#addr1").val(data.zonecode);
      			 //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
      				 $("#addr2").val(addr);
       		//$("[name=memberAddr2]").val(addr);            // 대체가능

      			 // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
      	           $("#addr3").attr("readonly",false);
      	           $("#addr3").val("");
      	            $("#addr3").focus();
           }
       }).open();
   }
</script>
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
	}function goNext(dir){
		if(event.keyCode==13){
			mem.t_pw.focus();
		}
	}function goUpdate(){
		if(checkValue(mem.t_id,20,"ID")) return;
		else if(checkValue(mem.t_pw,64,"비밀번호")) return;
		else if(checkValue(mem.t_name,20,"성함")) return;
		else if(checkValue(mem.t_nickname,40,"닉네임")) return;
		else if(checkValue(mem.t_email,100,"이메일")) return;
		else if(checkValue(mem.t_tel1,3,"연락처")) return;
		else if(checkValue(mem.t_tel2,4,"연락처")) return;
		else if(checkValue(mem.t_tel3,4,"연락처")) return;
		else if(checkValue(mem.t_addr1,50,"주소지")) return;
		else if(checkValue(mem.t_addr2,50,"주소지")) return;
		else if(checkValue(mem.t_addr3,50,"주소지")) return;
		else {
			mem.method="post";
			mem.action="/team/"
			mem.submit();
		}
	}function goReset(){
		mem.reset();
		mem.t_id.focus();
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
									<input type="hidden" name="t_gubun" value="DBmember_update">
										<fieldset>
											<legend>회원정보 수정</legend>
											<table style="width:60%">
												<colgroup>
													<col width="25%">
													<col width="*">
												</colgroup>
												<tr>
													<th>ID</th>
													<td>
														<input type="text" name="t_id" style="border:none;" value="${sId }" readonly>
													</td>	
												</tr>
												<tr>
													<th>비밀번호 확인</th>
													<td><input type="password" name="t_pw" ></td>
												</tr>
												<tr>
													<th>성함</th>
													<td><input type="text" name="t_name" value="${sName }"></td>
												</tr>
												<tr>
													<th>닉네임</th>
													<td>
														<input type="text" name="t_nickname" value="${t_dto.getNick() }">
													</td>	
												</tr>
												<tr>
													<th>이메일</th>
													<td><input type="text" name="t_email" value="${t_dto.getEmail() }"></td>
												</tr>
												<tr>
													<th>연락처</th>
													<td>
														<input type="text" name="t_tel1" style="width:30%;display:inline;" value="${fn:substring(t_dto.getContact(),0,3) }"> - 
														<input type="text" name="t_tel2" style="width:30%;display:inline;" value="${fn:substring(t_dto.getContact(),4,8) }"> - 
														<input type="text" name="t_tel3" style="width:30%;display:inline;" value="${fn:substring(t_dto.getContact(),9,13) }"> 
													</td>
												</tr>
												<tr>
													<th>주소지</th>
													<td>
														<input type="text" id="addr1" name="t_addr1" value="${t_dto.getAddr1() }" placeholder="주소 검색을 클릭해주세요" style="width:70%;display:inline" readonly>
														<input type="button" onclick="address_confirm()" value="주소 검색">
														<input type="text" id="addr2" name="t_addr2" value="${t_dto.getAddr2() }" readonly>
														<input type="text" id="addr3" name="t_addr3" value="${t_dto.getAddr3() }" readonly>
													</td>
												</tr>
												<tr></tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="회원 정보 수정" onclick="goUpdate()" style="display:inline-block;">
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