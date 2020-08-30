<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
		margin-left: 390px;
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
        <legend style="width: 300px; margin:20px -1px; font-weight: bold;">쿠폰 수정</legend>
        
        <div id="box1" style="width: 1000px;">
            <table class="table table-bordered" style="width: 450px">
                   <tr>
                    <th style="width: 100px; vertical-align: middle;">쿠폰</th>
                    <td style="width: 350px;">
                    <c:if test = "${list.size()!=0}">
                    	<select style="width:300px;" class = "form-control" name = "couponseq" id = "couponseq">     
                    		<optgroup label="쿠폰">
                    		<c:forEach items="${list}" var="dto">
                    			<option value = "${dto.seq}">${dto.title}</option>
                    		</c:forEach>
                    		</optgroup>
                    	</select>
                    </c:if>
                      
                    </td>
                </tr>
            </table>
        </div>

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

            $("#row3").keyup(function () {
                if (event.keyCode == 13) {
                    $("#row4").focus();
                }
            });

        
            $("#row4").keyup(function () {
                if (event.keyCode == 13) {
                    $("#modifybtn").click();
                }
            });

            //추가
            $("#modifybtn").click(function () {
                if(confirm("정말로 수정하시겠습니까?")){
                    location.href = "/AtTicketProject/customer/cuscouponupdateok.do?cusseq=${cusseq}&cuscouponseq=${cuscouponseq}&couponseq="+$('#couponseq').val();
                }
            });
        </script>
</body>
</html>