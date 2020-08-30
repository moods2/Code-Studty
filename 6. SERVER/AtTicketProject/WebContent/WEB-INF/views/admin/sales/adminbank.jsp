<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminbanner.css">

    <style>

        
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        #content {
            /* border: 1px solid red; */
            width: 80%;
            height: 1880px;
            position: absolute;
            left: 250px;
            top: 120px;
        }

        #tbl {
            /* border: 1px solid gray; */
            border-collapse: collapse;
            width: 800px;
            height: 100px;
            position: relative;
            margin: 0px auto;
            margin-top: 20px;
        }
        #tbl th {
            text-align: center;            
            background-color: #999;
            height: 30px;
        }
        #tbl td {
            height: 30px;
        }
        #tbl th:nth-child(1), #tbl td:nth-child(1) {
            width: 20px;
            text-align: center;
        }
        #tbl th:nth-child(2), #tbl td:nth-child(2) {
            width: 20px;
            text-align: center;
        }
        #tbl th:nth-child(3), #tbl td:nth-child(3) {
            width: 50px;
            text-align: center;
        }
        #tbl th:nth-child(4), #tbl td:nth-child(4) {
            width: 80px;
            padding-left: 10px;
            text-align: center;
        }
        
        #btns {
            width: 600px;
            position: relative;
            margin-left: 940px;
            outline: none;
            font-weight: border;
            height : 35px;
            font-weight: bold;
            margin-top: 10px;
        }
        #btns > a {
            background-color: #999;
            color : rgb(220,220,220);
            margin: 3px;
            box-shadow: none;
            border: 0px;
        }
        #btns > a:hover {
            color: white;
        }
        
    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminBank</title>
</head>

<body>

    <div id = "title">
        <h1 style="color:#555">계좌 관리 <small> > 정산 관리 > Home  </small></h1>
    </div>

	<%@include file="/WEB-INF/views/inc/menu.jsp" %>
	

    <div id="content">

        <table id="tbl" class="table table-striped table-bordered table-condensed">
            <tbody id="tbody">

                <tr>
                    <th><input type="checkbox" id="checkall" class="cb" name="is_check"></th>
                    <th>번호</th>
                    <th>은행</th>
                    <th>계좌 번호</th>
                </tr>
                
                
               	<c:forEach items="${list}" var="dto">
               	
                <tr>
                    <td><input type="checkbox" class="cb" name="is_check" value="${dto.seq}"></td>
                    <td>${dto.seq}</td>
                    <td>${dto.name}</td>
                    <td>${dto.account}</td>
                </tr>               	
               	
               	</c:forEach>
                
                
            </tbody>
        </table>
        
        <div id="btns">
            <a class="btn btn-primary" id="btnadd"><i class="glyphicon glyphicon-plus"></i> 추가</a>
            <a class="btn btn-primary" id="btnmodify"><i class="glyphicon glyphicon-pencil"></i> 수정</a>
            <a class="btn btn-primary" id="btndelete"><i class="glyphicon glyphicon-trash"></i> 삭제</a>
        </div>
        

    </div>

</body>
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>

    $("#checkall").onchange = function(){
        for(var i=0;i<cb.length;i++){
                cb[i].checked;
            }
    }

    // 추가
    $("#btnadd").click(function(){
        window.open("/AtTicketProject/adminbankadd.do","adminBankAdd","width=500, height=300");

    });
    
    
    // 수정
    $("#btnmodify").click(function(){
	    var seq = $("input:checkbox[class=cb]:checked").val();
    	
        if ($("input:checkbox[class=cb]:checked").length > 1 || $("input:checkbox[class=cb]:checked").length < 1){
            alert("하나만 선택하세요.");
        }else {
            //선택된 체크박스의 내용 불러오기

            // window.location.href="adminShowModify.html";
            window.open("/AtTicketProject/adminbankedit.do?seq="+ seq,"adminBankEdit","width=500, height=300");
        }
    });
    // 삭제
    $("#btndelete").click(function(){
    	var seq = $("input:checkbox[class=cb]:checked").val();
    	
    	if ($("input:checkbox[class=cb]:checked").length < 1){
            alert("하나 이상  선택하세요.");
            return;
        }
    	
    	
        var result = confirm("정말 삭제하시겠습니까?");
        //console.log(result);
        if(result) {
        	location.href='/AtTicketProject/adminbankdelete.do?seq='+seq;
        }
    });


    
    

</script>

</html>