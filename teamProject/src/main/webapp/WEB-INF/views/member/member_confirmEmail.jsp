<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goConfirm(){
		mem.method="post";
		mem.action="/team/";
		mem.submit();
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
									<input type="hidden" name="t_gubun" value="DBconfirmEmail">
									<input type="hidden" name="t_id" value="${sId }">
										<fieldset>
											<legend>이메일 인증</legend>
											<table style="width:35%">
												<tr>
													<th>인증 코드</th>
													<td><input type="text" name="t_email" autofocus></td>
												</tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="인증코드 입력" onclick="goConfirm()" style="margin:auto;display:inline-block;">
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