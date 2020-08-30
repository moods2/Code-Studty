<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		background-color: #999;
		/* color : white; */
	}
	
	.modified {
		border: 0px;
		border-radius: 5px;
		background-color: #999;
		outline: none;
		font-weight: border;
		color: rgb(220, 220, 220);
		height: 35px;
		font-weight: bold;
		margin-left: 410px;
		width: 60px;
	}
	
	.modified:hover {
		color: white;
		/* background-color: #333; */
	}
</style>
</head>
<body>

	<div id="info" style="margin-left: 50px;">
		<legend style="width: 300px; margin: 20px -1px; font-weight: bold;">관심공연
			수정</legend>
		<div id="box1" style="width: 1000px;">
			<table class="table table-bordered" style="width: 470px">
				<tr>
                    <th style="width: 70px; vertical-align: middle;">공연명</th>
                   <!--  <td style="width: 400px;">
                        <input id="row1" type="text" style="width: 300px;" type="text" class="form-control">
                    </td> -->
                    <td>
                        <c:if test = "${list.size()!=0}">
                    	<select style="width:200px;" id = "showseq" name = "showseq" class = "form-control row3">
                    		<optgroup label="공연제목">
                    		   <c:forEach items="${list}" var="dto">
                    			<option value="${dto.showseq}">${dto.showtitle}</option>
                    			</c:forEach>
                    		</optgroup>
                    	</select>
                       <!--  <input id="row3" name = "showtitle" class="form-control" style="width: 500px;"></input> -->
                      </c:if>
                    </td>
    		
                </tr>
				<tr>
					<th style="vertical-align: middle;">기간</th>
					<td><input id="row2" style="width: 160px; display:block; float:left;" type="date" class="form-control" class="line" disabled value = "${dto.startdate}">
                         <span style="display:block; float:left; margin-top:5px;"> &nbsp;~&nbsp; </span> <input id="row2" style="width: 160px; display:block; float:left;" value="${dto.enddate}" type="date" class="form-control" class="line" disabled></td>
				</tr>

				<tr>
					<th style="vertical-align: middle;">장소</th>
					<td><input id="row3" class="form-control"
						style="width: 300px;" disabled value = "${dto.showaddr}"></input></td>
				</tr>
					<input type = "hidden" name = "myshowseq" value = "${dto.myshowseq}">
			</table>
		</div>
		<div id="manipulate">
			<button class="modified" id="modifybtn">
				<i class="glyphicon glyphicon-pencil"></i>수정
			</button>

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
                    $("#modifybtn").click();
                }
            });

            //추가
            $("#modifybtn").click(function () {
                if(confirm("정말로 수정하시겠습니까?")){
                    location.href = "/AtTicketProject/customer/cusintershowupdateok.do?seq=${seq}&myshowseq=${myshowseq}&showseq="+$('#showseq').val();
                }
            });
            
        </script>
</body>
</html>