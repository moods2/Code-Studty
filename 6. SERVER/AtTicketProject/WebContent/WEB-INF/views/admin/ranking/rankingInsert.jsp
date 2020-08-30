<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
.txt {
        margin-bottom: 10px;
        margin-left: 30px;
    }

    #box {
        width: 500px;
        margin: 40px 60px;
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
	
    <legend style="width: 200px; margin:20px 40px; font-weight: bold;">랭킹 추가</legend>
    <div id="box">
        <div class = "txt"><input style="width: 200px; height: 30px;" type="text" placeholder="공연 제목..." class = "text-warning bg-warning"></div>
        <div class = "txt"><input style="width: 200px; height: 30px;" type="text" placeholder="장르..." class = "text-warning bg-warning"></div>
        <div class = "txt"><input style="width: 200px; height: 30px;" type="text" placeholder="예매율..." class = "text-warning bg-warning"></div>
        <div class = "txt"><input style="width: 200px; height: 30px;" type="text" placeholder="별점..." class = "text-warning bg-warning"></div>
        <div class = "txt"><input style="width: 200px; height: 30px;" type="text" placeholder="순위..." class = "text-warning bg-warning"></div>
        <div style="margin-left:125px;" id = "manipulate">
                <button class="modified" id="makebtn"><i class="glyphicon glyphicon-plus"></i>추가</button>
                <button class="modified" id="closebtn">닫기</button>
        </div>
    </div>
    <script>
        $("#closebtn").click(function(){
            window.close();
        });
     </script>
</body>
</html>