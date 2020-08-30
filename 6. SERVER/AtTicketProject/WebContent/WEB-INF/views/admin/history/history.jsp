<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_history</title>
    
<style>
body {
	font-family: 'NanumBarunGothic';
}

#title {
	/* text-align: center; */
	margin-left: 280px;
	margin-top: 50px;
	width: 1500px;
	border-bottom: 1px dashed black;
}

#content {
	/* border: 1px solid red; */
	width: 80%;
	height: 1880px;
	position: absolute;
	left: 250px;
	top: 120px;
}
.history, .txtHistory {
	border: 1px solid rgb(221, 221, 221);
	border-radius: 3px;
	resize: none;
	padding: 0px 20px 20px;
	margin-left: 20px;
}

.history h3 {
	border-bottom: 1px dashed #CCCCCC;
	padding-bottom: 5px;
}

.txtHistory {
	display: none;
	padding-top: 20px;
	border: 2px dashed rgb(221, 221, 221);
}
</style>

</head>
<body>
	<div id="title">
		<h1 style="color: #555">
			작업 히스토리
		</h1>
	</div>
	<%@include file="/WEB-INF/views/inc/menu.jsp"%>

	<div class="container" id="content">
		<div>

			<div class="history">${dto.content}</div>

			<form id="formHistory" method="POST"
				action="/AtTicketProject/historyok.do">
				<textarea class="txtHistory" name="content"	></textarea>
				
				<c:if test="${flag == 0}">
				<input type="hidden" name="empty" value="${flag}">
				</c:if>
			</form>

		</div>


	</div>


	<script>
		
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
		
	var txt, lines;
	
    function showHistory() {
        txt = $(".history").text().trim();
        $(".history").text("");

        //라인 분리
        lines = txt.split("\n");
        
        lines.forEach(function(item) {

            item = item.trim();

            //버전 찾기
            if (item.startsWith("v")) {
                $(".history").append("<h3>" + item + "</h3>");  
            }

            if (item.startsWith("-")) {
                $(".history").append("<div>" + item + "</div>");  
            }
        });
    } 

    showHistory();

    function syncSize() {
        $(".txtHistory").width($(".history").width());
        $(".txtHistory").height($(".history").height());
    }

    //크기 동기화
    $(window).resize(function() {
        syncSize();
    });
    


    //전환
    $(".history").dblclick(function() {
        syncSize();
        $(".txtHistory").val(txt);
        $(".history").hide();
        $(".txtHistory").show();
    });

    $(".txtHistory").keyup(function() {
        if (event.ctrlKey && event.keyCode == 13) {
            syncSize();
            $(".history").text($(".txtHistory").val());
            showHistory();
            $(".history").show();
            $(".txtHistory").hide();
            
            //편집 내용 -> 서버로 전송
            $("#formHistory").submit();
            
        }
        event.cancelBubble = true;
    });
	</script>
</body>
</html>