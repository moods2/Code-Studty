<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	 #list {
            margin-top: 10px;

        }

        li {
            margin-bottom: 10px;
        }

        #b {
            margin-top: 20px;
            margin-bottom: 30px;
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
        
        .data{
        	width:150px;
        }
        
        #img1 {
            width: 500px;
            margin-top: 20px;
            margin-left: -200px;
        }
        
</style>
</head>
<body>
 <legend style="width: 200px; margin:20px 25px; font-weight: bold;">고객정보 수정</legend>
 
 	<form method = "POST" action = "/AtTicketProject/customer/cuslistupdateok.do" enctype = "multipart/form-data">
    <ul id="list">
         <li>이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="name"
                id="name" class="data" required value = "${dto.name}"></li>
        <li>아이디 &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="id" id="id" class="data" required value = "${dto.id}"></li>
        <li>주민번호 : <input type="text" name="ssn" id="ssn" class="data" required value = "${dto.ssn}"></li>
        <li>고객등급 : <div style="margin-top:-25px; margin-left:70px;"><select name="grade" style="width:100px;" class = "form-control">
        				<optgroup label="고객등급">
        					<c:forEach items = "${list1}" var = "grade">
        					<option value = "${grade}" class = "data">${grade}</option>
        					</c:forEach>
        				</optgroup>
        			</select>
        			</div>
      <%--   <input type = "text" name = "grade" class = "data" required value = "${dto.grade}"> --%>
        </li>
        <li>이메일 &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="email" id="email" class="data" required value = "${dto.email}"></li>
        <li>전화번호 : <input type="text" name="tel" id="tel" class="data" value = "${dto.tel}"></li>
        <li>비번 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="pw"
                id="pw" class="data" required value = "${dto.pw}"></li>
        <li>에그머니 : <input type="text" name="egg" id="egg" class="data" required value = "${dto.egg}"></li>
		<li>주소 :
			<div style="display: inline-block; margin-left: 30px;">
				<div style="display: inline-block;">
					<input type="text" id="postcode" placeholder="우편번호">
					<input id="addr" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input name="address" type="text" id="address" placeholder="도로명주소" required value = "${dto.addr}"> 
					
					<%@include file="/WEB-INF/views/inc/adminaddress.jsp"%>
				</div>
			</div>
		</li>
		<li>파일 : <div class = "data" style="width:500px;margin-left:70px;margin-top:-25px;"><input value = "${dto.photo}" name = "attach" type="file" class="form-control">
			 	 <div style="margin-top:5px;">기존 파일 이름 : <input type = "text" value = "${dto.photo}" disabled></div>
			  	</div>
		 	
		</li>
		<input type = "hidden" value = "${dto.seq}" name = "seq">
		<input type="hidden" name="page" value="${page}">
    	<input type="hidden" name="search" value="${search}">
    </ul>
    
    <div id="b" style="margin-left: 300px;">    
        <button type = "submit" class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
        <button class = "modified" id = "closebtn">닫기</button>
    </div>
    </form>
	<script>
	 /* var sel_file;

	    $(document).ready(function () {
	        $("#txtphoto").on("change", handleImgFileSelect1);
	    });

	    function handleImgFileSelect1(e) {
	        var files = e.target.files;
	        var filesArr = Array.prototype.slice.call(files);

	        filesArr.forEach(function (f) {
	            if (!f.type.match("image.*")) {
	                alert("확장자는 이미지 확장자만 가능합니다.");
	                return;
	            }

	            sel_file = f;

	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $("#img1").attr("src", e.target.result);
	            }
	            reader.readAsDataURL(f);

	        });
	    } */
	 
    $("#name").keyup(function () {
        if (event.keyCode == 13)
            $("#email").focus();
    }
    );

    $("#email").keyup(function () {
        if (event.keyCode == 13)
            $("#tel").focus();
    }
    );

    $("#tel").keyup(function () {
        if (event.keyCode == 13)
            $("#ssn").focus();
    }
    );

    $("#ssn").keyup(function () {
        if (event.keyCode == 13)
            $("#id").focus();
    }
    );

    $("#id").keyup(function () {
        if (event.keyCode == 13)
            $("#pwd").focus();
    }
    );

    $("#pwd").keyup(function () {
        if (event.keyCode == 13)
            $("#addr").focus();
    }
    );

    $("#modifybtn").click(function () {
        if (confirm("수정하시겠습니까?")) {
            
        }
    });

    $("#closebtn").click(function () {
        window.close();
    });

	</script>
</body>
</html>