<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goUpdate(no){
		faqWork.t_gubun.value="faq_update";
		faqWork.t_faq_no.value= no;
		faqWork.method="post";
		faqWork.action="/team/";
		faqWork.submit();
	}
	function goDelete(no){
		if(confirm("정말로 삭제하시겠습니까?")){
			faqWork.t_gubun.value="faq_delete";
			faqWork.t_faq_no.value= no;
			faqWork.method="post";
			faqWork.action="/team/";
			faqWork.submit();
		}
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
								<div class="main_title">
									<h1>FAQ</h1>
								</div>
							</section>
							<section class="border_detail">
								<article>
									<table style="width:90%">
										<colgroup>
											<col width="15%">
											<col width="35%">
											<col width="15%">
											<col width="35%">
										</colgroup>
										<tr>
											<th>제목</th>
											<td colspan="3">${t_dto.getQuestion()}</td>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3"><textarea readonly style="resize:none;width:100%;padding-bottom:300px;">${t_dto.getAnswer()}</textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>매니저</td>
											<th>작성일</th>
											<td>${t_dto.getReg_date()}</td>
										</tr>
										<tr>
											<td colspan="4">
												<input type="button" value="수정" onclick="goWork('faq_update','Board')">
												<input type="button" value="삭제" onclick="goDelete()">
											</td>
										</tr>
									</table>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>