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
		//else if(checkValue(mem.t_addr1,50,"주소지")) return;
		//else if(checkValue(mem.t_addr2,50,"주소지")) return;
		//else if(checkValue(mem.t_addr3,50,"주소지")) return;
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
														<input type="text" name="t_addr1" value="${t_dto.getAddr1() }" placeholder="주소 검색을 클릭해주세요" style="width:70%;display:inline" readonly>
														<input type="button" onclick="" value="주소 검색">
														<input type="text" name="t_addr2" value="${t_dto.getAddr2() }" readonly>
														<input type="text" name="t_addr3" value="${t_dto.getAddr3() }" readonly>
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