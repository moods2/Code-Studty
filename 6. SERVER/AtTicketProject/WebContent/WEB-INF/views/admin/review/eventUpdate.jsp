<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
 #b {
            margin-top: 30px;
            margin-left: 260px;
        }

        .btn {
            width: 100px;
        }

        #sel {
            margin: 40px;
        }

        #add {
            width: 430px;
            height: 250px;
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
	 <legend style="width: 200px; margin:20px 40px; font-weight: bold;">이벤트 수정</legend>

    <div id="sel">
        <span id="box">
            <label for="txtname">수정할 필드 : </label> <select name="sel1" size="1" style="height: 25px;">
                    <option value="name">제목</option>
                    <option value="period">기간</option>
                    <option value="sort">구분</option>
                    <option value="banner">배너</option>
                    <option value="content">내용</option>
                </select>
            <input style="position: relative; top: -2px;" type="text" name="txt" id="txt" autofocus>
        </span>
    </div>


    <div id="b">
        <!-- <input type="button" value="수정" id="btn1" style="margin-left: 20px;" class="btn btn-default">
        <input type="button" value="닫기" id="btn2" style="margin-left: 20px;" class="btn btn-default"> -->
        <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
        <button class = "modified" id = "closebtn">닫기</button>
    </div>

    <script>
        var sel1 = document.all.sel1;
        var btnAdd = document.getElementById("btnAdd");
        var list = document.getElementById("list");
        //   for(var i=0;i<sel1.options.length;i++){

        //<option selected> 기본적으로 선택되는 속성
        sel1.onchange = function () {
                clear();
                console.log(2);
                if (sel1.value == "banner" || sel1.value == "content") {
                    // $("#box").append('<input style="background-color: lavender; margin: 4px; display: inline;" type="file"></div><div id="list"></div><input type="button" value="+파일" id="btnAdd"  style="margin-top: 5px;">');
                    $("#box").append('<span><input type="file" id="txtphoto" style="display: inline;" autofocus></div> <div class="img_wrap"> <img id="img1"/> </div></span>');
                } else {
                    $("#box").append('<input style="position: relative; top: -2px;" type="text" name="txt" id="txt" autofocus>');
                }
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

            }

        //  }

        function clear() {
            document.getElementById("box").removeChild(document.getElementById("box").lastElementChild);
        }


        $("#btn1").click(function () {
            if (confirm("수정하시겠습니까?")) {
            }
        });

        $("#btn2").click(function () {
            window.close();
        });
	

	</script>
</body>
</html>