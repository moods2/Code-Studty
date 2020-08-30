<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
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
        <legend style="width: 200px; margin:20px -1px; font-weight: bold;">최근 예매 추가</legend>
        <div id="box1" style="width: 850px;">
        <form method = "POST" action = "/AtTicketProject/customer/cusbookinsertok.do">
            <table class="table table-bordered" style="width: 600px">
                <tr>
                    <th style="width: 100px; vertical-align: middle;">예매일</th>
                    <td style="width: 500px;">
                        <input id="row1" name = "bookdate" type="date" style="width: 160px;" type="text" class="form-control">
                    </td>
    
                </tr>
                <tr>
                    <th style="vertical-align: middle;">회차</th>
                    <td>
                    <c:if test = "${list.size()!=0}">
                    	<select style="width:200px;" id = "showtitle" name = "showtitle" class = "form-control">
                    		<optgroup label="회차">
                    		   <c:forEach items="${list}" var="dto">
                    			<option name = "op" id = "op" value="${dto.roundseq}">${dto.showtitle} (${dto.startdate} ~ ${dto.enddate})</option>
                    			</c:forEach>
                    		</optgroup>
                    	</select>
                       <!--  <input id="row3" name = "showtitle" class="form-control" style="width: 500px;"></input> -->
                      </c:if>
                    </td>
                </tr>
               
                <tr>
                    <th style="vertical-align: middle;">예매상태</th>
                    <td>
                    <input id="row2" name = "showstate" style="width: 160px;" type="text" class="form-control">
                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">매수</th>
                    <td>
                    <input id="row3" name = "cnt" style="width: 160px;" type="text" class="form-control">
                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">관람일시</th>
                    <td>
                    <input id="row4" name = "bdate" style="width: 160px;" type="date" class="form-control">
                    </td>
                </tr>
                
            </table>
            </form>
            <div id = "manipulate">
                <button class = "modified" onclick="location.href='/AtTicketProject/customer/cusbookinsertok.do'" id = "modifybtn"><i class="glyphicon glyphicon-plus"></i>추가</button>
              
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
           /*  location.href = "adminCustomer.html"; */
        }
    });

	</script>
</body>
</html>