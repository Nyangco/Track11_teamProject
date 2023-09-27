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
								<div class="main_title">
									<h1>QNA</h1>
									<input type="text" placeholder="검색어를 입력하세요" class="search" style="width:300px;float:right;margin-left:0.5em;">
									<select style="width:170px;float:right;margin-left:0.5em;">
										<option>가나다라마바사</option>
									</select>
								</div>
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
										<tr>
											<td class="title"><a href="javascript:goWork('qna_detail','Board')">오늘 아침 추천좀</a></td>
											<td>작성자1</td>
											<td>2020-80-94</td>
										</tr>
										<tr>
											<td class="title"><a href="javascript:goWork('qna_detail','Board')">오늘 점심 추천좀</a></td>
											<td>작성자1</td>
											<td>2020-80-94</td>
										</tr>
										<tr>
											<td class="title"><a href="javascript:goWork('qna_detail','Board')">오늘 저녘 추천좀</a></td>
											<td>작성자1</td>
											<td>2020-80-94</td>
										</tr>
									</table>
									<input type="button" value="글쓰기" onclick="goWrite()" style="float:right; margin-top:10px;">
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>