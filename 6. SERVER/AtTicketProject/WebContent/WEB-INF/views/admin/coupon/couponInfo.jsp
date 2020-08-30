<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
<style>
 #title {
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        small {
            color: #777;
            font-family: Arial;
            font-size: 27.3px;
            font-weight: lighter;
        }

        body {
            outline: none;
        }

        #info {
            margin-top: 30px;
            margin-left: 280px;
        }

        #tbl td {
            text-align: center;
            vertical-align: middle;
            
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
            font-weight: bold    
        }
        .modified:hover {
            color : white;
            /* background-color: #333; */

        }
</style>
</head>
<body>
<div id="title">
        <h1 style="color: #555; font-weight: bold;
        font-family: Arial;
        font-size: 3em;">쿠폰 정보 <small>> 쿠폰 관리 > Home </small></h1>
    </div>

    <div id="info" style="position: relative; left: 350px;">
        <h2>쿠폰 정보</h2>
       
        <table style="width: 810px;" class="table  table-bordered table-striped table-condensed" id="tbl">
            <tbody id="tbody1">
                <tr>
                    <th style="text-align: center;"><input type="checkbox" name="cbAll"></th>
                    <th class="title" style="width: 50px;text-align: center;">번호</th>
                    <th class="title" style="width: 290px;text-align: center;">제목</th>
                    <th class="title" style="width: 200px;text-align: center;">기간</th>
                    <th class="title" style="width: 70px;text-align: center;">할인율</th>
                    <th class="title" style="width: 200px;text-align: center;">할인</th>
                <tr value="1">
                    <td><input type="checkbox" class="cb" name="checkRow" value="1"></td>
                    <td class="data" id="index">1</td>
                    <td class="data">[매거진 수신회원] 뮤지컬 2,000원 할인</td>
                    <td class="data">2020.01.01-2020.12.31</td>
                    <td class="data">2000</td>
                    <td class="data"><img src="../images/redcp.png" width="200px" height="200px"></td>
                   
                </tr>
                </tr>
        </table>
        <div id = "manipulate" style="margin-left: 700px; width: 200px;">
            <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
            <button class = "modified" id = "delbtn"><i class="glyphicon glyphicon-trash"></i>삭제</button>
        </div>
        </tbody>
    </div>
  

	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
	 var cbAll = document.all.cbAll; // 일괄 체크박스
	    var child;
	    var cb = document.getElementsByClassName("cb");

	    // 모두 선택 기능, 페이지 이동 
	    cbAll.onchange = function () {
	        for (var i = 0; i < cb.length; i++) {
	            cb[i].checked = cbAll.checked;
	        }
	    }

	    //수정
	    $("#modifybtn").click(function () {
	            if ($('input').is(':checked') == true) {
	               	window.open("/AtTicketProject/coupon/couponinfoupdate.do", "수정", "width=500, height=330");
	            } else {
	                alert("하나 이상을 체크하시오.");
	            }
	        });

	    //삭제
	    $("#delbtn").click(function () {
	            if ($('input').is(':checked') == true) {
	                if (confirm("정말로 삭제하시겠습니까?")) {
	                    $("input[name=checkRow]:checked").each(function () {
	                        var tr_value = $(this).val();
	                        var tr = $("tr[value='" + tr_value + "']");
	                        tr.remove();
	                    });
	                    }
	                } else {
	                    alert("하나 이상을 체크하시오.");
	                }

	    });


	</script>
</body>
</html>