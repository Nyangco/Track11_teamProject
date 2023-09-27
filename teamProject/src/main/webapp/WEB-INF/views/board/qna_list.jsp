<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script type="text/javascript">
	function goWrite(){
		qnaWork.t_gubun.value="qna_write";
		qnaWork.method="post";
		qnaWork.action="/team/";
		qnaWork.submit();
	}
	function goSearch(){
		qna.t_gubun.value="qna_list";
		qna.method="post";
		qna.action="/team/";
		qna.submit();
	}
</script>
<form name="qnaWork">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_no">
</form>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								
							</header>
							<section class="">
							<form name="qna">
								<input type="hidden" name="t_qna_no">
								<input type="hidden" name="t_gubun">
								<div class="main_title">
									<h1>QNA</h1>
									<a href="javascript:goSearch()" style="float:right;font-size:27px;margin-left:0.25em;"><i class="fa-solid fa-magnifying-glass"></i></a>
									<input type="text" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
									<select name="t_select" style="width:170px;float:right;margin-left:0.5em;">
										<option value="title" <c:if test="${select eq 'title'}">selected</c:if>>제목</option>
										<option value="name" <c:if test="${select eq 'name'}">selected</c:if>>작성자</option>
										<option value="reg_date" <c:if test="${select eq 'reg_date'}">selected</c:if>>작성일자</option>
									</select>
								</div>
								</form>
							</section>
							<section class="border_list">
								<article>
									<table style="width:100%">
										<colgroup>
											<col width="*">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<tr>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일자</th>
										</tr>
										<c:forEach items="${t_dtos}" var="dto">
										<tr>
											<td class="title"><a href="javascript:goWork('qna_detail','Board')">${dto.getTitle()}</a></td>
											<td>${dto.getName()}</td>
											<td>${dto.getReg_date()}</td>
										</tr>
										</c:forEach>
									</table>
									<input type="button" value="글쓰기" onclick="goWrite()" style="float:right; margin-top:10px;">
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>