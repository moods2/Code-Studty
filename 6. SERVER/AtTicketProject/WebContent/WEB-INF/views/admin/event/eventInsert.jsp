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
	 <legend style="width: 200px; margin:20px 25px; font-weight: bold;">이벤트 추가</legend>
    <div id = "right">
	<form method="POST" action = "/AtTicketProject/event/eventinsertok.do">
        <table id="tbl" class="table table-bordered" style="width: 600px;">
            <!-- <tr>
                <th style="width: 150px;">부서</th>
                <td style="width: 450px;">
                    <select class="form-control">
                        <option>개발부</option>
                        <option>영업부</option>
                        <option>마케팅부</option>
                        <option>인사부</option>
                        <option>디자인부</option>
                        <option>총무부</option>
                    </select>
                </td>
            </tr> -->
            <tr>
                <th style="width: 150px">제목</th>
                <td style="width: 450px;">
                    <!-- block태그로 바뀜 -->
                    <input name = "title" type="text" class="form-control"> 
                </td>
            </tr>
            <tr>
            	<th>
            		<label for="startDate">공연 기간 : </label>
            	</th>
            	<td>
	                <input style="width: 100px;" type="text" name="startdate" id="startdate" class="date" value="" required>
	                <label for="date1"><span style="font-size: 1em;" class="glyphicon glyphicon-calendar" id = "cal1"></span></label>
	                <span> - </span>
	                <input style="width: 100px;" type="text" name="enddate" id="enddate" class="date" value="" required>
	                <label for="date1"><span style="font-size: 1em;" class="glyphicon glyphicon-calendar" id = "cal2"></span></label>
                </td>
            </tr>
            <tr>
                <th style="width: 150px;">종류</th>
                <td style="width: 450px;">
                    <select name="eindex">
                    	<option value="">종류선택</option>
                    	<option value="리뷰이벤트">리뷰이벤트</option>
                    	<option value="프로모션">프로모션</option>
                    	<option value="쿠폰">쿠폰</option>
                    	<option value="초대이벤트">초대이벤트</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width: 150px; " >배너</th>
                <td style="width: 450px;">
                    <input name ="banner" type="file" class="form-control" style = "padding-bottom: 30px;">
                </td>
            </tr>
            <tr>
                <th style="width: 150px; " >컨텐츠</th>
                <td style="width: 450px;">
                    <input name ="content" type="file" class="form-control" style = "padding-bottom: 30px;">
                </td>
            </tr>
            <tr>
                <th style="width: 150px">공연번호</th>
                <td style="width: 450px;">
                    <!-- block태그로 바뀜 -->
                    <input name = "showseq" type="text" class="form-control"> 
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

        var now = new Date();
        $("#startdate").datepicker({
            dateFormat: "yy-mm-dd"
        });


        $("#enddate").datepicker({
            dateFormat: "yy-mm-dd"
        });
       
     </script>
</body>
</html>