<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goDelete(){
		if(confirm("정말로 회원을 탈퇴처리 하시겠습니까?")){
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
									<form name="mem" class="mypage">
										<input type="hidden" name="t_id" value="${t_dto.getId() }">
										<input type="hidden" name="t_gubun" value="manage_member_delete">
										<fieldset>
											<legend>회원 관리</legend>
											<table style="width:50%">
												<colgroup>
													<col width="30%">
													<col width="*">
												</colgroup>
												<tr>
													<th>ID</th>
													<td>${t_dto.getId() }</td>
												</tr>
												<tr>
													<th>성함</th>
													<td>${t_dto.getName() }</td>
												</tr>
												<tr>
													<th>닉네임</th>
													<td>${t_dto.getNick() }</td>
												</tr>
												<tr>
													<th>이메일</th>
													<td>${t_dto.getEmail() }</td>
												</tr>
												<tr>
													<th>연락처</th>
													<td>${t_dto.getContact() }</td>
												</tr>
												<tr>
													<th>주소지</th>
													<td>
														(${t_dto.getAddr1() })<br>
														${t_dto.getAddr2() }<br>
														${t_dto.getAddr3() }
													</td>
												</tr>
												<tr>
													<th>가입일</th>
													<td>${t_dto.getReg_date() }</td>
												</tr>
												<tr>
													<th>최근 로그인 일자</th>
													<td>${t_dto.getLogin_date() }</td>
												</tr>
												<tr>
													<th>개인정보 수정일</th>
													<td>${t_dto.getUp_date() }&nbsp;</td>
												</tr>
												<tr>
													<th>탈퇴일</th>
													<td>${t_dto.getExit_date() }&nbsp;</td>
												</tr>
												<tr>
													<th>회원 레벨</th>
													<td>
														<c:choose>
															<c:when test="${t_dto.getSession_level()==0 }">이메일 미인증 회원</c:when>
															<c:when test="${t_dto.getSession_level()==1 }">일반 회원</c:when>
															<c:when test="${t_dto.getSession_level()==2 }">중간 관리자</c:when>
															<c:when test="${t_dto.getSession_level()==3 }">최고 관리자</c:when>														
														</c:choose>
													</td>
												</tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<c:if test="${sLevel>t_dto.getSession_level() }">
															<input type="button" value="회원 탈퇴" onclick="goDelete()" style="display:inline-block;">
														</c:if>
														<input type="button" value="목록으로" onclick="history.go(-1)" style="display:inline-block;">
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