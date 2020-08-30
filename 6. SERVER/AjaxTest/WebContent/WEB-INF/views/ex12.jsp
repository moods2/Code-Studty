<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/ajax/css/bootstrap.css">
<script src="/ajax/js/jquery-1.12.4.js"></script>
<script src="/ajax/js/bootstrap.js"></script>
<style>
	.container {
		width: 900px;
	}
</style>
</head>
<body>
	<!-- ex12.jsp -->
	<div class="container">
	
		<h1>Chart</h1>
		
		<select id="buseo" name="buseo">
			<option value="-1">부서 선택</option>
			<c:forEach items="${list}" var="buseo">
				<option value="${buseo}">${buseo}</option>
			</c:forEach>
		</select>
		
		<div id="container"></div>
		
	</div>
	
	<script src="/ajax/js/highcharts.js"></script>
	<script>
	
	$("#buseo").change(function() {
		
		var buseo = $(this).val();
		//alert(buseo);
		
		//ajax 요청 -> 결과 -> 차트에 반영
		$.ajax({
			type: "GET",
			url: "/ajax/ex12ok.do",
			data: "buseo=" + buseo,
			dataType: "json",
			success: function (result) {
				console.log(result);
				options.series[0].data = result;
				Highcharts.chart('container', options);	
				
			},
			error: function (a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});
	
	
	var options = {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: '직급별 인원수'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.y:.0f}명</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '명'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.y:.0f}명'
	            }
	        }
	    },
	    series: [{
	        name: '인원수',
	        colorByPoint: true,
	        data: [
	        /* 
	        {
	            name: 'Chrome',
	            y: 61.41,
	            sliced: true,
	            selected: true
	        } 
	        */
	        ]
	    }]
	};
	
	//alert(options.series[0].data);
		
	Highcharts.chart('container', options);
	
	</script>
</body>
</html>















