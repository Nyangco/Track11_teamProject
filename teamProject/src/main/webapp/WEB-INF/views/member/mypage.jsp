<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="">
								<div>
									<form name="mem" class="mypage">
										<input type="hidden" name="t_id">
										<input type="hidden" name="t_requestPage">
										<fieldset>
											<legend>MyPage</legend>
											<table style="width:50%">
												<colgroup>
													<col width="30%">
													<col width="*">
												</colgroup>
												<tr>
													<th>ID</th>
													<td>${sId }</td>
												</tr>
												<tr>
													<th>성함</th>
													<td>${sName }</td>
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
														${t_dto.getAddr1() }<br>
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
													<th>회원 레벨</th>
													<td>
														<c:choose>
															<c:when test="${sLevel==0 }">이메일 미인증 회원</c:when>
															<c:when test="${sLevel==1 }">일반 회원</c:when>
															<c:when test="${sLevel==2 }">중간 관리자</c:when>
															<c:when test="${sLevel==3 }">최고 관리자</c:when>														
														</c:choose>
													</td>
												</tr>
												<tr>
													<th colspan="2" style="padding-top:0.75em;text-align:center;">
														<input type="button" value="회원 정보 변경" onclick="goPage('member_update')" style="display:inline-block;">
														<input type="button" value="회원 탈퇴" onclick="if(confirm('정말로 삭제하시겠습니까?')) goPage('exit')" style="display:inline-block;">
														<input type="button" value="구매 이력" onclick="goPage('purchase_list')" style="display:inline-block;">
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