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
                <td style="text-align: center;">삭제</td>                
            </tr>
            <tr>
            	<td style="text-align: center;">
                 <button type="button" class="btn btn-default" onclick="location.href='/AtTicketProject/adminnoticecontent.do?seq=${seq}';">
                                <span class="glyphicon glyphicon-chevron-left"></span>
								뒤로
                 </button>
                 <button type="button" class="btn btn-default" onclick="location.href='/AtTicketProject/adminnoticedeleteok.do?seq=${seq}';">
                        <span class="glyphicon glyphicon-remove"></span>
								삭제
                 </button>
                 </td>              
            </tr>
            
        </table>
        



        
        
    </div>




</body>
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
</script>

</html>