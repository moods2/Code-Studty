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
            margin-left: 390px; 
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
        <legend style="width: 300px; margin:20px -1px; font-weight: bold;">Egg포인트 적립내역 추가</legend>
            <div id="box1" style="width: 600px;">
                <table class="table table-bordered" style="width: 450px">
                    <tr>
                        <th style="width: 140px; vertical-align: middle;">공연명(예매번호)</th>
                        <td style="width: 300px;">
                            <input id="row1" type="text" style="width: 150px;" type="text" class="form-control">
                        </td>
        
                    </tr>
                    <tr>
                        <th style="vertical-align: middle;">적립일</th>
                        <td>
                            <input id="row2" style="width: 200px;" type="text" class="form-control" class="line">
                          
                        </td>
                    </tr>
        
                    <tr>
                        <th style="vertical-align: middle;">Egg포인트</th>
                        <td>
                            <input id="row3" class="form-control" style="width: 100px;"></input>
                        </td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle;">적립상태</th>
                        <td>
                        <input id="row4" style="width: 100px;" type="text" class="form-control">
                        </td>
                    </tr>
        
                    <tr>
                        <th style="vertical-align: middle;">적립유형</th>
                        <td>
                            <input id="row5" style="width: 100px;" type="text" class="form-control">
                        </td>
                    </tr>
                </table>
        </div>
            <div id = "manipulate">
                <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-plus"></i>추가</button>
              
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
                if(confirm("정말로 추가하시겠습니까?")){
                    location.href = "adminCustomer.html";
                }
            });
        </script>
</body>
</html>