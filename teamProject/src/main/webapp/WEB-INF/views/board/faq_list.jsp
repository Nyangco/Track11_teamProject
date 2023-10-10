<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script type="text/javascript">
	function goWrite(){
		faqWork.t_gubun.value="faq_write";
		faqWork.method="post";
		faqWork.action="/team/";
		faqWork.submit();
	}
	function goSearch(){
		faq.t_gubun.value="faq_list";
		faq.method="post";
		faq.action="/team/";
		faq.submit();
	}
	function goDetail(no){
		faqWork.t_gubun.value="faq_detail";
		faqWork.t_faq_no.value= no;
		faqWork.method="post";
		faqWork.action="/team/";
		faqWork.submit();
	}
</script>
<form name="faqWork">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_faq_no">
</form>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								
							</header>
							<section class="">
							<form name="faq">
							<input type="hidden" name="t_gubun">
								<div class="main_title">
									<h1>FAQ</h1>
									<a href="javascript:goSearch()" style="float:right;font-size:27px;margin-left:0.25em;"><i class="fa-solid fa-magnifying-glass"></i></a>
									<input type="text" name="t_search" value="${t_search}" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
									<select name="t_select" style="width:170px;float:right;margin-left:0.5em;">
										<option value="question" <c:if test="${select eq 'question'}">selected</c:if>>제목</option>
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
											<td class="title"><a href="javascript:goDetail('${dto.getFaq_no()}')">${dto.getQuestion()}</a></td>
											<td>매니저</td>
											<td>${dto.getReg_date()}</td>
										</tr>
										</c:forEach>
									</table>
									<c:if test="${sLevel eq '3' }">
									<input type="button" value="글쓰기" onclick="goWrite()" style="float:right; margin-top:10px;">
									</c:if>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>