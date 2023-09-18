<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goReset(){
		fm.reset();
		fm.t_b_title.focus();
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
											<td colspan="3"><input type="text" name="t_b_title" value="오늘 아침 추천좀"></td>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3"><textarea style="resize:none;width:100%;padding-bottom:300px;" name="t_b_content">오늘 아침 추천좀 해주세요.</textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="text" name="t_b_writer" readonly value="작성자1"></td>
											<th>작성일</th>
											<td><input type="text" name="t_b_reg_date" readonly value="2020-80-94"></td>
										</tr>
										<tr>
											<td colspan="4">
												<input type="button" value="작성" onclick="location.href='qna_write.jsp'">
												<input type="button" value="다시쓰기" onclick="goReset()">
											</td>
										</tr>
									</table>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>