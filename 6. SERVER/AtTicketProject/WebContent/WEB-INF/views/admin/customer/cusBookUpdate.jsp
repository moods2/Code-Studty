<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            margin-left: 290px; 
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
       	 <form method = "POST" action = "/AtTicketProject/customer/cusbookupdateok.do">
            <table class="table table-bordered" style="width: 600px">
                <tr>
                    <th style="width: 100px; vertical-align: middle;">예매일</th>
                    <td style="width: 500px;">
                        <input name = "bookdate" id="row1" type="date" style="width: 160px;" type="text" class="form-control" required value = "${dto.bookdate}">
                    </td>
    
                </tr>
                <tr>
                    <th style="vertical-align: middle;">예매번호</th>
                    <td>
                        <input name = "bookseq" id="row2" style="width: 200px;" type="text" class="form-control" class="line" required value = "${dto.bookseq}" disabled>
                      	<input type = "hidden" name = "bookseq" value = "${dto.bookseq}">
                    </td>
                </tr>
    
                <tr>
                    <%-- <th style="vertical-align: middle;">공연명</th>
                    <td>
                        <c:if test = "${list.size()!=0}">
                    	<select style="width:200px;" id = "showtitle" name = "showtitle" class = "form-control row3">
                    		<optgroup label="공연제목">
                    		   <c:forEach items="${list}" var="dto">
                    			<option name = "showtitle" id = "showtitle" required value="${dto.showtitle}">${dto.showtitle}</option>
                    			</c:forEach>
                    		</optgroup>
                    	</select>
                       <!--  <input id="row3" name = "showtitle" class="form-control" style="width: 500px;"></input> -->
                      </c:if>
                    </td> --%>
                    <th style="vertical-align: middle;">회차</th>
                    <td>
                    <c:if test = "${list.size()!=0}">
                    	<select style="width:200px;" id = "showtitle" name = "showtitle" class = "form-control">
                    		<optgroup label="회차">
                    		   <c:forEach items="${list}" var="dto">
                    			<option id = "op" value="${dto.roundseq}">${dto.showtitle} (${dto.startdate} ~ ${dto.enddate}) ${dto.addr} ${dto.theatername}</option>
                    			</c:forEach>
                    		</optgroup>
                    	</select>
                       <!--  <input id="row3" name = "showtitle" class="form-control" style="width: 500px;"></input> -->
                      </c:if>
                    </td>
                    
                </tr>
                <tr>
                    <th style="vertical-align: middle;">관람일시</th>
                    <td>
                    <input name = "bdate" id="row4" style="width: 160px;" type="date" class="form-control" required value = "${dto.bdate}">
                    </td>
                </tr>
    
                <tr>
                    <th style="vertical-align: middle;">예매상태</th>
                    <td>
                        <input name = "bookstate" id="row5" style="width: 100px;" type="text" class="form-control" required value = "${dto.bookstate}">
                    </td>
                   
                </tr>
            </table>
            <div id = "manipulate">
                <button type = "submit" class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
            </div>
			<input type = "hidden" value = "${dto.cusseq}" name = "cusseq">
			
            </form>
            </div>
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
           /*  location.href = "/AtTicketProject/customer/cusbookupdateok.do"; */ 
        }
    });

    </script>
</body>
</html>