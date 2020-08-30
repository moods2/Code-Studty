<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
<style> /* 랭킹 */
#title {
	/* text-align: center; */
	margin-left: 280px;
	margin-top: 50px;
	width: 1500px;
	border-bottom: 1px dashed black;
}

small {
	color: #777;
	font-family: Arial;
	font-size: 27.3px;
	font-weight: lighter;
}

#cal1 {
	position: relative;
	float: left;
	top: 15px;
	left: 5px;
}

* {
	outline: none;
}

#btns {
	width: 350px;
	margin: 20px auto;
	display: block;
	text-align: center;
}

.dat:hover {
	border-bottom: 3px solid lightgreen;
}

#middle {
	margin-left: 100px; 
}

#one {
	margin-top: 50px;
}

.rank {
	text-align: center center;
	position: relative;
	top: -70px;
	margin-right: 20px;
}

.img {
	width: 150px;
	height: 150px;
	background-color: mediumseagreen;
	display: inline-block;
}

.box2 {
	margin-bottom: 10px;
}

#sel {
	margin-top: 50px;
	text-align: center;
	margin-left: 250px;
}

.btn {
	margin-right: 8px;
	color: mediumslateblue;
	font-weight: bold;
	border: 0px;
}

.bt {
	border: 0px;
	border-bottom: 3px solid transparent;
}

.bt:hover {
	background: #B4A7D6;
	border: 0px;
	border-bottom: 3px solid mediumslateblue;
}

.modified {
	border: 0px;
	border-radius: 5px;
	background-color: #999;
	outline: none;
	font-weight: border;
	color: rgb(220, 220, 220);
	height: 35px;
	font-weight: bold
}

.modified:hover {
	color: white;
	/* background-color: #333; */
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
	.pagination>.active>span:hover, .pagination>.active>a:focus,
	.pagination>.active>span:focus {
	background-color: #999999;
	border-color: #eeeeee;
}

.pagination>li>a, .pagination>li>span {
	color: black;
}

.box2 {
	text-align: center;
	margin-left: -500px;
}

.cb {
	margin-left: 280px;
	position: relative;
	margin-right: 10px;
	top: -70px
}

.ranktitle {
	display: inline-block;
	position: relative;
	top: -60px;
	margin-left: 20px;
}

.vertical-line {
	border: 2px solid #999999;
	height: 80px;
	width: 2px;
	display: inline-block;
	position: relative;
	top: -30px;
	left: 100px;
}

.rank-detail {
	display: inline-block;
	position: relative;
	top: -60px;
	left: 150px;
}
</style>

<!-- 그래프 -->
<style type="text/css">
.highcharts-figure, .highcharts-data-table table {
	min-width: 320px;
	max-width: 660px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

</style>

</head>
<body>
	<!-- 랭킹 -->
	<div id="title">
		<h1
			style="color: #555; font-weight: bold; font-family: Arial; font-size: 3em;">
			랭킹 <small>> Home </small>
		</h1>
	</div>

	<div style="margin-left: 200px;">
		<figure style="margin-left: 450px;" class="highcharts-figure">
			<div id="container"></div>
			<p style="text-align: center;" class="highcharts-description">
				예매율</p>
		</figure>
		<div style="margin-left: 700px; font-weight: bold;">
			<span id="day" class="dat">일간</span> <span>｜</span> <span id="week"
				class="dat">주간</span> <span>｜</span> <span id="month" class="dat">월간</span>
			<span>｜</span> <span id="year" class="dat">연간</span>

		</div>
		<div id="calendar1"
			style="width: 500px; margin: 20px; margin-left: 550px;">
			<input style="width: 100px; text-align: center; margin-left: 170px;"
				type="text" name="date1" id="date1"> <label for="date1"><span
				style="font-size: 3em;" class="glyphicon glyphicon-calendar"
				id="cal1"></span></label>
		</div>
		<div style="margin-left: 600px; outline: none;" id="btns">
			<input style="color: mediumpurple; font-weight: bold;" type="button" value="전체" id="btn1" class="bt"> 
			<input style="color: mediumpurple; font-weight: bold;" type="button" value="뮤지컬" id="btn3" class="bt"> 
			<input style="color: mediumpurple; font-weight: bold;" type="button" value="콘서트" id="btn4" class="bt"> 
			<input style="color: mediumpurple; font-weight: bold;" type="button" value="연극" id="btn5" class="bt"> 
			<input style="color: mediumpurple; font-weight: bold;" type="button" value="전시" id="btn6" class="bt">
		</div>

		<div id="line"
			style="border: 2px solid #999999; width: 1500px; margin-top: 30px;"></div>

		<div id="middle">
			<div id="one" class="box2">
				<input type="checkbox" class="cb"> <span class="rank">1위</span>
				<div class="img"></div>
				<div class="ranktitle">
					뮤지컬 더 모먼트<br>♥ 6.0
				</div>
				<div class="vertical-line"></div>
				<div class="rank-detail">
					2020.07.10~2020.08.30<br> 대학로 유니플렉스 2관
				</div>
			</div>
			<div id="two" class="box2">
				<input type="checkbox" class="cb"> <span class="rank">2위</span>
				<div class="img"></div>
				<div class="ranktitle">
					뮤지컬 더 모먼트<br>♥ 6.0
				</div>
				<div class="vertical-line"></div>
				<div class="rank-detail">
					2020.07.10~2020.08.30<br> 대학로 유니플렉스 2관
				</div>
			</div>
			<div id="three" class="box2">
				<input type="checkbox" class="cb"> <span class="rank">3위</span>
				<div class="img"></div>
				<div class="ranktitle">
					뮤지컬 더 모먼트<br>♥ 6.0
				</div>
				<div class="vertical-line"></div>
				<div class="rank-detail">
					2020.07.10~2020.08.30<br> 대학로 유니플렉스 2관
				</div>
			</div>
			<div id="four" class="box2">
				<input type="checkbox" class="cb"> <span class="rank">4위</span>
				<div class="img"></div>
				<div class="ranktitle">
					뮤지컬 더 모먼트<br>♥ 6.0
				</div>
				<div class="vertical-line"></div>
				<div class="rank-detail">
					2020.07.10~2020.08.30<br> 대학로 유니플렉스 2관
				</div>
			</div>
			<div id="five" class="box2">
				<input type="checkbox" class="cb"> <span class="rank">5위</span>
				<div class="img"></div>
				<div class="ranktitle">
					뮤지컬 더 모먼트<br>♥ 6.0
				</div>
				<div class="vertical-line"></div>
				<div class="rank-detail">
					2020.07.10~2020.08.30<br> 대학로 유니플렉스 2관
				</div>
			</div>
			<div id="six" class="box2">
				<input type="checkbox" class="cb"> <span class="rank">6위</span>
				<div class="img"></div>
				<div class="ranktitle">
					뮤지컬 더 모먼트<br>♥ 6.0
				</div>
				<div class="vertical-line"></div>
				<div class="rank-detail">
					2020.07.10~2020.08.30<br> 대학로 유니플렉스 2관
				</div>
			</div>
		</div>
		<nav style="margin-left: 580px;" width: 400px; class="pagebar">
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li class="active"><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
		<div style="width: 350px; margin-left: 800px;" id="sel">
			<button class="modified" id="makebtn">
				<i class="glyphicon glyphicon-plus"></i>추가
			</button>
			<button class="modified" id="modifybtn">
				<i class="glyphicon glyphicon-pencil"></i> 수정
			</button>
			<button class="modified" id="delbtn">
				<i class="glyphicon glyphicon-trash"></i> 삭제
			</button>
		</div>
	</div>
	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
	//랭킹
    $("#btns").controlgroup();
    var date1 = document.getElementById("date1");
    var now = new Date();
    date1.value = "   / " + "      / ";
    if (date1.value != null) {
        date1.readOnly = true;
    }

    $("#btn1").click(function () {

    });

    $("#btn3").click(function () {

    });

    $("#btn4").click(function () {

    });

    $("#btn5").click(function () {

    });

    $("#btn6").click(function () {

    });

    $("#makebtn").click(function () {
        window.open("/AtTicketProject/ranking/rankinginsert.do", "추가", "width=400, height=350");
    });

    $("#modifybtn").click(function () {
        if ($('input').is(':checked') == true) {
            window.open("/AtTicketProject/ranking/rankingupdate.do", "수정", "width=400, height=250");
        } else {
            alert("하나 이상을 체크하시오.");
        }
    });

    $("#delbtn").click(function () {
        if ($('input').is(':checked') == true) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                // $("input[name=checkRow]:checked").each(function () {
                //     var tr_value = $(this).val();
                //     var box = $("box" + tr_value);
                //     console.log(1);
                //     box.remove();
                // });
            }
        } else {
            alert("하나 이상을 체크하시오.");
        }
    });

	</script>

	<script type="text/javascript">

        // Build the chart
        Highcharts.chart('container', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Booking rate by genre'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'performance',
                colorByPoint: true,
                data: [{
                    name: 'Concert',
                    y: 40,
                    sliced: true,
                    selected: true
                }, {
                    name: 'Musical',
                    y: 46
                }, {
                    name: 'play',
                    y: 7
                }, {
                    name: 'Exhibition',
                    y: 3
                }, {
                    name: 'Other',
                    y: 4
                }]
            }]
        });

    </script>
</body>
</html>