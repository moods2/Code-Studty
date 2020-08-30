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
            text-align: center;
        }
        
        
        
    </style>

    <script type="text/javascript" src="../smarteditor2-master/workspace/static/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminWorking</title>
</head>

<body>

    <div id = "title">
        <h1 style="color:#555">업무 현황 <small> > 글쓰기</small></h1>
    </div>

    <%@include file="/WEB-INF/views/inc/menu.jsp" %>
    
    <div id = "right">
	<form method="POST" action = "/AtTicketProject/adminnoticeeditok.do">
        <table id="tbl" class="table table-bordered" style="width: 600px;">
            <!-- <tr>
                <th style="width: 150px;">부서</th>
                <td style="width: 450px;">
                    <select class="form-control">
                        <option>개발부</option>
                        <option>영업부</option>
                        <option>마케팅부</option>
                        <option>인사부</option>
                        <option>디자인부</option>
                        <option>총무부</option>
                    </select>
                </td>
            </tr> -->
            <tr>
                <th style="width: 150px">제목</th>
                <td style="width: 450px;">
                    <!-- block태그로 바뀜 -->
                    <input name = "title" type="text" class="form-control"> 
                </td>
            </tr>
            <tr>
                <th style="width: 150px;">내용</th>
                <td style="width: 450px;">
                    <textarea name = "content" class="form-control" style="height: 300px; resize: none;"></textarea>
                </td>
            </tr>
            <tr>
                <th style="width: 150px; " >파일</th>
                <td style="width: 450px;">
                    <input name ="file" type="file" class="form-control" style = "padding-bottom: 30px;">
                </td>
            </tr>
        </table>
		
		<input type="button" class="btn btn-default" value="뒤로" onclick="location.href='/AtTicketProject/adminworking.do'"
                style="margin-left: 300px; box-shadow: none; outline: none;">
	
        <input type="submit" class="btn btn-default" value="글쓰기"
                style="box-shadow: none; outline: none;">
                
         </form>


        
    </div>




</body>
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
</script>

</html>