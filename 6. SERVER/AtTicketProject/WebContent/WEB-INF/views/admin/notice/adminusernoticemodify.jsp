<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/AtTicketProject/css/adminbanner.css">
<meta charset="UTF-8">
<title>Admin</title>

<style>
	    /* 최상단 타이틀 */
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }
               #right {
            border : 1px solid red;
            margin-left: 300px;
            margin-top: 100px;
            width : 700px;
            /* color : white;
            background-color: #C27BA0; */
        }
        #visitTitle {
            margin : 15px auto;
            border : 5px solid #444444;
            color : #C27BA0;
            text-align: center;
            width : 120px;
            font-size: 2em;
        }
        #right2 {
            border : 1px solid black;
            /* text-align: center; */

        }
        /* 최상단 타이틀 */
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        
        #selectable {
            width : 1330px;
            margin-left : 350px;
            height : 600px;
            margin-top : 20px;
        }

        .selectNotice {
            width : 100px;
            text-align: center;
            margin: 10px 0px;
            margin-bottom: 0px;
            background-color: white;
            border : 0px;
            border-radius: 5px;
            color : #999;
            font-size: 1.3em;
            height : 40px;
        }

        .selectNotice:hover {
            color : black;
        }
        #nttable {
            margin-left : 0px;
        }
        #nttable th {
            background-color:  #999;
            text-align: center;
        }
        #nttable td {
            text-align: center;
        }

        #nttable td:nth-child(3) {
            padding-left : 20px;
            text-align: left;
        }
        
        #nttable td:nth-child(1) {
            text-align: left;
        }        

        #nttable th:nth-child(1) {width : 40px;}
        #nttable th:nth-child(2) {width : 130px;}
        #nttable th:nth-child(3) {width : 775px;}
        #nttable th:nth-child(4) {width : 300px;}


        #nttable tbody td {
            font-size: 1.2em;
        }

        #nttable > tbody > tr > td:nth-child(3):hover {
            cursor : pointer;
            text-decoration: underline;
        }

        .pagebar {
            margin-left : 400px;
        }

       #slctp1, #slctp2 {
            float : left;
        }
        #slctp1 {
            margin-left: -13px;
        }
        #slctp2 {
            margin-top : 10px;
            margin : 10px auto;
            margin-bottom: 10px;
            width : 300px;
            margin-left: 736px;
        }

        #searchlogo:hover {
            cursor: pointer;
        }
        #topSelect div {
            float : left;
        }
        .inputInfo {
            /* border : 1px solid #D2D2D2; */
            height : 250px;
            width : 1330px;
            margin-left : 350px;
            margin-top : 0px;
            margin-bottom : 10px;
        }
        .inputTitle {
            /* border : 1px solid blue; */
            width : 1330px;
            margin-left : 350px;
            height : 40px;
            margin-bottom: 0px;
            font-size: 1.5em;
            font-weight: inherit;
        }
        .inputInfo table {
            /* border: 1px solid black; */
            border-collapse: collapse;
            margin: 20px;
            width : 1290px;
            height : 200px;
        }
        .inputInfo table td{
            border: 2px solid #D2D2D2;
            /* width : 200px; */
        }
        .inputInfo table input{
            /* background-color: red; */
            margin-left : 10px;
        }
        .inputInfo table select {
            margin-left : 10px;
        }
        .title {
            /* 제목 영역 */
            width : 150px;
            background-color: #F0F0F0;
            /* text-align: end; */
        }
        /* 표 안에 들어가는 캘린더 조정 */
        .inputCalendar {
            /* border : 1px solid green; */
            margin-bottom : 20px;
        }
        .calIng {
            /* border : 1px solid red; */
            position : relative;
            left : 10px;
            top : 10px;
        }
        .calIng:hover {
            cursor: pointer;
        }
        .consted {

            margin-bottom : 20px;
        }
        .inputBox {
            height : 30px;
        }     

        /*체크박스 제어  */
        #nttable .tdbox {
            padding-left : 15px;
        } 


        /* 페이지 하단바  색 조정 */
        .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
               background-color:#999999;
           border-color: #eeeeee;
        }
        
        .pagination > li > a, .pagination > li > span{
          color: black;
        }
        
 		 #contentphoto{
 		 
        	background-image: url('/AtTicketProject/images/${dto.content}');
        	text-align:center;
        	background-repeat:no-repeat;
        	width:100%;
        	height:100%;
        	background-size: contain;
        
        }
        
 		

</style>

</head>
<body>

    <!-- 여기에 내용 삽입 -->
    <div id = "title">
        <h1 id = "realTitle">공지사항 <small id = "mainHome"> > 공지수정  </small></h1>
    </div>

	
    <form method = "POST" id = "createForm" action="/AtTicketProject/usernotice/adminusernoticemodifyok.do?noticeseq=${noticeseq}&page=${page}&search=${search}&sort=${sort}" enctype = "multipart/form-data">
    <div class = "inputTitle">
    </div>
    <div class = "inputInfo" style = "height : 1000px;">
        <table  style = "height : 800px;">
            <tr>
                <td colspan="2"><div id = "contentphoto"></div></td>
            </tr>  
            <tr style = "height : 70px;">
                <td class = title>&nbsp;&nbsp;파일첨부</td>
                <td><input style="float:left" type="file" id = "fileinputer" name = "content"><span style="margin-left:-80px;">원본 파일 이름 : </span><input style="width:200px;display:inline;" type = "text" class = "form-control" value = "${dto.content}" disabled></td>
                
            </tr>       
            <tr  style = "height : 70px;">
            	<td class = "title">&nbsp;&nbsp;구분</td>
            	<td><select style="width:150px" name = "nindex" class = "form-control">
            				<c:forEach items = "${list}" var = "nindex">
        						<option value = "${nindex}" class = "data">${nindex}</option>
        					</c:forEach>
            		</select>
            	</td>
            </tr> 
             <tr  style = "height : 70px;">
            	<td class = "title">&nbsp;&nbsp;제목</td>
            	<td>
            		<input style="width:500px;" name = "title" type = "text" class = "form-control" value = "${dto.title}">
            	</td>
            </tr>  
             <tr  style = "height : 70px;">
            	<td class = "title">&nbsp;&nbsp;티켓오픈일시</td>
            	<td>
            		<input style="width:200px;" name = "opendate" type = "date" class = "form-control" value = "${dto.opendate}">
            	</td>
            </tr>   
            </table>
    </div> 
   	<div style = "margin-left : 950px; margin-top:-150px;">
        <input id = "confirmation" type="submit" value = "수정" style = "width : 120px; margin-left:100px; margin-top:-30px; height : 40px; font-size: 1.3em; font-weight: bold;">
    </div>
    
	</form>
   
	
	<%@include file="/WEB-INF/views/inc/menu.jsp" %><!-- 왼쪽메뉴 -->
	
	
	<script>
	
		<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
	    var date = document.getElementById("date");
	    var now = new Date();
	    var sw = document.images["sw"];
	

	    //날짜 자동 입력, 읽기만 가능 
	    date.value = now.getFullYear() + " / " + (now.getMonth()+1) + " / " + now.getDate();
	    if (date.value != null) {
	        date.readOnly = true;
	    }

	    // 캘린더
	        $("#date").datepicker({
	            dateFormat: "yy-mm-dd",
	            minDate: now.getFullYear() + "-1-1",
	            maxDate: now.getFullYear() + "-12-" + "31"
	        });

		
	    // 등록
	    // confirmation
	    $("#confirmation").click(function(){
	        if(confirm("해당 공지를 수정하시겠습니까?")) {
	            /* location.href = "/AtTicketProject/usernotice/adminusernoticemodifyok.do"; */
	        }
	    });
		
	</script>
	
	
	
</body>
</html>