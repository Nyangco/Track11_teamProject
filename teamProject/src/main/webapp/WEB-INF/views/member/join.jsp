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
		if(checkValue(mem.t_id,999,"ID")) return;
		else if(checkValue(mem.t_pw,999,"비밀번호")) return;
		else if(checkValue(mem.t_pw_cf,999,"비밀번호 확인")) return;
		else if(mem.t_pw.value!=mem.t_pw_cf.value){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			mem.t_pw_cf.focus();
			return;
		}
		else if(checkValue(mem.t_name,999,"성함")) return;
		else if(checkValue(mem.t_nickname,999,"닉네임")) return;
		else if(checkValue(mem.t_email,999,"이메일")) return;
		else if(checkValue(mem.t_tel1,999,"연락처")) return;
		else if(checkValue(mem.t_tel2,999,"연락처")) return;
		else if(checkValue(mem.t_tel3,999,"연락처")) return;
		else if(checkValue(mem.t_postal,999,"주소지")) return;
		else if(checkValue(mem.t_address,999,"주소지")) return;
		else {
			location.href='../index.jsp';
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
											<legend>Join</legend>
											<table style="width:50%">
												<colgroup>
												
												</colgroup>
												<tr>
													<th>ID</th>
													<td>
														<input type="text" name="t_id" style="width:63%;display:inline">
														<input type="button" onclick="" value="ID 중복 확인">
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
														<input type="text" name="t_nickname" style="width:55%;display:inline">
														<input type="button" onclick="" value="닉네임 중복 확인">
													</td>	
												</tr>
												<tr>
													<th>이메일</th>
													<td><input type="text" name="t_email" ></td>
												</tr>
												<tr>
													<th>연락처</th>
													<td>
														<input type="text" name="t_tel1" style="width:30%;display:inline;"> - 
														<input type="text" name="t_tel2" style="width:30%;display:inline;"> - 
														<input type="text" name="t_tel3" style="width:30%;display:inline;"> 
													</td>
												</tr>
												<tr>
													<th>주소지</th>
													<td>
														<input type="text" name="t_postal" value="주소 검색을 클릭해주세요" style="width:70%;display:inline" readonly>
														<input type="button" onclick="" value="주소 검색">
														<input type="text" name="t_address" readonly>
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