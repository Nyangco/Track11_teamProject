<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goUpdate(){
		location.href='qna_update.jsp';
	}function goDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='qna_list.jsp';
		}
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								
							</header>
							<section class="">
								<div class="main_title">
									<h1>QNA</h1>
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
										<tr>
											<td colspan="4">
												<input type="button" value="수정" onclick="goWork('qna_update','Board')">
												<input type="button" value="삭제" onclick="goDelete()">
											</td>
										</tr>
									</table>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>