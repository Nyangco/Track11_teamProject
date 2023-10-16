<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goSeacrch(){
		mem.method="post";
		mem.action="/team/";
		mem.submit();
	}function goView(id){
		mem.t_gubun.value="manage_member_view";
		mem.t_id.value=id;
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
							<section class="manage_list">
								<form name="mem">
									<input type="hidden" name="t_nowPage" value="${t_nowPage }">
									<input type="hidden" name="t_gubun" value="manage_member_list">
									<input type="hidden" name="t_id">
									<div class="main_title">
										<h1>회원 관리</h1>
										<a href="javascript:" onclick="goSearch()" style="float:right;font-size:27px;margin-left:0.25em;"><i class="fa-solid fa-magnifying-glass"></i></a>
										<input type="text" name="t_search" value="${search }" placeholder="검색어를 입력하세요" class="search" onkeypress="if(event.keyCode==13){goSearch()}" style="width:300px;float:right;margin-left:0.5em;">
										<select name="t_select" style="width:170px;float:right;margin-left:0.5em;" onchange="stsconfirm()">
											<option value="id" <c:if test="${select eq 'id' }">selected</c:if>>ID</option>
											<option value="name" <c:if test="${select eq 'name' }">selected</c:if>>성함</option>
											<option value="email" <c:if test="${select eq 'email' }">selected</c:if>>이메일</option>
											<option value="contact" <c:if test="${select eq 'contact' }">selected</c:if>>연락처</option>
										</select>
									</div>
								</form>
							</section>
							<section class="lines">
								<article>
									<table style="width:100%">
										<colgroup>
											<col width="10%">
											<col width="*">
											<col width="20%">
											<col width="20%">
											<col width="10%">
										</colgroup>
										<tr>
											<th>ID</th>
											<th>이메일</th>
											<th>등록일</th>
											<th>최근로그인</th>
											<th>탈퇴 여부</th>
										</tr>
										<c:forEach items="${arr }" var="dto">
											<tr>
												<td><a href="javascript:goView('${dto.getId() }')">${dto.getId() }</a></td>
												<td><a href="javascript:goView('${dto.getId() }')">${dto.getEmail() }</a></td>
												<td>${dto.getReg_date() }</td>
												<td>
													<c:if test="${empty dto.getLogin_date() }">로그인 이력 없음</c:if>
													${dto.getLogin_date() }
												</td>
												<td>
													<c:if test="${empty dto.getExit_date() }">활동중</c:if>
													<c:if test="${not empty dto.getExit_date() }">회원 탈퇴</c:if>
												</td>
											</tr>
										</c:forEach>
									</table>
								</article>
							</section>
							<div class="btn_group sell">
								<input type="button" value="상품 관리" onclick="goPage('manage_list')">
								<input type="button" value="판매 관리" onclick="goPage('sold_list')">
							</div>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>