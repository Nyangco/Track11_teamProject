<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	let chk = 1;
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
	}function onload(){
		$('.lines').hide();
	}function icon_change(){
		if(chk==1){
			$('.list_icon').html('<i class="fa-solid fa-table-cells-large"></i>');
			$('.tiles').hide();
			$('.lines').show();
			chk = 0;
		}else{
			$('.list_icon').html('<i class="fa-solid fa-list-ul"></i>');
			$('.lines').hide();
			$('.tiles').show();
			chk = 1;
		}
		console.log(chk);
	}function goPW(){
		if(event.keyCode==13){
			mem.t_pw.focus();
		}
	}function goNext(){
		if(event.keyCode==13){
			goLogin()
		}
	}function goLogin(){
		if(checkValue(mem.t_id,999,"ID")) return;
		else if(checkValue(mem.t_pw,999,"PW")) return;
		else {
			location.href='../index.jsp';
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
										<fieldset>
											<legend>LogIn</legend>
											<table style="width:35%">
												<colgroup>
												
												</colgroup>
												<tr>
													<th>ID</th>
													<td><input type="text" name="t_id" onkeypress="goPW()" autofocus></td>
												</tr>
												<tr>
													<th>PW</th>
													<td><input type="password" name="t_pw" onkeypress="goNext()"></td>
												</tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;">
														<input type="button" value="로그인" onclick="goLogin()" style="margin:auto;display:block;">
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