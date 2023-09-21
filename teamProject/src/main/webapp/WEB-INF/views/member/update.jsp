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
		if(checkValue(mem.t_id,999,"ID")) return;
		else if(checkValue(mem.t_pw,999,"비밀번호")) return;
		else if(checkValue(mem.t_name,999,"성함")) return;
		else if(checkValue(mem.t_nickname,999,"닉네임")) return;
		else if(checkValue(mem.t_email,999,"이메일")) return;
		else if(checkValue(mem.t_tel1,999,"연락처")) return;
		else if(checkValue(mem.t_tel2,999,"연락처")) return;
		else if(checkValue(mem.t_tel3,999,"연락처")) return;
		else if(checkValue(mem.t_postal,999,"주소지")) return;
		else if(checkValue(mem.t_address,999,"주소지")) return;
		else {
			location.href='mypage.jsp';
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
										<fieldset>
											<legend>회원정보 수정</legend>
											<table style="width:50%">
												<colgroup>
												
												</colgroup>
												<tr>
													<th>ID</th>
													<td>
														<input type="text" name="t_id" style="border:none;" value="manager" disabled>
													</td>	
												</tr>
												<tr>
													<th>비밀번호 확인</th>
													<td><input type="password" name="t_pw" ></td>
												</tr>
												<tr>
													<th>성함</th>
													<td><input type="text" name="t_name" value="김개똥"></td>
												</tr>
												<tr>
													<th>닉네임</th>
													<td>
														<input type="text" name="t_nickname" style="width:55%;display:inline" value="홍길동">
														<input type="button" onclick="" value="닉네임 중복 확인">
													</td>	
												</tr>
												<tr>
													<th>이메일</th>
													<td><input type="text" name="t_email" value="abc@naver.com"></td>
												</tr>
												<tr>
													<th>연락처</th>
													<td>
														<input type="text" name="t_tel1" style="width:30%;display:inline;" value="012"> - 
														<input type="text" name="t_tel2" style="width:30%;display:inline;" value="3456"> - 
														<input type="text" name="t_tel3" style="width:30%;display:inline;" value="7890"> 
													</td>
												</tr>
												<tr>
													<th>주소지</th>
													<td>
														<input type="text" name="t_postal" value="(03172)" style="width:70%;display:inline" readonly >
														<input type="button" onclick="" value="주소 검색">
														<input type="text" name="t_address" readonly value="서울 종로구 세종대로 175 세종이야기">
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