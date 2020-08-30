<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="shortcut icon" href="./images/favicon.ico">
<link rel="stylesheet" href="/AtTicketProject/css/usermypage.css" />


<style>
* {
	outline: none;
}

body {
	margin: 0 auto;
}

#photo {
	border-radius: 25px;
	margin-left: 5px;
}

.b {
	margin-left:10px;
	margin-top:50px;
	width: 405px;
	height: 255px;
	border: 1px solid #7E9CB6;
}

#tt {
	margin-left:10px;
	position: relative;
	top: 50px;
	width: 405px;
	height: 30px;
	background-color: #7E9CB6;
	text-align: center;
	color: white;
	font-weight: bold;
	padding-top: 5px;
	font-size: 1.2em;
}

#tt1 {
	width: 599px;
	height: 30px;
	background-color: #7E9CB6;
	text-align: center;
	color: white;
	font-weight: bold;
	padding-top: 5px;
	font-size: 1.2em;
}

#tt2 {
	position: relative;
	top: 20px;
	width: 1240px;
	height: 30px;
	background-color: #7E9CB6;
	text-align: center;
	color: white;
	font-weight: bold;
	padding-top: 5px;
	font-size: 1.2em;
}

#tt3 {
	width: 1237px;
	height: 30px;
	background-color: #7E9CB6;
	text-align: center;
	color: white;
	font-weight: bold;
	padding-top: 5px;
	font-size: 1.2em;
}

#tt4 {
	width: 398px;
	height: 29px;
	background-color: #7E9CB6;
	text-align: center;
	color: white;
	font-weight: bold;
	padding-top: 5px;
	font-size: 1.2em;
}

#tt5 {
	width: 402px;
	height: 29px;
	background-color: #7E9CB6;
	text-align: center;
	color: white;
	font-weight: bold;
	padding-top: 5px;
	font-size: 1.2em;
}

#free {
	height: 285px;
	margin-top: 10px;
	border: 1px solid #7E9CB6;
}

#bb1 {
	margin-top: 20px;
	/* height: 480px; */
	width: 1240px;
	border: 1px solid #7E9CB6;
}

#content {
	width: 250px;
	height: 150px;
	margin-left: 150px;
	margin-top: -40px;
	border-radius: 10px;
}

/* #container2 {
	width: 590px;
	height: 220px;
} */

 #container1 {
	margin-top: 60px;
	width: 500px;
	height: 300px;
	margin-left: -100px;
} 

/* .img1{
        position: absolute;
        height: 100%;
        width: 100%;
        background-color: rgb(0,0,0,0.7);
        z-index:1;
    } */
img1:hover {
	/* position: fixed; */
	cursor: pointer;
	/* filter: brightness(60%);  */
	/* position: absolute; */
}

.img1 {
	background-size: contain;
	background-position: center center;
	background-repeat: no-repeat;
}

/* #myimg2 {
	background-image: url("/AtTicketProject/images/classic10.jpeg");
	background-size: contain;
	background-position: center center;
	background-repeat: no-repeat;
	
}

#myimg3 {
	background-image: url("/AtTicketProject/images/classic11.jpeg");
	background-size: contain;
	background-position: center center;
	background-repeat: no-repeat;
	
} */

.highcharts-figure {
	width: 10px;
	height: 10px;
}

.menubar {
	margin: 0 5px;
	cursor: pointer;
}

#container1 tspan {
	font-weight: bold;
	color: #7E9CB6 !important;
}

#month3 {
	position: relative;
	z-index: 1;
	margin-bottom: 10px;
	margin-top: 10px;
	margin-left: 10px;
}

h3 {
	margin-top: 20px;
	font-weight: bold;
	font-size: 1.5em;
	color: sandybrown;
	margin-left: 10px;
}

th {
	background-color: #7E9CB6;
}

.wrapper {
	display: grid;
	grid-template-columns: 420px 420px 420px;
	grid-template-rows: 80px 450px 580px 400px;
	position: relative;
	left: -250px;
	top: 0;
}

.item1 {
	grid-column: 1/4;
	grid-row: 1/2;
}

.item2 {
	/* border: 1px solid red; */
	/* margin-top: -49px; */
	/* margin-left: 380px; */
	grid-column: 1/2;
	grid-row: 2/3;
}

.item3 {
	height: 285px;
	width: 400px;
	border: 1px solid #7E9CB6;
	grid-column: 2/4;
	grid-row: 2/3;
	margin-top: 51px;
/* 	margin-right: 380px;
	margin-left: -150px; */
}

.item4 {
	margin-left: 10px;
	grid-column: 1/4;
	grid-row: 3/4;
	margin-top:-170px;
	/* margin-top: 30px; */
}
/* 
.item5 {
	grid-column: 1/2;
	grid-row: 4/5;
	width: 600px;
	height: 300px;
	margin-left: 490px;
	border: 1px solid #7E9CB6;
	margin-top: -30px;
} */

#date {
	margin-left: 50px;
	margin-bottom: 20px;
}

.item6 {
	position: relative;
	/* left: 30px; */
	top: -200px;
	grid-column: 1/3;
	grid-row: 4/5;
	margin-top: 10px;
	margin-left:10px;
	width: 615px;
	height: 300px;
	/* margin-right: 380px; */
	border: 1px solid #7E9CB6;
	/* margin-left: 350px; */
}

#month1 {
	position: relative;
	top: 13px;
	z-index: 1;
	margin-left: 10px;
	margin-bottom: 30px;
}

.graph {
	width: 520px;
}

#container3 {
	margin-left:150px;
	width: 1000px;
	height: 230px;
}

.glyphicon {
	font-size: 2em
}

#mo {
	overflow: hidden;
	margin-top: -20px;
}

#rbox {
	transition: all 1s linear;
}

.img1 {
	/* margin-top: -200px; */
	/* margin-right: -4px; */
	width: 140px;
	height: 200px;
}

#month2 {
	margin-left: 10px;
	margin-top: 10px;
	margin-bottom: 5px;
}

#ul1 li {
	/* color: #333333; */
	margin-left: 20px;
	margin-bottom: 10px;
}

#ul2 {
	margin-top:50px;
}

#ul2 li {
	/* color: #8AC6D1; */
	/* line-height: 14px; */
	margin-bottom: 10px;
	margin-left: 20px;
}

#free {
	position: relative;
	left: 420px;
	top: -291px;
}

th {
	text-align: center;
}

td {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

#txt1 {
	opacity: 0;
}

#txt2 {
	opacity: 0;
}

#txt3 {
	opacity: 0;
}

.img1:hover #txt1 {
	opacity: 1;
	animation-name: key1;
	animation-duration: .5s;
	filter: brightness(100%);
	transform: scale(1, 1);
	z-index: 2;
}


th {
	color: white;
	font-weight: bold;
}

.img1 {
	position: relative;
	/* left: -30px; */
	height: 200px;
	width: 140px;
	/* background-color: rgba(0, 0, 0, 0.1); */
	z-index: 1;
}

.img1:hover .img-cover {
	display: block;
	position: relative;
	top: -60px;
	padding-top: 60px;
	width: 140px;
	height: 200px;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 100;
}

#right {
	/* border: 1px solid black; */
	width: 1300px;
	height: 1500px;
	position:relative;
	left: 250px;
	top: 0;
	
}

.item2{
	margin-top:-50px;
}

.item3{
	margin-top:0px;
}

</style>
</head>
<body>

	<div id="main">

		<%@include file="/WEB-INF/views/inc/mypagetopbar.jsp"%>

		<div id="middle">
			<%@include file="/WEB-INF/views/inc/mypageleft.jsp"%>
			<!-- <div id="right" style="position:relative; left:-350px;top:-75px;"> -->
			<div id="right">
				<div class="wrapper">
					<div class="item1">
						<!-- <div id="top">
						</div> -->
						<div
							style="font-weight: bold; margin-left:50px; font-size: 1.3em;margin-top:30px; background-color: #FAE4D9; text-align: center; width: 150px; color: white;">
							MyPage 상세</div>
					</div>

					<div class="item2">
						<!-- <div id="box"> -->
						<div id="tt">나의 정보</div>
						<div class="b">
							<p></p>
							<img id="photo" src="/AtTicketProject/images/${cdto.photo}"
								width="125px" height="125px" style="float: left;">
							<div style="position: relative; top: 40px;" id="content">
								<span style="font-weight: bold;">이름 : ${cdto.name}</span><br> <span
									style="font-weight: bold;">나이 : ${cdto.age}</span><br> <span
									style="font-weight: bold;">주소 : ${cdto.addr}</span><br> <span
									style="font-weight: bold;">이메일 : ${cdto.email}</span><br>
								<span style="font-weight: bold;">전화번호 : ${cdto.tel}</span><br>
								 <span style="font-weight: bold;">아이디 : ${cdto.id}</span><br>
							</div>
							<div
								style="margin-top: 60px; margin-left: 30px; font-size: 1.2em;">
								<span style="font-weight: bold;">[♡ 사진을 클릭하면 고객 등급이 나옵니다.
									♡]</span>
							</div>
						</div>
						<!-- </div> -->

					</div>

					<div style="clear: both;"></div>

					<div class="item3">
						<div id="tt4">Q&A 답변 여부</div>
						<div
							style="overflow-y: auto; width: 398px; height: 253px; position: relative; top: 1px;">
							<div>
								<input
									style="width: 100px; text-align: center; margin-top: 10px;"
									type="text" id="date">
							</div>
							<c:if test = "${qlist.size()==0}">
							<div style="margin-left:150px;margin-top:40px;">답변이 없습니다.</div>
							</c:if>
							<c:if test="${qlist.size()!=0}">
							<ul id="ul1">
							<c:forEach items = "${qlist}" var = "qdto">  
								<li>${qdto.qseq}. <b>구분: ${qdto.tag}</b>qdto.tag<br>&nbsp;&nbsp;&nbsp;&nbsp;<b>답변
										날짜:</b>${qdto.answerdate}<br> &nbsp;&nbsp;&nbsp;&nbsp;<b>[${qdto.qseq}]</b>번이
									답변 되었습니다.
								</li>	
							</c:forEach>		
							</ul>
							</c:if>
						</div>
						<div id="free" style="margin-left: -6px; margin-top: 8px;">
							<div id="tt5">리뷰게시판</div>
							<div
								style="overflow-y: auto; width: 402px; height: 254px; position: relative; top: -0.5px;">
								<div>
									<!-- <input
										style="width: 100px; text-align: center; margin-left: 50px; margin-top: 10px;"
										type="text" id="date1"> -->
								</div>
								<c:if test = "${rlist.size()==0}">
									<div style="margin-left:150px;margin-top:40px;">답변이 없습니다.</div>
								</c:if>
								<c:if test="${rlist.size()!= 0}">
								<ul id="ul2">
								<c:forEach items = "${rlist}" var = "rdto">  
									<li>＃<b>${rdto.rseq}.</b> <b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목 : </b>${rdto.rtitle}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>시간 : </b>
										 ${rdto.regdate}<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<b>조회수 : </b>${rdto.rview}
									</li>	
								</c:forEach>		
								</ul>
								</c:if>
							</div>
						</div>
					</div>
					<div class="item4" style="margin:">
						<div id="tt2">구매 티켓 내역</div>
						<div id="bb1">
							<select style="margin-left: 250px;" name="month1" id="month1">
								<optgroup label="월">
									<option value = "-1">월 선택</option>
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</optgroup>
							</select>
							<div style="border: 1px #8AC6D1;">
								<div
									style="position: relative; display: inline-block; top: 80px; left: 30px; margin-left: 170px;">
									<span class="glyphicon glyphicon-chevron-left" id="conleft"></span>
								</div>
								<div id="mo"
									style="width: 140px; height: 200px; margin-left: 250px;">
									<div style="width: 420px; height: 200px;" id="rbox">
										<div id = "rrbox">
											<c:if test="${plist.size() == 0}">
												<div style="margin-top:30px;"><b>포스트가 없습니다.</b></div>
											</c:if>
											<c:if test = "${plist.size() != 0}">
											<c:forEach items = "${plist}" var = "pdto">
											<div style="color: white; text-align: center; padding-top: 60px; float: left;" class="img1" id = "img1">
												<div class="img-cover">
													<span class = "txt" id="txt1">${plist.showtitle}<br>${plist.bookdate}<br>${plist.showaddr}
													</span>
												</div>
											</div>
											</c:forEach>
											</c:if>
										</div>	
									</div>
								</div>
								<!-- <div style="position: relative;left: 300px;top: -150px;color: white;">셜록 홈즈 <br> 2020-07-24<br>강남구 역삼동</div> -->
								<div
									style="position: relative; display: inline-block; position: relative; top: -133px; left: 210px; margin-left: 198px; z-index: 1;">
									<span class="glyphicon glyphicon-chevron-right" id="conright"></span>
								</div>
							</div>


							<div class="graph"
								style="position: relative; top: -330px; left: 700px;">
								<figure class="highcharts-figure">
									<div id="container1"></div>
								</figure>
							</div>

							<div
								style="border: 1px solid #7E9CB6; width: 1230px; height: 150px; overflow-y: auto; margin-left: 5px; margin-top: -10px; position: relative; top: -30px;">
								<table
									style="width: 100%; height: auto; border: 1px solid #eeee; margin: 0px;"
									class="table table-hover" id = "tbl1">
									<tr style="vertical-align: middle;height:10px;">
										<th style="width:10%;">상태</th>
										<th>내역</th>
										<th style="width:20%;">날짜</th>
										<th>가격</th>
										<th>장소</th>
									</tr>
									<tbody id = "tbody1">
									<c:if test = "${blist.size()==0}">
									<tr style="height:140px;">
										<td style="padding-top:40px;" colspan="5">내역이 없습니다.</td>
									</tr>
									</c:if>
									<c:if test = "${blist.size()!=0}">
										<c:forEach items = "${blist}" var = "bdto">
										<tr style="height:140px;">
											<td>${bdto.state}</td>
											<td>${bdto.title}의 예매가 ${bdto.state} 되었습니다.</td>
											<td>${bdto.bookdate}</td>
											<td>${bdto.showprice}</td>
											<td>${bdto.showaddr}</td>
										</tr>	
										</c:forEach>
									</c:if>
									</tbody>
								</table>

							</div>

						</div>
					</div>


					<!-- <div class="item5" style="margin-left: 380px;">

						<div id="tt1">고객 포인트</div>
						<select name="sel" id="month2">
							<optgroup label="월">
								<option value = "-1">월 선택</option>
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</optgroup>
						</select>
						<div class="graph">
							<figure class="highcharts-figure">
								<div id="container2"></div>
							</figure>
						</div>
					</div> -->

					<div style="width:1240px;" class="item6">
						<div id="tt3">결제한 날짜</div>
						<select name="sel2" id="month3">
							<optgroup label="월">
								<option value = "-1">월 선택</option>
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</optgroup>
						</select>
						<figure class="highcharts-figure">
							<div id="container3"></div>
						</figure>
					</div>

					<!-- <div class="item7">

            </div> -->
					<%@include file="/WEB-INF/views/inc/userchat.jsp"%>
					<!-- 제일 위로 돌아가기 버튼 -->
					<div id="movetop">↑</div>
				</div>
			</div>
		</div>
			<%@include file="/WEB-INF/views/inc/mypagebottom.jsp"%>
	</div>

		<script>
		
			var cnt = 0;	
			var i = 1;
			$("#month1").change(function(){
				i=1;
				var month1 = $(this).val();
				//alert(buseo);
				
				//ajax 요청 -> 결과 -> 차트에 반영 
				$.ajax({
					type:"GET",
					url:"/AtTicketProject/mydenticket.do",
					data:"month1="+month1,
					dataType:"json",
					success:function(result){
						
						options.series[0].data = result;
						Highcharts.chart('container1', options);
						
					},
					error:function(a,b,c){
						console.log(a,b,c);
					}
				});
				
				$.ajax({
					type:"GET",
					url:"/AtTicketProject/mybuyinfo.do",
					data:"month1="+month1,
					dataType:"json",
					success:function(result){
						
						$("#tbody1").html("");
						$(result).each(function(index,item){
							var temp = "";
							temp+="<tr style='height:auto;'>";
							temp+="<td>" + item.state + "</td>";
							temp+="<td>" + item.title+"의 예매가 " + item.state + " 되었습니다.</td>";
							temp+="<td>" + item.bookdate + "</td>";
							temp+="<td>" + item.showprice + "</td>";
							temp+="<td>" + item.showaddr + "</td>";
							temp+="</tr>";	
						$("#tbody1").append(temp);	
						});
						
						
					},
					error:function(a,b,c){
						console.log(a,b,c);
					}
				});
				
				$.ajax({
					type:"GET",
					url:"/AtTicketProject/mypost.do",
					data:"month1="+month1,
					dataType:"json",
					success:function(result){
						
						$("#rrbox").html("");
						$(result).each(function(index,item){
							console.log(item);
							var temp = "";
							temp+="<div style='color: white; text-align: center; padding-top: 60px; float: left;' class='img1' id ="+ "'img"+i+"'>";
							temp+="<div class='img-cover'>";
							temp+="<span class = 'txt' id='txt1'>"+item.showtitle+"<br>"+item.bookdate+"<br>"+item.showaddr;
							temp+="</span>";
							temp+="</div>";	
							temp+="</div>";	
							$("#rrbox").append(temp);
							$("#img"+i).css("background-image","url(/AtTicketProject/images/"+item.poster+")");
							i+=1;
							cnt = result.size;
						});
						$("#rbox").css("width",(140*i)+"px");
						
						i=1;
					},
					error:function(a,b,c){
						console.log(a,b,c);
					}
				});
				
			});
	
			var options	= {
				chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie'
			},

			title : {
				text : ' ♡ 장르별 구매 티켓 ♡'
			},
			tooltip : {
				pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			accessibility : {
				point : {
					valueSuffix : '%'
				}
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					dataLabels : {
						enabled : false
					},
					showInLegend : true
				}
			},
			credits : {
				enabled : false
			},
			series : [ {
				name : '비율:',
				colorByPoint : true,
				data : [ 
					
				]
			}]
		};

		Highcharts.chart('container1', options);
		
		/* $("#month2").change(function(){
			var month2 = $(this).val();
			//alert(buseo);
			
			//ajax 요청 -> 결과 -> 차트에 반영 
			$.ajax({
				type:"GET",
				url:"/AtTicketProject/mypoint.do",
				data:"month2="+month2,
				dataType:"json",
				success:function(result){
					
					
					options1.series[0].data = result;
					Highcharts.chart('container2', options1);
					
				},
				error:function(a,b,c){
					console.log(a,b,c);
				}
			});
		});	 */
		
		/* var options1 = {

			colors : [ "#C8EBFA" ],

			title : {
				text : ''
			},

			yAxis : {
				title : {
					text : 'Points'
				}
			},
			credits : {
				enabled : false
			},

			xAxis : {
				accessibility : {
					rangeDescription : 'Range: 1 to 31'
				},
				categories : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
						'10', '11', '12', '13', '14', '15', '16', '17',
						'18', '19', '20', '21', '22', '23', '24', '25',
						'26', '27', '28', '29', '30', '31'

				]
			},

			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle'
			},

			plotOptions : {
				series : {
					label : {
						connectorAllowed : false
					},
					pointStart : 1

				}
			},

			series : [ {
				name : "",
				data : [ ]
			} ],

			responsive : {
				rules : [ {
					condition : {
						maxWidth : 500
					},
					chartOptions : {
						legend : {
							layout : 'horizontal',
							align : 'center',
							verticalAlign : 'bottom'
						}
					}
				} ]
			}

		};
	
	
	Highcharts.chart('container2', options1); */
	
	var options2 = {
			chart : {
				type : 'column'
			},
			colors : [ "#C8EBFA" ],
			title : {
				text : ''
			},
			credits : {
				enabled : false
			},

			xAxis : {
				categories : [ '1', '2', '3', '4', '5',
						'6', '7', '8', '9', '10', '11',
						'12', '13', '14', '15', '16', '17',
						'18', '19', '20', '21', '22', '23',
						'24', '25', '26', '27', '28', '29',
						'30', '31',

				],
				crosshair : true
			},
			yAxis : {
				min : 0,
				title : {
					text : '결제횟수'
				}
			},
			tooltip : {
				headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
						+ '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
				footerFormat : '</table>',
				shared : true,
				useHTML : true
			},
			plotOptions : {
				column : {
					pointPadding : 0.2,
					borderWidth : 0
				}
			},
			series : [ {
				name : $("#month3").val(),
				data : [ ]

			} ]
		};
	
	$("#month3").change(function(){
		var month3 = $(this).val();
		//alert(buseo);
		
		//ajax 요청 -> 결과 -> 차트에 반영 
		$.ajax({
			type:"GET",
			url:"/AtTicketProject/mybdate.do",
			data:"month3="+month3,
			dataType:"json",
			success:function(result){
				
				options2.series[0].data = result;
				Highcharts.chart('container3', options2);
				
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		});
	});	
	
	Highcharts.chart('container3', options2);
	
		
		var rbox = document.getElementById("rbox")
		var distance = 0;
		$("#conright").click(
		
				function() {
					
					if (distance == 140*(cnt-1)) {
						distance = 0;
						rbox.style.transform = "translate(0px,0px)";
					} else {
						distance += 140;
						rbox.style.transform = "translate(-" + distance
								+ "px,0px)";
					}
				});
		
		
		distance =  140*(i-1);
		$("#conleft").click(
				function() {
					if (distance == -140) {
						distance =  140*(cnt-1);
					} else {
						console.log(distance);
						rbox.style.transform = "translate(-" + distance
								+ "px,0px)";
						distance -= 140;
					}
				});

			$("#photo").mouseenter(function() {
				$("#photo").css("opacity", 0.7);
			});

			$("#photo").mouseout(function() {
				$("#photo").css("opacity", 1);
			});

			$("#photo").click(function() {
				alert("${cdto.grade}");
			});

			var date = document.getElementById("date");
			/* var date1 = document.getElementById("date1"); */
			var now = new Date();

			//날짜 자동 입력, 읽기만 가능 
			date.value = now.getFullYear() + " / " + (now.getMonth() + 1)
					+ " / " + now.getDate();
			if (date.value != null) {
				date.readOnly = true;
			}
			/* date1.value = now.getFullYear() + " / " + (now.getMonth() + 1)
					+ " / " + now.getDate();
			if (date1.value != null) {
				date1.readOnly = true;
			} */

			$(".img1").mouseover(function() {
				$(this).css("opacity", 0.5);
			});

			$(".img1").mouseout(function() {
				$(this).css("opacity", 1);
			});
		</script>
</body>
</html>