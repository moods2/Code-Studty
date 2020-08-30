<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="shortcut icon" href="./images/favicon.ico">
    <script src="js/highcharts.js"></script>
    <script src="js/highcharts-3d.js"></script>
    <style>

        #search {
            text-align: center;
            margin-top: 30px;
        }
        #txtsearch { padding: 2px 3px; width: 350px; height: 20px; outline: none;}
        #btnsearch {
            background-color: #bbb;
            color: white;
            font-weight: bold;
            padding: 2px 10px;
            border: 1px solid #888;
            outline: none;
        }
        #tbl2 #title {
            width: 250px;
            height: 100px;
            margin-left: 30px;
            margin-top: 20px;
            padding-top: 40px;
            display: inline-block;
            text-align: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
            background-color: #7A98B4;
            border-radius: 10px;
        }
        #middle {
            width: 100%;
            min-height: 400px;
        }
        #container {
            width: 70%;
            display: inline-block;
        }
        #list {
            /* display: inline-block;
            position: relative;
            left: 20px;
            bottom: 20px; */
        }
        .list {
            margin-bottom: 0px;
            padding-right: 20px;
            /* border: 1px solid black; */
        }
        .list input {
        	margin-right: 10px;
        }
        .list img {
            width: 60px;
            height: 80px;
        }
        .list label {
            font-size: 12px;
        }
        .checkbox { display: inline-block; }
        /* .list label { display: block; } */
        #footer {
            text-align: center;
            position: absolute;
            bottom: 50px;
            left: 540px;
        }
        #add, #close {
            font-weight: bold;
            outline: none;
        }
        
        #tbl1 {
            border-collapse: collapse;
            width: 600px;
            margin: 0px auto;
            margin-top: 60px;
        }
        #tbl1 th, #tbl1 td {
            border: 1px solid #D3D3D3; 
            text-align: left;
            font-size: 13px;
            color: #444;
            padding: 10px 0;
            width: 300px
        }
        #tbl1 th {
            background-color: #EEE;
            border-top: 3px solid #666;
            border-bottom: 1px solid #CCC;
        }
        #tbl1 th:first-child {
            width: 30%;
        }
        
        #tbl1 > tbody > tr  img {
            width: 120px;
            height: 140px;
            float: left;
            margin: 0 10px;
        }
        #tbl1 > tbody > tr input {
        	margin-bottom: 5px;
        }
        
        #tbl1 > tbody > tr  p {
            margin-top: 15px;
            font-size: 12px;
            color: #444;
        }
        #tbl1 > tbody > tr  span {
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
        
        /* ====================== */
        #tbl2 {
        	display: block;
            border-collapse: collapse;
            width: 900px;
            margin: 0px auto;
            margin-top: 60px;
            margin-bottom: 200px;
        }
        #tbl2 th, #tbl2 td {
            border: 1px solid #D3D3D3; 
            text-align: left;
            font-size: 13px;
            color: #444;
            padding: 10px 0;
            width: 300px
        }
        #tbl2 th {
            background-color: #EEE;
            border-top: 3px solid #666;
            border-bottom: 1px solid #CCC;
        }
        #tbl2 th:first-child {
            width: 30%;
        }
        
        #tbl2 > tbody > tr  img {
            width: 120px;
            height: 140px;
            float: left;
            margin: 0 10px;
        }
        #tbl2 > tbody > tr input {
        	margin-bottom: 5px;
        }
        
        #tbl2 > tbody > tr  p {
            margin-top: 15px;
            font-size: 12px;
            color: #444;
        }
        #tbl2 > tbody > tr  span {
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
        
        #pagebar {
        	width: 600px;
        	text-align: center;
        	margin: 0px auto;
        	margin-top: 30px;
        }
        
        #searchInfo {
        	margin-left: 30px;
        	margin-right: 30px;
            text-align: center;
            color: white;
            background-color: #7A98B4;
            border-radius: 5px;
            padding: 5px 0px;
            margin-top: 20px;
        }
        
    </style>
</head>
<body>
    
    <div>
    	<form method="GET" action="/AtTicketProject/mypageinterestsearch.do" name="signup" id="signup">	
        <div id="search">
            <input type="text" name="index" value="${index}" style="display: none;">
            <input type="text" id="txtsearch" name="search" value="${search}">
            <button class="btn btn-default btn-sm" id="btnsearch">검색</button>
            <button class="btn btn-default btn-sm" type="button" style="width: 120px; height: 25px; padding-top: 2px;" onclick="location.href='/AtTicketProject/mypageinterestpopup.do'">AT's Pick 이동</button>
           <%--  <div id ="index">${index }</div> --%>
        </div>
        </form>
<%-- 		<c:if test="${index != 2 or index != 4}">
        <div id="title">AT's Pick</div>
        </c:if> --%>
        <c:if test="${list.size() == 0}">
        <div id="searchInfo"><b>[ ${search} ] </b>에 대한 검색 결과가 없습니다. AT's Pick으로 이동하시겠습니까?</div>
        </c:if>
        
        <div id="middle">
        <c:if test="${list.size() == 0}">
        <button class="btn btn-default" style="width: 80px; margin: 0px auto; position:relative; top:50px; display: block;" onclick="location.href='/AtTicketProject/mypageinterestpopup.do'">이동하기</button>
        </c:if>
        
       	<c:if test="${index == 2 or index == 4}">
       	<c:if test="${list.size() != 0}">
        <div id="searchInfo"><b>[ ${search} ] </b>에 대한 검색 결과가 총 <span style="font-style: italic;">" ${totalCount} "</span>건 있습니다.</div>
        </c:if>
        	<table id="tbl1">
        		<tr>
        		

        			<c:forEach items="${list}" var="dto" varStatus="status">
        			<td>
                        <div>
                        <img src="./images/${dto.showPoster}">
                        <input type="checkbox" class="check cbAdd" name="cbAdd" value="${dto.showseq}"><br>
                        <strong>${dto.showtitle }</strong>
                        <p>${dto.showstart } ~ ${dto.showend }<br>
                        	${dto.showTheater}</p>
                        </div> 
        			</td> 
        			<c:if test="${(status.index+1) % 2 == 0}">
	                				</tr>
	                				<tr>
	                </c:if>
        			</c:forEach>
        		<tr>
        	</table>
        	${pagebar}
        	</c:if>
        	
        	<c:if test="${index != 2 and index != 4}">
	            <div id="container"></div> 
	            <div id="list">
	            </div> 
            </c:if> 
        </div>
        <div id="footer">
            <button class="btn btn-default btn-xs" id="add" onclick="addMyShow()">관심공연 담기 +</button>
            <button class="btn btn-default btn-xs" id="close">닫기</button>
        </div>
    </div>
    
    <script type="text/javascript">
    
        
        //=======================================실시간 순위
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
			fn_realTimeBookRank(); //실시간예매순위 Tran
		});
		
		
        
		//실시간예매순위 Tran
 		function fn_realTimeBookRank(){
			var url = '/AtTicketProject/customer/realTimeBookRankOk.do';
			var method = 'GET';
			var s_Callback = fn_callback_realTimeBookRank;
			var e_Callback = fn_err_callback_realTimeBookRank;
			
			callAjax(url, method, '' , s_Callback, e_Callback);
		}

		
/*  		var options = {
 	            chart: {
 	                type: 'column',
 	                options3d: {
 	                    enabled: true,
 	                    alpha: 25,
 	                    beta: 15,
 	                    viewDistance: 70,
 	                    depth: 40
 	                }
 	            },

 	            title: {
 	                text: 'Top 5 Most-Viewd(M/F)'
 	            },

 	            xAxis: {
 	                //categories: ['1. 뮤지컬<br><어쩌면 해피엔딩>', '2. 연극 [라스트 세션]', '3. 뮤지컬<br><오페라의 유령>', '4. 뮤지컬<br>[미아 파밀리아]', '5. 팬타스틱<br>팬미팅 콘서트'],
 	                //categories: [$('label[id*="rank1"]').text() , '2. 연극 [라스트 세션]', '3. 뮤지컬<br><오페라의 유령>', '4. 뮤지컬<br>[미아 파밀리아]', '5. 팬타스틱<br>팬미팅 콘서트'],
 	                categories: [],
 	                
 	                labels: {
 	                    skew3d: true,
 	                    style: {
 	                        fontSize: '14px',
 	                        fontWeight: 'bold'
 	                    }
 	                }
 	            },

 	            yAxis: {
 	                allowDecimals: false,
 	                min: 0,
 	                title: {
 	                    text: 'Percentage',
 	                    skew3d: true
 	                }
 	            },

 	            tooltip: {
 	                headerFormat: '<b>{point.key}</b><br>',
 	                pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
 	            },

 	            plotOptions: {
 	                column: {
 	                    stacking: 'normal',
 	                    depth: 50
 	                }
 	            },

 	            series: [{
 	                name: '10th ~ 20th',
 	                data: [60, 30, 40, 40, 20],
 	                stack: 'male'
 	            }, {
 	                name: '30th ~ 40th',
 	                data: [40, 70, 60, 40, 0],
 	                stack: 'male'
 	            }, {
 	                name: '10th ~ 20th',
 	                data: [70, 20, 30, 30, 70],
 	                stack: 'female'
 	            }, {
 	                name: '30th ~ 40th',
 	                data: [30, 60, 70, 60, 10],
 	                stack: 'female'
 	            }]
 	        }; */
		
		//실시간예매순위 콜백
		function fn_callback_realTimeBookRank(response){

			var category = [];
			
			var i = 0;
			
			var temp = "";
           	
			
			temp += "<table id='tbl2'>"; 
			temp += "<tbody>"; 
			temp += "<tr>"; 
			temp += "<td id='title'>AT's Pick</td>"; 
			//alert("실시간예매순위 콜백");
				$(response).each(function (index, item){
					
	            	i++;
					
					temp += "<td>"; 
					temp += "<div class='list'>"; 
					//temp += "<input type='checkbox' class='checkbox cbAdd' name='cbAdd' id='"+ item.showseq +"' value='"+ item.showseq +"'>"; 
					temp += "<label id='rank"+ i +"' for='"+ item.showseq +"'><img src='./images/"+ item.poster +"'> <input type='checkbox'  class='checkbox cbAdd' name='cbAdd' id='"+ item.showseq +"' value='"+ item.showseq +"'> "+ i +". "+ item.genre +" ["+ item.title +"]</label>"; 
					temp += "<div class='list'>"; 
					temp += "</div>"; 
					temp += "</td>"; 
					if(i == 2){
						temp += "</tr><tr>"; 
					}
					
					//category.push(" "+ i +". "+ item.genre +" ["+ item.title +"]");
					
					
				});
			temp += "</tr>"; 
			temp += "</tbody>"; 
			temp += "</table>"; 
			
			$("#list").append(temp);
				
		/* 	options.xAxis.categories = category;
			Highcharts.chart('container', options); */
			
		}
		
		//실시간예매순위 에러콜백
		function fn_err_callback_realTimeBookRank(){
			alert("실시간예매순위 에러콜백");
		}
		
		//=========================================
			        //차트
        

     /*    Highcharts.chart('container', options); */
        
        //화면 닫기
        $("#close").click(function() {
            window.close();
        });
        
        //var index = ${index};
			
    	function addMyShow() {
    		
    		if($(".cbAdd:checked").length >0){
				if(${index == 3 or index == 4}){
					location.href = "/AtTicketProject/MyPagePersonallizeAdd.do?" + $(".cbAdd").serialize();
				} else {	   
    		 		location.href = "/AtTicketProject/MyPageMyShowAdd.do?" + $(".cbAdd").serialize();
				}
    		}else{
    			alert("추가할 문의내역를 선택하세요.");
    		}
    	};

    </script>

</body>
</html>