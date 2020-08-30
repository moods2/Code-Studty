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

</style>


</head>
<body>

	<div id = "title">
        <h1 id = "realTitle">공지사항 <small id = "mainHome"> > 공지등록  </small></h1>
    </div>
	
	
	<!-- -----------------------------게시판 양식 시작------------------------------- -->
 	<style>
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
            font-size: 1em;
        }

        #nttable > tbody > tr > td:nth-child(2):hover {
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
 		
 		
 		.img_wrap {
 			border:0px;
 		}
 		
 	</style>
 	
 	
    <!-- -----------------------------게시판 양식 끝------------------------------- --> 
	
	
	<!-- -----------------------------뮤지컬 정보 공지등록 시작------------------------------- --> 
	
	<form method = "POST" id = "createForm" action="/AtTicketProject/usernotice/adminusernoticecreateok.do?page=${page}&search=${search}&sort=${sort}" enctype = "multipart/form-data">
    <div class = "inputTitle">
    </div>
    <div class = "inputInfo" style = "height : 1000px;">
        <table  style = "height : 800px;">
            <tr>
                <td colspan="2"><!-- <iframe src="" frameborder="0" style = "width : 1300px; height : 720px;" id = "picframe"></iframe> -->
                	<div class="img_wrap"><img id="img1" /></div>
            	</td>
            </tr>  
            <tr style = "height : 70px;">
                <td class = title>&nbsp;&nbsp;파일첨부</td>
                <!-- <td><input type="file" id = "fileinputer" name = "content"></td>
             	<td><label for="txtphoto">파일첨부 </label></td> -->
             	<td><input type="file" id="txtphoto" style="display: inline;"></td>
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
            		<input style="width:500px;" name = "title" type = "text" class = "form-control">
            	</td>
            </tr>  
             <tr  style = "height : 70px;">
            	<td class = "title">&nbsp;&nbsp;티켓오픈일시</td>
            	<td>
            		<input style="width:200px;" name = "opendate" type = "date" class = "form-control">
            	</td>
            </tr>   
            </table>
    </div> 
    <div style = "margin-left : 100px; margin-top:0px;">
        <input id = "confirmation" type="submit" value = "작성" style = "width : 120px; height : 40px; font-size: 1.3em; font-weight: bold;">
    </div>
    
	</form>
   <script>
   
   var sel_file;

   $(document).ready(function() {
       $("#txtphoto").on("change", handleImgFileSelect1);
   }); 

   function handleImgFileSelect1(e) {
       var files = e.target.files;
       var filesArr = Array.prototype.slice.call(files);

       filesArr.forEach(function(f) {
           if(!f.type.match("image.*")) {
               alert("확장자는 이미지 확장자만 가능합니다.");
               return;
           }

           sel_file = f;

           var reader = new FileReader();
           reader.onload = function(e) {
               $("#img1").attr("src", e.target.result);
               $("#img1").attr("width","1500px");
               $("#img1").attr("height","500px");
           }
           reader.readAsDataURL(f);
           
       });
   }

        //파일선택을 하면  현재화면상태에 변화를 준다 -> 서버 구현할떄 바뀌어야 하는 코드이다.
   
        /* $("#fileinputer").click(function(){
              $("#picframe").attr("src","/")
        }); */
    </script>

	<!-------------------------------뮤지컬 정보 공지등록 끝---------------------------------> 

	<%@include file="/WEB-INF/views/inc/menu.jsp" %>



	
	<script>
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
		
		
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
	
</script>

</body>
</html>