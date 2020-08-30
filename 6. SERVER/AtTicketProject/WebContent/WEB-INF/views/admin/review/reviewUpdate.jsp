<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    #subtitle {
        margin-top: 50px;
        margin-left: 280px;
        text-align: center;
        width: 1000px;
        height: 40px;
        background-color: #CCCCCC;
        padding-top: 10px;
        color: white;
        font-weight: bold;
        font-size: 1.3em;
    }

    #box1 {
        margin-left: 280px;
    }

    .table th {
        font-weight: bold;
        text-align: center;
    }

    .line {
        margin-top: 10px;
    }

    .modified {
        border: 0px;
        border-radius: 5px;
        background-color: #999;
        outline: none;
        font-weight: border;
        color: rgb(220, 220, 220);
        height: 35px;
        font-weight: bold
    }

    .modified:hover {
        color: white;
        /* background-color: #333; */

    }

    #img1{
        padding-left: 100px;
        padding-top: 20px;
        width: 700px;
    }

    .subject{
        width: 100px;
    }

</style>
</head>
<body><div id="title">
        <h1 style="color: #555; font-weight: bold;
                font-family: Arial;
                font-size: 3em;">수정 > <small>리뷰 게시판 </small><small>> Home </small></h1>
    </div>

    <div id="subtitle">글쓰기</div>
    <div id="box1" style="width: 1000px;">
        <table class="table table-bordered" style="width: 1000px">
            <tr>
                <th class = "subject" style="width: 100px; vertical-align: middle;">태그</th>
                <td>
                    <select class = "form-control" style="width: 90px;">
                        <optgroup label="태그">
                            <option value = "1">후기</option>
                        </optgroup>
                    </select>
                </td>
            </tr>
            
            <form method="POST" action="/AtTicketProject/review/reviewupdateok.do">
            <tr>
            	
                <th class = "subject" style="width: 100px; vertical-align: middle;">장르</th>
                <td>
                    <select class = "form-control" id="genre" name="genre" style="width: 90px;">
                        <optgroup label="장르">
                            <option value="concert">콘서트</option>
                            <option value="musical">뮤지컬</option>
                            <option value="theater">연극</option>
                            <option value="classic">클래식</option>
                            <option value="exhibition">전시</option>
                        </optgroup>
                    </select>
                </td>
            </tr>
            <tr>
                <th class = "subject" style="width: 100px; vertical-align: middle;">공연제목</th>
                <td>
                    <select class = "form-control" id="showname" name="showname" style="width: 400px;">
                        <optgroup label="제목">
                        
                            <option value = "${dto.stitle}">${dto.stitle}</option>
                            
                        </optgroup>
                    </select>
                </td>
            </tr>
            
            <tr>
                <th class = "subject" style="vertical-align: middle;">제목</th>
                <td>
                    <input id="row2" name="row2" style="width: 500px;" type="text" class="form-control" class="line" value="${dto.title}">
                    <div style="margin-top: 10px;" required="required" autocomplete="off">반드시 입력하세요.</div>
                </td>
            </tr>

            <tr>
                <th class = "subject" style="vertical-align: middle;">내용</th>
                <td>
                    <textarea id = "row3" name="row3" class="form-control" style="height:100px">${dto.content}</textarea>
                </td>
            </tr>
            <tr>
                <th class = "subject" style="vertical-align: middle;">파일</th>
                <td>
                    <div><label for="txtphoto">첨부파일&nbsp;</label><input type="file" id="txtphoto" name="txtphoto" style="display: inline;"></div>
                    <div class="img_wrap">
                        <img id="img1" />
                    </div>
                </td>
            </tr>
            <tr>
                <th class = "subject" style="vertical-align: middle;">날짜</th>
                <td>
                    <input id="row4" name="row4" style="width: 200px;" type="date" class="form-control" class="line" value="${dto.regdate}">
                    <input type="hidden" value="${dto.seq}" name="seq">
                    <div style="margin-top: 10px;" required="required" autocomplete="off">반드시 입력하세요.</div>
                </td>
            </tr>
        </table>
        <div style="margin-top: 30px; margin-left: 878px; text-align: center; width: 130px;">
            <button type="button" class="modified" id="goback" >돌아가기</button>
            <button type="submit" class="modified" id="makebtn" ><i class="glyphicon glyphicon-plus"></i>수정</button>
        </div>
        </form>
        
    </div>
  

	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
	
	$(document).ready(function() {
		
		$('#genre').val('${dto.genre}').prop("selected",true);
		
	});
	
	const map = new Map();
	<c:forEach items="${list}" var="list">
		map.set("${list.title}", "${list.genre}");
	</c:forEach>
	
	
	 //제목에 엔터를 치면 내용으로 focus
    $("#row2").keyup(function () {
        if (event.keyCode == 13) {
            $("#row3").focus();
        }
    });
	 
	 
	$("#genre").change(function() {
		//alert($(this).find("option:selected").val());
		$("#showname").find("option").remove();
		var title = $(this).find("option:selected").val();
		map.forEach((value, key) => {
    		if (value == title) {
    			$("#showname").append("<option value='" + key + "'>" + key + "</option>");
    		}
    	});
		
	});
	
	$("#goback").click(function() {
		history.back();
	});

    var sel_file;

    $(document).ready(function () {
        $("#txtphoto").on("change", handleImgFileSelect1);
    });

    function handleImgFileSelect1(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function (f) {
            if (!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                $("#txtphoto").val("");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img1").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);

        });
    }
    
	</script>
</body>
</html>