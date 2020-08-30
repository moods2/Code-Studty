<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
     #b {
            margin-top: 30px;
            margin-left: 50px;
        }

        .btn {
            width: 100px;
        }

        #sel {
           margin:40px;
        }

        #add {
        width: 430px;
        height: 250px;
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
	  <legend style="width: 200px; margin:20px 40px; font-weight: bold;">랭킹 수정</legend>
    <div id = "sel">
        <div><label for="txtname">수정할 필드 순위: </label>  <!--<select name="sel1" size="1" style="height: 25px;"> -->
            <!-- <option value="id">순위</option> -->
        </select>
        <input style="position: relative; top: -2px;" type="text" name="txt" id="txt" autofocus>
    </div>

    <div id="b" style="margin-left: 186px;">
        <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
        <button class="modified" id="closebtn">닫기</button>
    </div>

    <script>
          $("#modifybtn").click(function () {
            if (confirm("수정하시겠습니까?")) {
            }
        });

        $("#closebtn").click(function () {
            window.close();
        });

    </script>
</body>
</html>