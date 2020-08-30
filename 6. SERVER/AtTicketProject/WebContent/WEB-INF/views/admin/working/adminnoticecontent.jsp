<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  	 <link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">

    <style>
       #right {
            /* border : 1px solid red; */
            position: relative;
            margin-left: 500px;
            margin-top: 30px;
            width : 1000px;
        }
        #visitTitle {
            margin : 15px auto;
            border : 5px solid #C27BA0;
            color : #C27BA0;
            text-align: center;
            width : 120px;
            font-size: 2em;
        }

        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }
        #btnadd {
            position: relative;
            top: -35px;
            left: 250px;
        }

        #tbl th {
            position: relative;
            text-align: center;
        }

        
        
    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminWorking</title>
</head>

<body>

    <div id = "title">
        <h1 style="color:#555">업무 현황</h1>
    </div>

    <%@include file="/WEB-INF/views/inc/menu.jsp" %>
    
    <div id = "right">

        <table id="tbl" class="table table-bordered" style="width: 600px;">
            <tr>
                <th style="width: 150px;">개발부</th>
                <td style="width: 450px;">${dto.title}</td>
            </tr>
            <tr>
                <th style="width: 150px;">작성자</th>
                <td style="width: 450px;">${dto.name}</td>
            </tr>
            <tr>
                <th style="width: 150px;">내용</th>
                <td style="width: 450px;"><pre style="background-color: white; border: 0px;">${dto.content}</pre></td>
            </tr>
        </table>
        <hr>



        <!-- <hr> -->
        <input type="button" class="btn btn-default" value="목록" onclick="location.href='/AtTicketProject/adminworking.do'"
                style="margin-left: 350px; margin-top: 10px; box-shadow: none; outline: none;" >
        <input type="button" class="btn btn-default" value="수정" onclick="location.href='/AtTicketProject/adminnoticemodify.do?seq=${dto.seq}';"
        style="margin-top: 10px; box-shadow: none; outline: none;" >
        <input type="button" class="btn btn-default" value="삭제" onclick="location.href='/AtTicketProject/adminnoticedelete.do?seq=${dto.seq}';"
        style="margin-top: 10px; box-shadow: none; outline: none;" >
        
    </div>




</body>
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
</script>

</html>