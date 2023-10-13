<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Common_header.jsp"%>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
							</header>
							<section class="">
								<div class="main_title" style="text-align:center;">
									<h1>판매 통계</h1>
								</div>
							</section>
							<section class="lines">
								<form name="admin">
									<table class="boardForm">
										<colgroup>
											<col width="100">
											<col width="100">
											<col width="152">
											<col width="352">
										</colgroup>
										<tr class="statics_text">
											<th colspan="2">총 판매 건 수</th>
											<td colspan="2">
												<input type="text" name="" value="${t_t_count}" disabled style="border:none;">
											</td>
										</tr>
										<tr class="statics_text">
											<th colspan="2">총 매출액</th>
											<td colspan="2">
												<input type="text" name="" value="${t_t_sell }" disabled style="border:none;">
											</td>
										</tr>
										<tr>
											<th colspan="3" style="padding-top:0.75em;">
												제품별 판매 건수
											</th>
											<th style="padding-top:0.75em;">
												고객별 매출액 
											</th>
										</tr>
										<tr>
											<td colspan="3">
												<div style="width: 352px; height: 176px;">
													<canvas id="p_Count" class="statis"></canvas>
												</div>
											</td>
											<td>
												<div style="width: 352px; height: 176px;">
													<canvas id="c_Cell" class="statis"></canvas>
												</div>
											</td>
										</tr>
									</table>
									<table class="boardForm" style="margin-top:30px;">
										<colgroup>
											<col width="100">
											<col width="100">
											<col width="152">
											<col width="352">
										</colgroup>
										<tr>
											<th colspan="2">월별 통계</th>
											<td colspan="2"><input type="month" name="t_month" onchange="goStatics(this.value)"></td>
										</tr>
									</table>
								<div id="hide" style="display:none;">
									<table class="boardForm">
										<colgroup>
											<col width="100">
											<col width="100">
											<col width="152">
											<col width="352">
										</colgroup>
										
											<tr class="statics_text ">
												<th colspan="2">월별 판매 건 수</th>
												<td colspan="2">
													<input type="text" name="t_count_m" disabled style="border:none;">
												</td>
											</tr>
											<tr class="statics_text ">
												<th colspan="2">월별 매출액</th>
												<td colspan="2">
													<input type="text" name="t_sell_m" disabled style="border:none;">
												</td>
											</tr>
											<tr >
												<th colspan="3">
													제품별 월 판매 건수
												</th>
												<th>
													고객별 월 매출액 
												</th>
											</tr>
											<tr >
												<td colspan="3">
													<div style="width: 352px; height: 176px;">
													<canvas id="p_Count_m" class="statis"></canvas>
												</div>
												</td>
												<td>
													<div style="width: 352px; height: 176px;">
													<canvas id="c_Cell_m" class="statis"></canvas>
												</div>
												</td>
											</tr>
										</table>
									</div>
								</form>
							</section>
						</div>
					</div>
<script>
	function goStatics(ym){
		var p_count_m_label, p_count_m_value, c_cell_m_label, c_cell_m_value;
		$.ajax({
			type : 'POST',
			url : 'Statics_month',
			data: 't_month='+ym,
			dataType : 'text',
			error : function(){
				alert('통신 실패');
			},
			success : function(data){
				$('#hide').show();
				var jsob = JSON.parse(data);
				var count = comma(jsob.t_t_count_m);
				var sell = comma(jsob.t_t_sell_m);
				admin.t_count_m.value = count
				admin.t_sell_m.value = sell;
				console.log(jsob);
				
				var labels = jsob.t_p_count_m.map(function(e) {
				   return e.label;
				});
				
				var data = jsob.t_p_count_m.map(function(e) {
					   return e.value;
					});
				
				var context = document
			        .getElementById('p_Count_m')
			        .getContext('2d');
			    var p_Count_m = new Chart(context, {
			        type: 'bar', // 차트의 형태
			        data: { // 차트에 들어갈 데이터
			            labels: labels,
			            datasets: [
			                { //데이터
			                    label: '판매 건수', //차트 제목
			                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
			                    data: data,
			                    backgroundColor: 'rgba(255, 255, 255, 0.2)',
			                    borderColor: 'rgba(255, 255, 255, 1)',
			                    borderWidth: 1 //경계선 굵기
			                }
			            ]
			        },
			        options: {
			            scales: {
			                yAxes: [
			                    {
			                        ticks: {
			                            beginAtZero: true
			                        }
			                    }
			                ]
			            },
			            legend: {
			                display: false
			            }
			        }
			    });
		    
		    var labels = jsob.t_c_cell_m.map(function(e) {
			   return e.label;
			});
			
			var data = jsob.t_c_cell_m.map(function(e) {
				   return e.value;
				});
			    
		    var context = document
		        .getElementById('c_Cell_m')
		        .getContext('2d');
		    var c_cell_m = new Chart(context, {
		        type: 'bar', // 차트의 형태
		        data: { // 차트에 들어갈 데이터
		            labels: labels,
		            datasets: [
		                { //데이터
		                    label: '판매 건수', //차트 제목
		                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
		                    data: data,
		                    backgroundColor:'rgba(255, 255, 255, 0.2)',
		                    borderColor: 'rgba(255, 255, 255, 1)',
		                    borderWidth: 1 //경계선 굵기
		                }
		            ]
		        },
		        options: {
		            scales: {
		                yAxes: [
		                    {
		                        ticks: {
		                            beginAtZero: true
		                        }
		                    }
		                ]
		            },
		            legend: {
		                display: false
		            }
		        }
		    });
			}
		});				
	}
</script>
<script type="text/javascript">
    var context = document
        .getElementById('p_Count')
        .getContext('2d');
    var p_Count = new Chart(context, {
        type: 'bar', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [${t_p_count_label}],
            datasets: [
                { //데이터
                    label: '판매 건수', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [${t_p_count_value}],
                    backgroundColor:'rgba(255, 255, 255, 0.2)',
                    borderColor: 'rgba(255, 255, 255, 1)',
                    borderWidth: 1 //경계선 굵기
                }
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            },
            legend: {
                display: false
            }
        }
    });
    var context = document
        .getElementById('c_Cell')
        .getContext('2d');
    var c_Cell = new Chart(context, {
        type: 'bar', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [${t_c_cell_label}],
            datasets: [
                { //데이터
                    label: '매출액', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [${t_c_cell_value}],
                    backgroundColor: 'rgba(255, 255, 255, 0.2)',
                    borderColor: 'rgba(255, 255, 255, 1)',
                    borderWidth: 1 //경계선 굵기
                }
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            },
            legend: {
                display: false
            }
        }
    });
</script>
<%@ include file="../Common_footer.jsp"%>