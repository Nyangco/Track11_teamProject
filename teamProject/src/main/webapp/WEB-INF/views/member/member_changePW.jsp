<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function checkValue(dir,len,obj){
		if(dir.value==""){
			alert(obj+"를 입력하세요");
			dir.focus();
			return true;
		}else if(dir.value.length>len){
			alert(obj+"는 "+len+"자 까지 입력 가능합니다.");
			dir.focus();
			return true;
		}else return false;
	}function goPW(){
		if(checkValue(mem.t_email,64,"현재 비밀번호"))return;
		else if(checkValue(mem.t_pw,64,"새 비밀번호"))return;
		else if(checkValue(mem.t_pw_cf,64,"새 비밀번호 확인"))return;
		else if(mem.t_pw.value!=mem.t_pw_cf.value){
			alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다");
			mem.t_pw_cf.focus();
			return;
		}
		else{
			mem.method="post";
			mem.action="/team/";
			mem.submit();
		}
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
									<input type="hidden" name="t_gubun" value="DBchangePW">
									<input type="hidden" name="t_id" value="${sId }">
										<fieldset>
											<legend>비밀번호 변경</legend>
											<table style="width:35%">
												<tr>
													<th>현재 비밀번호</th>
													<td><input type="password" name="t_email" autofocus></td>
												</tr>
												<tr>
													<th>새 비밀번호</th>
													<td><input type="password" name="t_pw" ></td>
												</tr>
												<tr>
													<th>새 비밀번호 확인</th>
													<td><input type="password" name="t_pw_cf" ></td>
												</tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="PW변경" onclick="goPW()" style="margin:auto;display:inline-block;">
														<input type="button" value="돌아가기" onclick="javascript:history.go(-1)" style="margin:auto;display:inline-block;">
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