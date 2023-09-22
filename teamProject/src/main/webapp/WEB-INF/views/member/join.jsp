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
	}function goJoin(){
		if(checkValue(mem.t_id,20,"ID")) return;
		else if(mem.id_check.value!='0'){
			alert("ID 중복 확인을 해주세요");
			mem.t_id.focus();
			return;
		}
		else if(checkValue(mem.t_pw,64,"비밀번호")) return;
		else if(checkValue(mem.t_pw_cf,64,"비밀번호 확인")) return;
		else if(mem.t_pw.value!=mem.t_pw_cf.value){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			mem.t_pw_cf.focus();
			return;
		}
		else if(checkValue(mem.t_name,20,"성함")) return;
		else if(checkValue(mem.t_nickname,40,"닉네임")) return;
		else if(mem.nick_confirm.value!='닉네임 사용가능'){
			alert('사용 불가능한 닉네임입니다');
			mem.t_nickname.focus();
			return;
		}
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
	}function tel2focus(){
		if(mem.t_tel1.value.length==3){
			mem.t_tel2.focus();
		}
	}function tel3focus(){
		if(mem.t_tel2.value.length==4){
			mem.t_tel3.focus();
		}
	}function checkId(){
		//ajax단
		mem.id_confirm.value='0';
	}function checkNick(){
		//ajax 단
		mem.nick_confirm.value='닉네임 사용가능';
	}function address_confirm(){
		//ajax 단
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
										<input type="hidden" name="t_gubun" value="DBjoin">
										<fieldset>
											<legend>Join</legend>
											<table style="width:50%">
												<colgroup>
												
												</colgroup>
												<tr>
													<th>ID</th>
													<td>
														<input type="text" name="t_id" style="width:63%;display:inline">
														<input type="button" onclick="checkId()" value="ID 중복 확인">
														<input type="hidden" name="id_confirm">
													</td>	
												</tr>
												<tr>
													<th>비밀번호</th>
													<td><input type="password" name="t_pw" ></td>
												</tr>
												<tr>
													<th>비밀번호 확인</th>
													<td><input type="password" name="t_pw_cf" ></td>
												</tr>
												<tr>
													<th>성함</th>
													<td><input type="text" name="t_name" ></td>
												</tr>
												<tr>
													<th>닉네임</th>
													<td>
														<input type="text" name="t_nickname" style="width:55%;display:inline-block;" onchange="checkNick()">
														<input type="text" name="nick_confirm" style="width:44%;display:inline-block;border:none;" disabled>
													</td>	
												</tr>
												<tr>
													<th>이메일</th>
													<td><input type="text" name="t_email" ></td>
												</tr>
												<tr>
													<th>연락처</th>
													<td>
														<input type="text" name="t_tel1" style="width:30%;display:inline;" maxlength="3" onkeypress="tel2focus()"> - 
														<input type="text" name="t_tel2" style="width:30%;display:inline;" maxlength="4" onkeypress="tel3focus()"> - 
														<input type="text" name="t_tel3" style="width:30%;display:inline;" maxlength="4"> 
													</td>
												</tr>
												<tr>
													<th>주소지</th>
													<td>
														<input type="text" name="t_addr1" placeholder="주소 검색을 클릭해주세요" style="width:70%;display:inline" readonly>
														<input type="button" onclick="address_confirm()" value="주소 검색">
														<input type="text" name="t_addr2" readonly>
														<input type="text" name="t_addr3" readonly>
													</td>
												</tr>
												<tr></tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="회원가입" onclick="goJoin()" style="display:inline-block;">
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