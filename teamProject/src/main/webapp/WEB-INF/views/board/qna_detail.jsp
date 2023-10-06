<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goUpdate(no){
		qnaWork.t_gubun.value="qna_update";
		qnaWork.t_qna_no.value= no;
		qnaWork.method="post";
		qnaWork.action="/team/";
		qnaWork.submit();
	}
	function goDelete(no){
		if(confirm("정말로 삭제하시겠습니까?")){
			qnaWork.t_gubun.value="qna_delete";
			qnaWork.t_qna_no.value= no;
			qnaWork.method="post";
			qnaWork.action="/team/";
			qnaWork.submit();
		}
	}
	function goReply(){
		qnaWork.t_gubun.value="qna_reply";
		//qnaWork.t_qna_no.value= no;
		qnaWork.method="post";
		qnaWork.action="/team/";
		qnaWork.submit();
	}
</script>
<form name="qnaWork">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_qna_no" value="${t_dto.getQna_no()}">
</form>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								
							</header>
							<section class="">
								<div class="main_title">
									<h1>QNA Detail</h1>
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
											<td colspan="3">${t_dto.getTitle()}</td>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3"><textarea readonly style="resize:none;width:100%;padding-bottom:300px;">${t_dto.getContent()}</textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>${t_dto.getName()}</td>
											<th>작성일</th>
											<td>${t_dto.getReg_date()}</td>
										</tr>
										<c:if test="${not empty t_dto.getReply()}">
										<tr>
											<th colspan="4" style="text-align: center; border:none; "></th>
										</tr>
										<tr>
											<th colspan="4" style="text-align: center;">답변</th>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3"><textarea style="resize:none;width:100%;padding-bottom:300px;" name="t_reply">${t_dto.getReply()}</textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>매니저</td>
											<th>작성일</th>
											<td>${t_dto.getReply_date()}</td>
										</tr>
										</c:if>
										<c:if test="${t_dto.getName() == sName or sLevel eq '3' }">
										<tr>
											<td colspan="4">
												<input type="button" value="수정" onclick="goUpdate('${t_dto.getQna_no()}')">
												<input type="button" value="삭제" onclick="goDelete('${t_dto.getQna_no()}')">
												<input type="button" value="답변" onclick="goReply()">
											</td>
										</tr>
										</c:if>
									</table>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>