<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
    <style>

        @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); }
        @font-face { font-family: 'NEXON Lv1 Gothic OTF Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff'); font-weight: normal; font-style: normal; }
        * { outline: none; }
        html{
            width: 1100px;
        }
        h1{
            font-weight: bold;
            font-family: Arial;
            font-size: 3em; 
            color: #111;
        }
        body{
            font-family: 'NanumBarunGothic';
        }
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        #content {
            /* border: 1px solid red; */
            width: 400px;
            height: 400px;
            position: absolute;
            left: 360px;
            top: 150px;
        }

        #add {
            width: 500px;
            height: 800px;
            position: relative;
            left: 40px
            /* margin: 20px auto; */
            
        }
        #content > #add > from > div {
            margin: 5px;

        }
        #content > #add > form > div > label {
            margin: 10px;
        }

        #btnadd {
            margin-top: 0px;
            margin-left: 200px;
        }
        .addshow { margin-left: 5px; }
        .addshow *{ margin: 5px; }
        .rtxt { margin: 5px ;}

        .img_wrap {
            /* border: 1px solid black; */
            width: 300px;
            height: 100px;
            margin-top: 50px;
        }
        .img_wrap img {
            max-width: 30%;
        }
        
        .btn { box-shadow: none; }


    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminShowAdd</title>
    <%@include file="/WEB-INF/views/inc/menu.jsp" %>
</head>

<body>

    <div id = "title">
        <h1 style="color:#555">공연 추가 <small> > 공연관리 > Home  </small></h1>
    </div>

    <div id="content">


        <fieldset id="add" class="form-control" style="border: 0px;">
            <!-- <legend class="form-control">공연 정보 추가하기</legend> -->
            
			<form method="POST" enctype="multipart/form-data" action="/AtTicketProject/adminshowaddok.do">
			
            <div>
                <label>공연 장르 : </label>
                <select name="genre" style="height: 25px;">
                    <option value="musical">뮤지컬</option>
                    <option value="concert">콘서트</option>
                    <option value="theater">연극</option>
                    <option value="classic">클래식</option>
                    <option value="exhibition">전시</option>
                </select>
            </div>

            <div><label for="name">공연 제목 : </label><input type="text" id="name" name="name" autofocus required></div>
            <div>
                <label for="openDate">오픈 일시 : </label>
                <input style="width: 100px;" type="text" name="openDate" id="openDate" class="date" value="" required>
                <label for="date3"><span style="font-size: 1em;" class="glyphicon glyphicon-calendar" id = "cal3"></span></label>
            </div>
            <div><label for="startDate">공연 기간 : </label>
                <input style="width: 100px;" type="text" name="startDate" id="startDate" class="date" value="" required>
                <label for="date1"><span style="font-size: 1em;" class="glyphicon glyphicon-calendar" id = "cal1"></span></label>
                <span> - </span>
                <input style="width: 100px;" type="text" name="endDate" id="endDate" class="date" value="" required>
                <label for="date1"><span style="font-size: 1em;" class="glyphicon glyphicon-calendar" id = "cal2"></span></label>
            </div>
            <div><label for="price">공연 가격 : </label><input type="text" name="price" id="price" style="width: 100px;" autofocus required>원</div>
            <div><label for="min">소요 시간 : </label><input type="text" name="min" id="min" style="width: 100px;" autofocus required>분</div>
            <div><label for="age">연령 제한 : </label><input type="text" name="age" id="age" style="width: 100px;" autofocus required>세</div>
            <div id="round">
                <label for="round">공연 회차 : </label><input type="text" name="round" id="round" style="width: 100px;" autofocus required>
                <label for="time">시작 시간 : </label><input type="text" name="time" id="time"  style="width: 100px;" autofocus required>
                <button id="addbtn" class="btn btn-default" style="height: 30px; outline: none;">회차 추가</button>
            </div>
            
            <div>
                <label for="place">공연 장소 : </label>
                <select name="region" id="region">
                <option value="0" selected disabled hidden>지역</option>
               	<option value="서울">서울</option>
               	<option value="인천">인천</option>
               	<option value="부산">부산</option>
               	<option value="광주">광주</option>
               	<option value="대전">대전</option>
                </select>
                
               	<select name="hall" id="hall">
               	<option value="0" selected disabled hidden>공연장</option>
               	</select>
               	
               	<select name="theater" id="theater">
               <option value="0" selected disabled hidden>상영관</option>
               	</select>
            </div>

            <div>
                <label for="txtagen">기획사 : </label>
                <select name="agency">
                	<option value="0" selected disabled hidden>기획사</option>
                    <option value="1">㈜프라이빗커브</option>
                    <option value="2">㈜홍컴퍼니</option>
                    <option value="3">롯데엔터네인먼트</option>
                    <option value="4">오픈리뷰</option>
                    <option value="5">주식회사 스탠바이컴퍼니</option>
                    <option value="6">㈜월드쇼마켓</option>
                    <option value="7">롯데컬처웍스㈜</option>
                    <option value="8">㈜펜타토닉</option>
                    <option value="9">㈜엠피앤컴퍼니</option>
                    <option value="10">예술의전당</option>
                    <option value="11">(㈜인터파크</option>
                    <option value="12">페이지터너</option>
                </select>
            </div>
            
            <div>
            	<label for="tag">태그 : </label><span>#태그명,#태그명,#태그명.. 형식으로 작성하세요.</span>
            	<textarea id="tag" name="tag" style="width: 480px; height: 100px; resize:none;"></textarea>
            </div>

            <div><label for="poster">포스터  : </label><input type="file" id="poster" name="poster" style="display: inline;" autofocus required></div>
            <div class="img_wrap">
                <img id="img1" />
            </div>

            <div><label for="showcontent">공연 내용 : </label><input type="file" id="showcontent" name="showcontent" style="display: inline;" autofocus required></div>
            <div class="img_wrap">
                <img id="img2" />
            </div>

            <div><input type="submit" id="btnadd" value="추가하기" class="btn btn-default"></div>
            
			</form>
			
        </fieldset>
    

       

    </div>

</body>
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
	
	
	//ajax 공연장 목록
	$("#region").change(function(){
		//alert($(this).find(":selected").val());
		$.ajax({
			type: "GET",
			url: "/AtTicketProject/adminshowhall.do",
			data: "region=" + $(this).find(":selected").val(),
			dataType: "json",
			success: function(result) {
				$("#hall *").remove();
				$(result).each(function(index, item){
					$("#hall").append("<option value = " + item.seq + ">" + item.name +"</option>");
				});
				$("#hall").change(loadtlist);
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});
	
	//ajax 상영관 목록
	function loadtlist() {
		//alert($(this).find(":selected").val());
		$.ajax({
			type: "GET",
			url: "/AtTicketProject/adminshowtheater.do",
			data: "hseq="+$(this).find(":selected").val(),
			dataType: "json",
			success: function(result) {
				$(result).each(function(index, item){
				/* 	$("#theater *").remove(); */
					$("#theater").append("<option value=" + item.seq + ">" + item.name + "</option>");
				});
			},
			error: function(a,b,c){
				console.log(a,b,c);
			}
		});
	}

    var n = 2;

    $("#addbtn").mousedown(function() {
    	
        $("#round").append("<div class='addshow'><label for='round"+ n +"'>공연 회차 : </label><input type='text' name='round"+ n +"' id='round"+ n +"' style='width: 100px;' autofocus>"+
                "<label for='time"+ n +"'> 시작 시간 : </label><input type='text' id='time"+ n +"'name='time"+ n +"' style='width: 100px;' autofocus></div>");

        n++;
        

    });

    $("#btnadd").click(function() {
        // alert();
        // 추가버튼 >> 입력된 정보 추가하기
        history.back();
    });

    var sel_file;

    $(document).ready(function() {
        $("#poster").on("change", handleImgFileSelect1);
        $("#showcontent").on("change", handleImgFileSelect2);
    }); 

    function handleImgFileSelect1(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img1").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
            
        });
    }

    function handleImgFileSelect2(e) {
        var files2 = e.target.files;
        var filesArr2 = Array.prototype.slice.call(files2);

        filesArr2.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader2 = new FileReader();
            reader2.onload = function(e) {
                $("#img2").attr("src", e.target.result);
            }
            reader2.readAsDataURL(f);
            
        });
    }

    $("#openDate").datepicker({
        dateFormat: "yy-mm-dd",
    });

    $("#startDate").datepicker({
        dateFormat: "yy-mm-dd"
    });

    $("#endDate").datepicker({
        dateFormat: "yy-mm-dd"
    });


</script>

</html>