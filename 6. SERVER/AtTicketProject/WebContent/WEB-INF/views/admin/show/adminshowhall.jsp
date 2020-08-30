<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <style>
        @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); }

        * { outline: none; }

        body{
            font-family: 'NanumBarunGothic';
        }
        html{
            width: 400px;
        }

        #title{
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            width: 430px;
            border-bottom: 1px dashed black;
        }

        h1{
            font-weight: bold;
            font-family: Arial;
            /* font-size: 3em;  */
            color: #555;
        }

        #content {
            /* border: 1px solid red; */
            width: 400px;
            height: 300px;
          
        }

        #add {
            width: 400px;
            height: 300px;
            position: relative;
            left: 40px
            /* margin: 20px auto; */
            
        }
        #content > #add > div {
            margin: 10px;

        }
        #content > #add > div > label {
            margin: 5px;
        }
       
        .addshow { margin-left: 5px; }
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

        #hall { 
            position: relative;
            /* border: 1px solid black; */
            width: 100px;
            height: 100px;
            top: 15px;
         }
         #theater {
             position: relative;
             /* border: 1px solid #ccc; */
             width: 100px;
             height: 120px;
             left: 210px;
             top: -135px;
         }
         #tbox{
             border: 1px solid #ccc;
             height: 85px;
             width: 95px;
         }
         #center {
             /* border: 1px solid black; */
             width: 30px;
             height: 30px;
             position: relative;
             left: 140px;
             top: -50px;
         }


        .subtitle {
            font-size: 14px;
            font-weight: bold;
            margin-left: 20px;
        }
        #btns {
            position: relative;
            left: 82px;
            top: -50px;
        }
        #btns > input {
            margin: 5px;
        }
    </style>
   

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>adminShowAdd_hall</title>
</head>

<body>

    <div id = "title">
        <h1>상영관 검색</h1>
    </div>

    <div id="content">
        <fieldset id="add" class="form-control" style="border: 0px;">
            <!-- <legend class="form-control">공연 정보 추가하기</legend> -->
            
            <div>
                <label for="txtplace">공연 장소 : </label>
                <select style="height: 25px; border: 1px solid #ccc;">
                    <option>서울</option>
                    <option>인천</option>
                    <option>부산</option>
                    <option>광주</option>
                    <option>대전</option>
                </select>
            </div>

            <div id="hall">
                <!-- 공연장소 검색 결과 -->
                <span class="subtitle">공연장</span>
                <select size="5" id="searchplace" style="border: 1px solid #ccc;">
                    <option>yes24홀</option>
                    <option>예술의전당</option>
                    <option>월드컵경기장</option> 
                </select>
            </div>
            <div id="center">
                <span id="gspan" class="glyphicon glyphicon-chevron-right" style="font-size: 25px;"></span>
            </div>
            <div id="theater">
                <span class="subtitle">상영관</span>
                <select size="5" id="tbox" style="border: 1px solid #ccc;">
                    <option>1관</option>
                    <option>2관</option>
                    <option>3관</option> 
                </select>
            </div>

            
            
            <div id="btns">
                <input type="button" id="btnok" value="확인" class="btn btn-default">
                <input type="button" id="btnclose" value="닫기" class="btn btn-default">
            </div>
        </fieldset>
    </div>




</body>
<script>

    var n = 2;

    $("#addbtn").mousedown(function() {
        // console.log(111);
        // alert();
        
        $("#round").append("<div class='addshow'><label for='txtround"+ n +"'>공연 회차 : </label><input type='text' class='rtxt' id='txtround"+ n +"' style='width: 100px;' autofocus>"+
                "<label for='txttime"+ n +"'> 공연 시간 : </label><input type='text' class='rtxt' id='txttime"+ n +"' style='width: 100px;' autofocus></div>");

        n++;

    });

    $("#btnok").click(function() {
        window.close();
    });

    $("#btnclose").click(function() {
        window.close();
    });

    var sel_file;

    $(document).ready(function() {
        $("#txtheader").on("change", handleImgFileSelect1);
        $("#txtcontent").on("change", handleImgFileSelect2);
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
                $("#img2").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
            
        });
    }
    

</script>

</html>