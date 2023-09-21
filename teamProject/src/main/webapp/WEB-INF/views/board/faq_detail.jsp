<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goUpdate(){
		location.href='faq_update.jsp';
	}function goDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='faq_list.jsp';
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
									<h1>FAQ</h1>
									<input type="text" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
									<select style="width:170px;float:right;margin-left:0.5em;">
										<option>가나다라마바사</option>
									</select>
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
											<td colspan="3">오늘 아침 추천좀</td>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3"><textarea readonly style="resize:none;width:100%;padding-bottom:300px;">오늘 아침 추천좀 해주세요.</textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>작성자1</td>
											<th>작성일</th>
											<td>2020-80-94</td>
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