<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
 #box {
            margin-left: 30px;
            font-size: 15px;
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
        
        label{
        	font-weight:normal;
        }
</style>
</head>
<body>
	 <legend style="width: 200px; margin:20px 25px; font-weight: bold;">이벤트 삭제</legend>
    <div id = "right">
	<form method="POST" action = "/AtTicketProject/event/eventinsertok.do">
        <table id="tbl" class="table table-bordered" style="width: 600px;">
            
            <tr>
                <th style="width: 150px;">종류</th>
                <td style="width: 450px;">
                    <select name="seq">
                    	<option value="">종류선택</option>
                    	<c:forEach items="${list}" var="dto">
                    	<option value="리뷰이벤트">리뷰이벤트</option>
                    	</c:forEach>
                    </select>
                </td>
            </tr>
            
            
            
        </table>
		
		<input type="button" class="btn btn-default" value="뒤로" onclick="location.href='/AtTicketProject/event/eventinsert.do'"
                style="margin-left: 300px; box-shadow: none; outline: none;">
	
        <input type="submit" class="btn btn-default" value="글쓰기"
                style="box-shadow: none; outline: none;">
                
         </form>


        
    </div>
 
    <script>

        
       
     </script>
</body>
</html>