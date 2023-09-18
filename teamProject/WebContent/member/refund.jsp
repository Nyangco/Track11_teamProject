<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<div id="tags">
									<div class="tag_box">
										<span>#태그1</span>
										<span>#태그2</span>
										<span>#태그3</span>
										<span>#태그4</span>
										<span>#태그5</span>
										<span style="float:right;border-right:1px solid white;border-left:1px solid gray;">장바구니</span>
									</div>
								</div>	
							</header>
							<section class="">
								<div class="main_title">
									<h1 style="text-align:center;">환불/교환</h1>
								</div>
							</section>
							<section class="lines">
								<article>
									<form name="fm">
										<table style="width:40%">
											<colgroup>
												<col width="20%">
												<col width="*">
											</colgroup>
											<tr>
												<th>환불/교환</th>
												<td>
													<select name="t_select">
														<option value="refund">환불</option>
														<option value="change">교환</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>환불/교환 사유</th>
												<td>
													<input type="text" name="t_reason">
												</td>
											</tr>
											<tr>
												<th colspan="2">
													<input type="button" value="환불/교환 신청" onclick="location.href='purchase_list.jsp'">
													<input type="button" value="목록" onclick="location.href='purchase_list.jsp'">
												</th>
											</tr>
										</table>
									</form>
								</article>
							</section>
						</div>
					</div>
<%@ include file="../Common_footer.jsp"%>