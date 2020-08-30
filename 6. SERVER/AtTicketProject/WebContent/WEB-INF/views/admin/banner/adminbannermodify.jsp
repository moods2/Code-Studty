<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        html {
            width : 1200px;
            height :1000px;
            /* border : 1px solid black; */
        }
        /* 배너사진 선택하기 */
        #title {
            /* border: 1px solid red; */
            margin : 10px;
            /* margin : 10px; */
            font-weight: bold;
            font-size: 1.7em;
        }
        /* 스플릿 라인 */
        .splitLine {
            border : 1px solid #F0F0F0;
            margin : 0px;   
        }
        /* 파일선택 */
        #fileSelect {
            margin : 10px;
            margin-left : 30px;
        }
        /* 내가 선택한 그림파일 가져오기 */
        #imgShow {
            min-width : 300px;
            min-height : 460px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            margin : 20px auto;
            border: 2px solid #F0F0F0;
        }
        /* 그림뒤에 배경 */
        #imgback {
            /* width : 320px; */
            margin : 30px;
            height : 460px;
            /* padding : 10px; */
            /* padding-bottom : 30px; */
            padding-top: 1px;
        }
        /* 내용물 쓰기 -> 포함하는 div*/
        #writeCont {
            margin : 10px;
            margin-left : 27px;
        }
        #btns {
            margin-left : 130px;
        }

        /* 적용하기 삭제하기 버튼 */
        .bottombtn {
            border : 1px solid #F0F0F0;
            width : 80px;
            height : 40px;
            font-size:1em;
        }
        .bottombtn:hover {
            background-color: #DDDDDD;
        }

        #inputtitle {
            font-size: 1.2em;
            margin-left : 20px;
        }
        
        #submit {
        	margin: 20px auto;
        	position: absolute;
        	left: 45%;
        	font-size: 14px;
        	outline: none;
        }

        
    </style>

</head>
<body>
    
    <div id = "title">배너 사진 선택하기</div>
    <hr class = "splitLine">
    <br>
    <form method="GET" action="/AtTicketProject/admin/adminbannermain.do" target="parentPage">
	    <div><input type="file" id = "fileSelect" name="file"></div>
	    <div id = "imgback">
	        <div id = "imgShow"></div>
	    </div>
	    <div id = "inputtitle">배경색 선택</div>
	    <div id = "writeCont"><input type="color" id="color" name="color" style="width : 400px;"></div>
	    <div id = "btns">
	        <input type="button" class = "bottombtn" value = "적용하기" id = "applybtn">
	        <input type="button" class = "bottombtn" value = "취소하기" id = "delbtn">
	    </div>
	    <input type="submit" class = "btn btn-primary btn-lg" value = "수정완료" id = "submit" onclick="self.close();">
    </form>
    
    <script>
    
        $(document).ready(function(){

			$("#fileSelect").on('change', function(){  // 값이 변경되면
				if(window.FileReader){  // modern browser
					var filename = $(this)[0].files[0].name;
				} 
				else {  // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				}

				$("#imgShow").css("background-image", "url(../images/" + filename + ")");
				
			});
			
		});

        //적용하기 버튼 누르기
        $("#applybtn").click(function(){
            //alert($("#color").val());
            $("#imgback").css("background-color", $("#color").val());
        });

        // 삭제하기 버튼 누르기 
        $("#delbtn").click(function(){
        	$("#imgback").css("background-color", "transparent");
        });
        
    </script>

    
</body>
</html>