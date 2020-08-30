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
        <legend style="width: 300px; margin:20px -1px; font-weight: bold;">Egg포인트 적립내역 수정</legend>
            <form method="POST" action="/AtTicketProject/customer/cuspointupdateok.do">
            <div id="box1" style="width: 600px;">
                <table class="table table-bordered" style="width: 450px">
                    <tr>
                        <th style="width: 140px; vertical-align: middle;">공연명(예매번호)</th>
                        <td style="width: 300px;">
                            <input id="row1" name = "showtitle" type="text" style="width: 200px;" type="text" class="form-control" required value = "${dto.showtitle}" disabled>
                        </td>
        
                    </tr>
                    <tr>
                        <th style="vertical-align: middle;">적립일</th>
                        <td>
                            <input id="row2" name = "pointdate" style="width: 100px;" type="text" class="form-control" class="line" required value = "${dto.pointdate}" disabled>
                          
                        </td>
                    </tr>
        
                    <tr>
                        <th style="vertical-align: middle;">Egg포인트</th>
                        <td>
                            <input id="row3" name = "egg" class="form-control" style="width: 100px;" required value = "${dto.egg}"></input>
                        </td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle;">적립상태</th>
                        <td>
                        <input id="row4" name = "valid" style="width: 100px;" type="text" class="form-control" required value = "${dto.valid}" disabled>
                        </td>
                    </tr>
        
                    <tr>
                        <th style="vertical-align: middle;">적립유형</th>
                        <td>
                            <input id="row5" name = "type" style="width: 100px;" type="text" class="form-control" required value = "${dto.type}">
                        </td>
                    </tr>
                    <input type = "hidden" name = "bookseq" value = "${bookseq}">
                    <input type = "hidden" name = "cusseq" value = "${cusseq}">
                </table>
        	</div>
            <div id = "manipulate">
                <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
              
            </div>
			</form>
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