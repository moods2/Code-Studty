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
        html {
            width : 600px;
            height :1000px;
            /* border : 1px solid black; */
        }
        /* 배너사진 선택하기 */
        #title {
            /* border: 1px solid red; */
            margin : 10px;
            /* margin : 10px; */
            font-weight: bold;
            font-size: 1.7em;
        }
        /* 스플릿 라인 */
        .splitLine {
            border : 1px solid #F0F0F0;
            margin : 0px;   
        }
        /* 파일선택 */
        #fileSelect {
            margin : 10px;
            margin-left : 30px;
        }
        /* 내가 선택한 그림파일 가져오기 */
        #imgShow {
            background-image: url("../images/classic15.jpeg");
            width : 300px;
            height : 420px;
            background-repeat: no-repeat;
            background-size: cover;
            margin : 20px;
            margin-left : 110px;
            border: 2px solid #F0F0F0;
            visibility: hidden;
        }
        /* 그림뒤에 배경 */
        #imgback {
            background-color: #F0F0F0;
            /* width : 320px; */
            margin : 30px;
            height : 460px;
            /* padding : 10px; */
            /* padding-bottom : 30px; */
            padding-top: 1px;
        }
        /* 내용물 쓰기 -> 포함하는 div*/
        #writeCont {
            margin : 10px;
            margin-left : 27px;
        }
        #btns {
            margin-left : 200px;
        }

        /* 적용하기 삭제하기 버튼 */
        .bottombtn {
            border : 1px solid #F0F0F0;
            width : 100px;
            height : 50px;
            font-size:1.2em;
        }
        .bottombtn:hover {
            background-color: #DDDDDD;
        }

        #inputtitle {
            font-size: 1.2em;
            margin-left : 20px;
        }
        
         .inputInfo {
         
            height : 250px;
            width : 1330px;
            margin-left : 350px;
            margin-top : 0px;
            margin-bottom : 10px;
        }
        
        .inputTitle {
           
            width : 1330px;
            margin-left : 350px;
            height : 40px;
            margin-bottom: 0px;
            font-size: 1.5em;
            font-weight: inherit;
        }
        .inputInfo table {
           
            border-collapse: collapse;
            margin: 20px;
            width : 1290px;
            height : 200px;
        }
        .inputInfo table td{
            border: 2px solid #D2D2D2;
            
        }
        .inputInfo table input{
           
            margin-left : 10px;
        }
        .inputInfo table select {
            margin-left : 10px;
        }
        .title {
            
            width : 150px;
            background-color: #F0F0F0;
           
        }
       
        .inputCalendar {
          
            margin-bottom : 20px;
        }
        .calIng {
           
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
        
	 
    </style>


</head>
<body>

	

    <div id = "title">배너 사진 선택하기</div>
    <hr class = "splitLine">
    <br>
    <div><input type="file" id = "fileSelect" style></div>
    <div id = "imgback">
        <div id = "imgShow"></div>
    </div>
    <div id = "inputtitle">내용기입</div>
    <div id = "writeCont"><textarea name="" id="" cols="74" rows="10" style = "resize : none; border : 3px solid #DDDDDD;"></textarea></div>
    <div id = "btns">
        <input type="button" class = "bottombtn" value = "적용하기" id = "applybtn">
        <input type="button" class = "bottombtn" value = "삭제하기" id = "delbtn">
    </div>
    
    <script>

        // 파일이 선택될때 -> 파일을 띄워준다.
        var timer1 = 0;
        $("#fileSelect").click(function(){
            timer = setTimeout(function(){
                $("#imgShow").css("visibility","visible");
            },2000);
        });

        //적용하기 버튼 누르기
        $("#applybtn").click(function(){
            if(confirm("적용하시겠습니까?")) {
                alert("적용완료");
                window.close();
            }
        });

        // 삭제하기 버튼 누르기 
        $("#delbtn").click(function(){
            if(confirm("삭제하시겠습니까?")) {
                alert("삭제완료");
                window.close();

            }
        });



    </script>	
	
	
	

<script>

	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
	
</script>

</body>
</html>