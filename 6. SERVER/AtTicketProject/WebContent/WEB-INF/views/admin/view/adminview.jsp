<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
	
    <style>

        #content {
            /* border: 1px solid red; */
            width: 86.5%;
            height: 1880px;
            position: absolute;
            left: 250px;
            top: 120px;
        }

        #tabs{
            width: 1000px;
            margin-left: 30px;
        }
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }
        .wrapper {
            /* border: 1px solid black; */
            position: relative;
            display: grid;
            grid-template-columns: 400px 400px 650px;
            grid-template-rows: 100px 420px 450px;
            margin-left: 20px;
        }
        .item1 {
            grid-column-start: 1;
            grid-column-end: 2;
            text-align: center;
            margin: 7px;
        }
        .item2 {
            text-align: center;
            grid-column-start: 2;
            grid-column-end: 3;
            margin: 7px;
        }
        .item3 {
            /* border: 1px solid black; */
            width: 640px;
            height: 515px;
            border-radius: 10px; 
            background-color: rgb(245, 245, 245);
            grid-column: 3/4;
            grid-row: 1/2;
            padding: 20px;
            margin-top: 5px;
            margin-left: 7px;
        }
        .item4 { grid-column: 1/2; border: 3px solid rgb(244, 244, 244); border-radius: 10px; width: 390px; margin-left: 5px;}
        .item5 { grid-column: 2/3; border: 3px solid rgb(244, 244, 244); border-radius: 10px; width: 390px; margin-left: 5px;}
        .item6 { grid-column: 1/3; border: 3px solid rgb(244, 244, 244); border-radius: 10px; width: 790px; margin-top: 10px; margin-left: 5px;}
        .item7 { grid-column: 3/4; border: 3px solid rgb(244, 244, 244); border-radius: 10px; height: 440px; width: 645px; margin-left: 5px; margin-top: 10px;}

        #rtbl {
            width: 600px;
            height: 50px;
            overflow: hidden;
            margin-top: 20px;
        }
        #rtbl th {
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
            text-align: center;
        }
        #rtbl th:nth-child(1) { width: 50px; }
        #rtbl th:nth-child(2) { width: 70px; }
        #rtbl th:nth-child(3) { width: 100px; }
        #rtbl th:nth-child(4) { width: 250px; }
        #rtbl th:last-child { width: 100px;}
        /* #rtbl tr:first-child { height: 70px; }
        #rtbl tr { height: 300px;  text-align: center; } */
        

        #slideItem {
            /* border: 1px solid gray; */
            width: 600px;
            height: 280px;
            position:relative;
            overflow: hidden;
            margin-top: 25px;

        }
        .slide{
            /* border: 1px solid red; */
            height: 280px; /* 이미지 크기 * 이미지 개수 + 여유 */
            position:absolute;	
        }
        .slide li{
            display: block;

        }
        .slide li img{
            width:200px; 
            height: 280px;
            margin-left: 5px;     
        }


        .slide > li > span {font-size: 18px; margin-top:120px;}

        .slide > li > span:nth-child(1) { margin-left: -20px;}
        .slide > li > span:nth-child(2) { margin-left: 30px; display:inline-block; width: 50px;}
        .slide > li > span:nth-child(3) { margin-left: 27px; display:inline-block; width: 120px; font-size: 14px;}
        .slide > li > span:last-child { margin-left: 65px; display:inline-block; width: 65px;}

        #aa {
            text-decoration: none;
            color: #777;
            position: relative;
            left: 530px;    
            top: 50px; 
            display: block;
        }
        #aa:link { color: #999; text-decoration: none;}
        #aa:visited { color: #999; text-decoration: none;}
        #aa:hover { color: #999; text-decoration: none;}


    </style>

    <style type="text/css">
    /* 그래프*/
        .highcharts-figure, .highcharts-data-table table {
            min-width: 360px; 
            max-width: 800px;
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
        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
            padding: 0.5em;
        }
        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }
        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }


    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminViews</title>

    <script src="../js/highcharts.js"></script>
</head>

<body>
    <div id = "title">
        <h1 style="color:#555">방문자 통계 <small> > Home  </small></h1>
    </div>

	<%@include file="/WEB-INF/views/inc/menu.jsp" %>
	
    <div id="content">

        <div class="wrapper">
            <div class="item1" style="border-radius: 10px; background-color: rgb(244, 244, 244);">
                <h4 style="margin-right: 140px; color: #666;">방문자</h4>
                <span style="color: #555; font-size: 25px;" id="visitorNow"></span><span style="color:red"id="visitorPluse"></span>
                <span class="glyphicon glyphicon-stats" style="font-size: 35px; margin-left: 100px; color: #e09b9b;"></span>
            </div>
            <div class="item2" style="border-radius: 10px; background-color: rgb(244, 244, 244);">
                <h4 style="margin-right: 140px; color: #666;">예매율</h4>
                <span style="color: #555; font-size: 25px;" id="rateNow"></span><span style="color: blue" id="ratePluse"></span>
                <span class="glyphicon glyphicon-stats" style="font-size: 35px; margin-left: 100px; color: #e09b9b;"></span>

            </div>
            <div class="item3">
                <!-- 실시간 공연 예매 랭킹 -->
                <h4>실시간 공연 예매 랭킹</h4>

                <table id="rtbl">
                    <tbody>
                        <tr>
                            <th>순위</th>
                            <th>장르</th>
                            <th>제목</th>
                            <th>포스터</th>
                            <th>예매율</th>
                        </tr>
                    </tbody>
                </table>

                <div id="slideItem">
                    <ul class="slide">
                    </ul>
                </div>

                <a href="Ranking.html" id="aa" style="width: 100px;">자세히 보기</a>
    

            </div>

            <div class="item4">
                <figure class="highcharts-figure">
                    <div id="container2"></div>
                </figure>
            </div>
            <div class="item5">
                <figure class="highcharts-figure">
                    <div id="container1"></div>
                </figure>
            </div>
            <div class="item6">
                <figure class="highcharts-figure">
                    <div id="container3"></div>
                </figure>
            </div>
            <div class="item7">
                <figure class="highcharts-figure">
                    <div id="container4"></div>
                </figure>
            </div>

        </div>

  


    </div>


</body>
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>

    $("#tabs").tabs({
            active: 0 //기본으로 선택할 것 고르기
    });
    
    
function callAjax(url, method, params, sCallback, eCallback) {
	$.ajax({
		type: method,
		url: url,
		dataType: "json",
		success: sCallback,
		error: eCallback		
	});
}

$(document).ready(function (){
	fn_dailyVisitor(); // 일일방문자 Tran
	fn_dailyBookRate(); //일일예매율 Tran
	fn_realTimeBookRank(); //실시간예매순위 Tran
	fn_ageBookRate(); //성별연령별예매율 Tran
	fn_genreBookRate(); // 장르별예매율 Tran
});

// 일일방문자 Tran
function fn_dailyVisitor() {
	//jin var url = '/AtTicketProject/customer/adminViewOk1.do';
	var url = '/AtTicketProject/customer/adminviewok.do';
	var method = 'GET';
	var s_Callback = fn_callback_dailyVisitor;
	var e_Callback = fn_err_callback_dailyVisitor;
	
	callAjax(url, method, '' , s_Callback, e_Callback);
}

//일일예매율 Tran
function fn_dailyBookRate(){
	var url = '/AtTicketProject/customer/dailyBookRateOk.do';
	var method = 'GET';
	var s_Callback = fn_callback_dailyBookRate;
	var e_Callback = fn_err_callback_dailyBookRate;
	
	
	callAjax(url, method, '' , s_Callback, e_Callback);
}

//실시간예매순위 Tran
function fn_realTimeBookRank(){
	var url = '/AtTicketProject/customer/realTimeBookRankOk.do';
	var method = 'GET';
	var s_Callback = fn_callback_realTimeBookRank;
	var e_Callback = fn_err_callback_realTimeBookRank;
	
	callAjax(url, method, '' , s_Callback, e_Callback);
}

//성별연령별예매율 Tran
function fn_ageBookRate(){
	var url = '/AtTicketProject/customer/ageBookRateOk.do';
	var method = 'GET';
	var s_Callback = fn_callback_ageBookRate;
	var e_Callback = fn_err_callback_ageBookRate;
	
	callAjax(url, method, '' , s_Callback, e_Callback);
}

// 장르별예매율 Tran
function fn_genreBookRate(){
	var url = '/AtTicketProject/customer/genreBookRateOk.do';
	var method = 'GET';
	var s_Callback = fn_callback_genreBookRate;
	var e_Callback = fn_err_callback_genreBookRate;
	
	callAjax(url, method, '' , s_Callback, e_Callback);
}


//일일방문자 콜백
function fn_callback_dailyVisitor(response){
	var vData = [];
	var vCnt = [];
	$(response[1]).each(function (index, item){
		vData.push(item.vdate);
		vCnt.push(parseFloat(item.vcnt, 10));
	});
	
	console.log(vData);
	console.log(vCnt);
	
	
	$("#visitorNow").html(vCnt[6]+'k');
	
	if( vCnt[6]-vCnt[5] > 0 ){
		$("#visitorPluse").html('▲ ' +(vCnt[6]-vCnt[5]).toFixed(1)+'k')
		$("#visitorPluse").css({
			"color" : "red",
			"margin-left": "10px"
		});
	} else {
		$("#visitorPluse").html('▼ ' +(vCnt[6]-vCnt[5]).toFixed(1)+'k')
		$("#visitorPluse").css({
			"color" : "blue",
			"margin-left": "10px"
		});
	}
	
	Highcharts.chart('container2', {
        colors: [
            "#8389E0"
        ],
        chart: {
            type: 'line'
        },
        title: {
            text: vData[0] +' ~ '+ vData[6]
        },
        subtitle: {
            text: 'At-Ticket.com'
        },
        xAxis: {
            categories: vData
        },
        yAxis: {
            title: {
                text: '방문자수(k)'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: '일별 방문자(천)',
            // data: [12.7, 15.0, 25.6, 27.8, 22.2, 23.8, 25.9]
            data: vCnt
        }]
    });
}

//일일예매율 콜백
function fn_callback_dailyBookRate(response){
	//alert("일일예매율 콜백");
	
	var dbData = [];
	var dbRate = [];
	$(response).each(function (index, item){
		dbData.push(item.dbdate);
		dbRate.push(parseFloat(item.dbrate, 10));
	});
	//alert("일일예매율 콜백 성공");
	
	$("#rateNow").html(dbRate[2]+'%');
	
	if( dbRate[2]-dbRate[1] > 0 ){
		$("#ratePluse").html('▲ ' +(dbRate[2]-dbRate[1]).toFixed(1)+'%')
		$("#ratePluse").css({
			"color" : "red",
			"margin-left": "10px"
		});
	} else {
		$("#ratePluse").html('▼ ' +(dbRate[2]-dbRate[1]).toFixed(1)+'%')
		$("#ratePluse").css({
			"color" : "blue",
			"margin-left": "10px"
		});
	};
	
	
	console.log("일일예애: "+dbData);
	console.log(dbRate);
	

	
    Highcharts.chart('container1', {
        colors: [
            "#92D050"
        ],
        chart: {
            type: 'column'
        },
        title: {
            text: dbData[0] +' ~ '+ dbData[2]
        },
        subtitle: {
            text: 'At-Ticket.com'
        },
        xAxis: {
            categories: dbData,
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '예매율(%)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f}%</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '일별 예매율(%)',
            data: dbRate

        }]
    });
}

//실시간예매순위 콜백
function fn_callback_realTimeBookRank(response){
 	var imgs = [];
	var category = [];
	var titles = [];
	var booking = [];
	
	//alert("실시간예매순위 콜백");
	$(response).each(function (index, item){
		imgs.push(item.poster);
		category.push('<span>'+item.genre+'</span>');
		titles.push('<span>'+item.title+'</span>');
		booking.push('<span>'+parseFloat(item.rate, 10+'</span>'));
	});
	
	var idx = 0; // 함수 호출 횟수
    var i=0; // 이미지 인덱스
    var imgNum=5; // 이미지 개수
    var imgSize=280; // 이미지 크기
    
    for(var j =0; j<5; j++ ){
    $('.slide').append('<li><span>' + (j+1) +'</span>'+ category[j] + titles[j] +
    	    '<img src="../images/'+imgs[j]+'" alt="">' + booking[j] + '</li>');
    	    //j++;
    }
    

    function imgSlide() {
        idx++;
        if(i > 4){
            i=0;
        }
        $('.slide').css({"top":"-20px"});
        $('.slide').stop().animate({'top' : -imgSize+"px"}, "slow");


        if(idx > 1) {
            $('.slide>li:first').remove(); 
        
            $('.slide').append('<li><span>' + (i+1) +'</span>'+ category[i] + titles[i] +
            '<img style="margin-left:5px" src="../images/'+imgs[i]+'" alt="">' + booking[i] + '</li>');
            i++;
        }

        
    }

    setInterval(function() { imgSlide() }, 4000); 
	
}

//성별연령별예매율 콜백
function fn_callback_ageBookRate(response){
	//alert("성별연령별예매율 콜백");
    //성별/연령별
    var abAge = [];
	var abMan = [];
	var abWoman = [];
	$(response).each(function (index, item){
		abAge.push(item.age);
		abMan.push(parseFloat(-item.man, 10));
		abWoman.push(parseFloat(item.woman, 10));
	});
    
        /* '10-14', '15-19',
        '20-24', '25-29', '30-34', '35-39', '40-44',
        '45-49', '50-54', '55-59', '60-64', '65-69',
        '70-74', '75-79', '80-84', '85-89' */
    var categories = abAge;
    

    Highcharts.chart('container3', {
        colors: [
            "cornflowerblue","orange"
        ],
        chart: {
            type: 'bar'
        },
        title: {
            text: '성별/연령별 예매율  통계'
        },
        subtitle: {
            text: 'At-Ticket.com'
        },
        accessibility: {
            point: {
                valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
            }
        },
        xAxis: [{
            categories: categories,
            reversed: false,
            labels: {
                step: 1
            },
            accessibility: {
                description: '나이 (남)'
            }
        }, { // mirror axis on right side
            opposite: true,
            reversed: false,
            categories: categories,
            linkedTo: 0,
            labels: {
                step: 1
            },
            accessibility: {
                description: '나이 (여자)'
            }
        }],
        yAxis: {
            title: {
                text: null
            },
            labels: {
                formatter: function () {
                    return Math.abs(this.value) + '%';
                }
            },
            accessibility: {
                description: 'Percentage population',
                rangeDescription: 'Range: 0 to 5%'
            }
        },
        
        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },

        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
                    'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 1) + '%';
            }
        },

        series: [{
            name: '남',
            data: abMan
            
        }, {
            name: '여',
            data: abWoman
            
        }]
    });
}

// 장르별예매율 콜백
function fn_callback_genreBookRate(response){
	//alert("장르별예매율 콜백");
	
	var gGenre = [];
	var gRate = [];
	$(response).each(function (index, item){
		gGenre.push(item.ggenre);
		gRate.push(parseFloat(item.grate, 10));
	});
	
    Highcharts.chart("container4", {
        colors: [
            "cornflowerblue",
            "orange",
            "#8389E0",
            "#92D050",
            "#555"
        ],
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: "pie",
        },
        title: {
            text: "장르별 예매율",
        },
        tooltip: {
            pointFormat:
                "{series.name}: <b>{point.percentage:.1f}%</b>",
        },
        accessibility: {
            point: {
                valueSuffix: "%",
            },
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: "pointer",
                dataLabels: {
                    enabled: true,
                    format:
                        "<b>{point.name}</b>: {point.percentage:.1f} %",
                },
            },
        },
        series: [
            {
                name: "Brands",
                colorByPoint: true,
                data: [
                    {
                        name: gGenre[0],
                        y: gRate[0],
                        sliced: true,
                        selected: true,
                    },
                    {
                        name: gGenre[1],
                        y: gRate[1],
                    },
                    {
                        name: gGenre[2],
                        y: gRate[2],
                    },
                    {
                        name: gGenre[3],
                        y: gRate[3],
                    },
                    {
                        name: gGenre[4],
                        y: gRate[4],
                    },
                ],
            },
        ],
    });
}



//일일방문자 에러콜백
function fn_err_callback_dailyVisitor(){
	alert("일일방문자 에러콜백");
}

//일일예매율 에러콜백
function fn_err_callback_dailyBookRate(){
	alert("일일예매율 에러콜백");
}

//실시간예매순위 에러콜백
function fn_err_callback_realTimeBookRank(){
	alert("실시간예매순위 에러콜백");
}

//성별연령별예매율 에러콜백
function fn_err_callback_ageBookRate(){
	alert("성별연령별예매율 에러콜백");
}

//장르별예매율 에러콜백
function fn_err_callback_genreBookRate(){
	alert("장르별예매율 에러콜백");
}

</script>

</html>