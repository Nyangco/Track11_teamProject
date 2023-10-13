<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goReset(){
		fm.reset();
		fm.t_question.focus();
	}
	function checkValue(dir,len,obj){
		if(dir.value==""){
			alert(obj+"을/를 입력하세요");
			dir.focus();
			return true;
		}else if(dir.value.length>len){
			alert(obj+"은/는 "+len+"자 까지 입력 가능합니다.");
			dir.focus();
			return true;
		}else return false;
	}
	function goSave(){
		if(checkValue(fm.t_question,40,"제목")) return;
		else if(checkValue(fm.t_answer,2000,"글 내용")) return;
		else {
			fm.method="post";
			fm.action="/team/";
			fm.submit();
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
								</div>
							</section>
							<section class="border_detail">
								<article>
								<form name="fm">
									<input type="hidden" name="t_gubun" value="DBfaq_update">
									<input type="hidden" name="t_faq_no" value="${t_dto.getFaq_no()}">
									<table style="width:90%">
										<colgroup>
											<col width="15%">
											<col width="35%">
											<col width="15%">
											<col width="35%">
										</colgroup>
										<tr>
											<th>제목</th>
											<td colspan="3"><input type="text" name="t_question" value="${t_dto.getQuestion()}"></td>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3"><textarea style="resize:none;width:100%;padding-bottom:300px;" name="t_answer">${t_dto.getAnswer()}</textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="text" readonly value="매니저"></td>
											<th>작성일</th>
											<td><input type="text" readonly value="${t_dto.getReg_date()}"></td>
										</tr>
										<tr>
											<td colspan="4">
												<input type="button" value="작성" onclick="goSave()">
												<input type="button" value="다시쓰기" onclick="goReset()">
											</td>
										</tr>
									</table>
									</form>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>