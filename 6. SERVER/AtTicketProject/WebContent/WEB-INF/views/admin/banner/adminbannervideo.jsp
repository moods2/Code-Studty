<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        html {
            width : 600px;
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
            width : 280px;
            height : 400px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            margin : 20px auto;
            border: 2px solid #F0F0F0;
        }
        /* 그림뒤에 배경 */
        #imgback {
            background-color: #F0F0F0;
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
        #selColor{
            margin : 10px;
            margin-left : 27px;
        }
        #color { width: 130px; }
        
        #btns {
            margin-left : 230px;
        }

        /* 적용하기 삭제하기 버튼 */
        .bottombtn {
            border : 1px solid #F0F0F0;
            width : 100px;
            height : 50px;
            font-size:1.2em;
        }
        .bottombtn:hover {
            background-color: #DDDDDD;
        }

        #inputtitle {
            font-size: 1.2em;
            margin-left : 20px;
        }

        
    </style>

</head>
<body>
    
    <div id = "title">배너 사진 선택하기</div>
    <hr class = "splitLine">
    <br>
    
    <form method="GET" action="/AtTicketProject/admin/adminbannerconcert.do" target="parentPage">
	    <div id = "selColor">배경 색상 : <input type="color" id="color"></div>
	    <input type="hidden" name="color" id="hiddencolor">
	    <br>
	    <div><input type="file" id = "fileSelect" name="file"></div>
	    <div id = "imgback">
	        <div id = "imgShow"></div>
	    </div>
	    <div id = "inputtitle">영상HTML 주소 기입</div>
	    <div id = "writeCont"><textarea name="url" id="url" cols="74" rows="5" style = "resize : none; border : 3px solid #DDDDDD;"></textarea></div>
	    <div id = "btns">
	        <input type="submit" class = "bottombtn" value = "적용하기" id = "applybtn" onclick="self.close();">
	    </div>
    </form>
    
    <script>

        // 파일이 선택될때 -> 파일을 띄워준다.
        $(document).ready(function(){

        	$("#color").on('change', function(){  // 값이 변경되면

				$("#imgback").css("background-color", $("#color").val());
        		$("#hiddencolor").val($("#color").val());
				
			});
        	
        	
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


    </script>



    
</body>
</html>