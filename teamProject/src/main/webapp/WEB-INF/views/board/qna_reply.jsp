<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function goReset(){
		fm.reset();
		fm.t_title.focus();
	}
	function checkValue(dir,len,obj){
		if(dir.value==""){
			alert(obj+"을 입력하세요");
			dir.focus();
			return true;
		}else if(dir.value.length>len){
			alert(obj+"은/는 "+len+"자 까지 입력 가능합니다.");
			dir.focus();
			return true;
		}else return false;
	}
	function goSave(){
		if(checkValue(fm.t_reply,2000,"글 내용")) return;
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
							<section class="">
								<div class="main_title">
									<h1>QNA Reply</h1>
								</div>
							</section>
							<section class="border_detail">
								<article>
								<form name="fm">
								<input type="hidden" name="t_gubun" value="DBqna_reply">
								<input type="hidden" name="t_qna_no" value="${t_dto.getQna_no()}">
									<table style="width:90%">
										<colgroup>
											<col width="15%">
											<col width="35%">
											<col width="15%">
											<col width="35%">
										</colgroup>
										<tr>
											<th>질문 제목</th>
											<td colspan="3">${t_dto.getTitle()}</td>
										</tr>
										<tr>
											<th>질문 내용</th>
											<td colspan="3"><textarea readonly style="resize:none;width:100%;padding-bottom:300px;">${t_dto.getContent()}</textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>${t_dto.getName()}</td>
											<th>작성일</th>
											<td>${t_dto.getReg_date()}</td>
										</tr>
										<tr>
											<th colspan="4" style="text-align: center; border:none; "></th>
										</tr>
										<tr>
											<th colspan="4" style="text-align: center;">답변</th>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3"><textarea style="resize:none;width:100%;padding-bottom:300px;" name="t_reply"></textarea></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="text"  readonly value="${sName}"></td>
											<th>작성일</th>
											<td><input type="text" name="t_reply_date" readonly value="${time}"></td>
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