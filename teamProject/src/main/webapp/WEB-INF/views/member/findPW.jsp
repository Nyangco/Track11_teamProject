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
		if(checkValue(mem.t_id,20,"ID"))return;
		else if(checkValue(mem.t_email,100,"이메일"))return;
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
									<input type="hidden" name="t_gubun" value="DBfindPW">
										<fieldset>
											<legend>비밀번호 찾기</legend>
											<table style="width:35%">
												<tr>
													<th>ID</th>
													<td><input type="text" name="t_id" autofocus></td>
												</tr>
												<tr>
													<th>Email</th>
													<td><input type="text" name="t_email" autofocus></td>
												</tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="PW찾기" onclick="goPW()" style="margin:auto;display:inline-block;">
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