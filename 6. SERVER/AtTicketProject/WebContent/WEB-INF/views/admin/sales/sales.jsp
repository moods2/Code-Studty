<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        #box {
            margin-left: 280px;
            background-color: #999999;
            padding: 20px;
            width: 500px;
        }

        .img {
            width: 200px;
            height: 200px;
            background-color: #555555;
            margin: 20px;
        }

        .info {
            margin-left: 280px;
            margin-top: 100px;
        }

        .p {
            display: block;
        }


        .pagination>.active>a,
        .pagination>.active>span,
        .pagination>.active>a:hover,
        .pagination>.active>span:hover,
        .pagination>.active>a:focus,
        .pagination>.active>span:focus {
            background-color: #999999;
            border-color: #eeeeee;
        }

        .pagination>li>a,
        .pagination>li>span {
            color: black;
        }

        .modified {
            border : 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 35px;
            font-weight: bold    
        }
        .modified:hover {
            color : white;
            /* background-color: #333; */

        }

        .modified {
            border : 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 35px;
            font-weight: bold    
        }
        .modified:hover {
            color : white;
            /* background-color: #333; */

        }
</style>
<style type="text/css">
        .highcharts-figure,
        .highcharts-data-table table {
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

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
    </style>

</head>
<body>
    
    <div id="title">
        <h1 style="color: #555; font-weight: bold;
        font-family: Arial;
        font-size: 3em;">매출 관리 <small>> Home </small></h1>
    </div>
    
    <div style="margin-left: 400px; margin-top: 20px; width: 1000px;">
    <form method="GET" action="/AtTicketProject/adminsalesok.do" id="searchForm">
   
        <table style="margin-left: 280px; margin-top: 10px; width: 500px;"
            class="table  table-bordered table-striped table-hover">
            <tr>
                <td
                    style="width: 100px; background-color: #555555; text-align: center; vertical-align: middle; color: white;">
                    총 매출액</td>
                <td style="text-align: center; font-weight: bold; font-size: 2em;">${total}</td>
            </tr>
        </table>

        <div id="box">
            <div style="margin-top: 5px;"><label for="txtname" style="font-weight: bold;">&nbsp기간별 조회 :
                    &nbsp&nbsp&nbsp</label>
                <input style="width: 100px; text-align: center; " type="text" name="sdate" value="${dto.sdate}" id="sdate"><label for="date2"></label> ~ <input
                    style="width: 100px; text-align: center;" type="text" name="edate" value="${dto.edate}"
                    id="edate"><label for="date1"></label>
                <input style="margin-left: 34px; background-color: #333333; color: white; border: 0px;" type="button" onclick="$('#searchForm').submit();"
                    value="조회">
            </div>

	         
        </div>

			<figure class="highcharts-figure">
				<div id="container"></div>
			</figure>

		</form>
    </div>
	

	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	
	<script src="/WEB-INF/lib/highcharts.js"></script>
    <script type="text/javascript">
    
    	
    	var sdate = $("#sdate").val();
    	var edate = $("#edate").val();
    
	    $.ajax({
			type: "GET",
			url: "/AtTicketProject/genresalesok.do",
			data: "sdate="+ sdate + "&edate=" + edate,
			dataType: "json",
			success: function(result) {
				options.series[0].data = result;
				Highcharts.chart('container',options);
			},
			error: function (a,b,c) {
				console.log(a,b,c);
			}
		});
    	
    	var options =  {
   			chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: '장르별 매출액'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.y}원</b>'
		    },
		    accessibility: {
		        point: {
		            valueSuffix: '원'
		        }
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f}%'
		            }
		        }
		    },
		    series: [{
		        name: '매출액',
		        colorByPoint: true,
		        data: [ ]
		    }]
		};
    
        Highcharts.chart('container', options);
        
        $("#sdate").datepicker({
            dateFormat: "yy-mm-dd"
        });

        $("#edate").datepicker({
            dateFormat: "yy-mm-dd"
        });
        
      
        var date = new Date();
        date = getFormatDate(date);
        
     /*    if(${dto.sdate} == null) {
        	$("#sdate").val(date);
        	$("#edate").val(date);
        } */
        
        function getFormatDate(date) {
            var year = date.getFullYear();              //yyyy
            var month = (1 + date.getMonth());          //M
            month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
            var day = date.getDate();                   //d
            day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
            return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
        };
        
       
    <%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
    </script>

</body>
</html>