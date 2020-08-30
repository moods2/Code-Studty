<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
	td {
            text-align: center;
        }

        th {
            background-color:  #999;
            /* color : white; */
        }

        .modified {
            border : 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 35px;
            font-weight: bold;
            margin-left: 545px; 
            width: 60px;
        }
        .modified:hover {
            color : white;
            /* background-color: #333; */

        }

</style>
</head>
<body>
	
    <div id="info" style="margin-left: 50px;">
        <legend style="width: 200px; margin:20px -1px; font-weight: bold;">최근 예매 수정</legend>
        <div id="box1" style="width: 850px;">
            <table class="table table-bordered" style="width: 600px">
                <tr>
                    <th style="width: 100px; vertical-align: middle;">예매일</th>
                    <td style="width: 500px;">
                        <input id="row1" type="date" style="width: 160px;" type="text" class="form-control">
                    </td>
    
                </tr>
                <tr>
                    <th style="vertical-align: middle; ">예매번호</th>
                    <td>
                        <input id="row2" style="width: 200px;" type="text" class="form-control" class="line">
                      
                    </td>
                </tr>
    
                <tr>
                    <th style="vertical-align: middle;">공연명</th>
                    <td>
                        <input id="row3" class="form-control" style="width: 500px;"></input>
                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">관람일시</th>
                    <td>
                    <input id="row4" style="width: 160px;" type="date" class="form-control">
                    </td>
                </tr>
    
                <tr>
                    <th style="vertical-align: middle;">예매상태</th>
                    <td>
                        <input id="row5" style="width: 100px;" type="text" class="form-control">
                    </td>
                   
                </tr>
            </table>
            <div id = "manipulate">
                <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
              
            </div>

    <script>
        
    $("#row1").keyup(function () {
        if (event.keyCode == 13) {
            $("#row2").focus();
        }
    });

    $("#row2").keyup(function () {
        if (event.keyCode == 13) {
            $("#row3").focus();
        }
    });

    $("#row3").keyup(function () {
        if (event.keyCode == 13) {
            $("#row4").focus();
        }
    });

    $("#row4").keyup(function () {
        if (event.keyCode == 13) {
            $("#row5").focus();
        }
    });

  
    $("#row5").keyup(function () {
        if (event.keyCode == 13) {
            $("#modifybtn").click();
        }
    });

    //추가
    $("#modifybtn").click(function () {
        if(confirm("정말로 수정하시겠습니까?")){
            location.href = "adminCustomer.html";
        }
    });

    </script>
</body>
</html>