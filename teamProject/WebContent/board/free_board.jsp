<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
<script>
	function delete_comment(code){
		
	}function show_comment(code){
		const div = "#d_"+code;
		$(div).show();
	}
</script>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								
							</header>
							<section class="">
								<div class="main_title">
									<h1>담벼락</h1>
								</div>
							</section>
							<section class="free_board">
								<form name="free_board">
									<input type="text" placeholder="글 쓰기"><input type="button" value="등록">
								</form>
								<div id="0001">
									1번째 텍스트
									<span>
									<span>작성자1</span>
									<a href="javascript:show_comment('0001')"><i class="fa-regular fa-comment"></i></a>
									<a href="javascript:delete_comment('0001')"><i class="fa-solid fa-trash"></i></a>
									</span>
									<div id="d_0001">
										<input type="text"><input type="button" value="등록">
									</div>
								</div>
								<div id="0002">
									&nbsp;&nbsp;&nbsp;&nbsp;2번째 텍스트
									<span>
									<span>작성자2</span>
									<a href="javascript:show_comment('0002')"><i class="fa-regular fa-comment"></i></a>
									<a href="javascript:delete_comment('0002')"><i class="fa-solid fa-trash"></i></a>
									</span>
									<div id="d_0002">
										<input type="text"><input type="button" value="등록">
									</div>
								</div>
								<div id="0003">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3번째 텍스트
									<span>
									<span>작성자3</span>
									<a href="javascript:show_comment('0003')"><i class="fa-regular fa-comment"></i></a>
									<a href="javascript:delete_comment('0003')"><i class="fa-solid fa-trash"></i></a>
									</span>
									<div id="d_0003">
										<input type="text"><input type="button" value="등록">
									</div>
								</div>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>