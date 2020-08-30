<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
 <style>
        #b {
            margin-top: 30px;
            margin-left: 50px;
        }

        #box {
            margin-left: 30px;
            font-size: 15px;
        }

        #box .line{
            margin-bottom: 10px;
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
</head>
<body>
	
    <legend style="width: 200px; margin:20px 25px; font-weight: bold;">매출관리 수정</legend>
    <div id="box">
        <div> 
            <div class = "line"><span style="font-weight: bold;" >순이익 &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="txt1" id="txt1"></div>
            <div class = "line"><span style="font-weight: bold;" >총매출액 : <input type="text" name="txt2" id="txt2"></div>
            <div class = "line"><span style="font-weight: bold;">비용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="txt3" id="txt3"></div>
        </div>
    </div>
    <div id="b" style="margin-left: 195px;">
        <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
        <button class = "modified" id = "closebtn">닫기</button>
    </div>
    <script>
        $("#closebtn").click(function(){
            window.close();
        });
    </script>
</body>
</html>