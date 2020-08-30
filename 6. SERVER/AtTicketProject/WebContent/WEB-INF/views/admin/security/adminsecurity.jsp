<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        /* 테이블 감싸는 div */
        #security {
            border : 1px solid red;
            width : 700px;
            height : 700px;
            margin: 200px auto;
        }
        

        .standardRule {

            margin-left : 100px;
            width : 700px;
            padding : 10px;
            padding-left : 40px;
            
        }

        /*보안 테이블 */
        #secTable  {
            /* border: 1px solid green; */
            /* height : 500px; */
        }
        #secTable td {
            padding : 5px;
            width : 100px;
            height : 200px;
            /* background-color: black; */
            /* border: 1px solid green; */
        }

        /* 제목을 감싸는 박스 */
        #secSubject {
            /* border: 1px solid red; */
            background-color: #4A91E3;
            color : white;
            width : 690px;
            margin-left : 105px;

        }        

        /* 선택해야 할 것의 제목 */
        #secTitle {
            font-size: 2.5em;
            font-weight:bold;
        }
        
        img {
            width : 100%;
            height : 100%;
        }

        /* 질문에 대한 답을 제출할 것이다. -> 버튼 */
        #answerSubmit {
            margin-top : 30px;
            margin-left : 100px;
            /* border: 1px solid green; */
            width : 700px;
            height: 100px;

        }
        /* 제출하기 혹은 건너뛰기 버튼 */
        #answerSubmitBtn {
            border: 0px;
            width : 150px;
            height : 50px;
            font-size: 1.2em;
            /* font-weight: bold; */
            color : white;
            background-color: #4A91E3;
            margin-left : 460px;
        }

        /* 업데이트 아이콘 */
        #updateIcon {
            /* border : 1px solid red; */
            width : 45px;
            font-size: 2em;
        }
        #updateIcon:hover {
            cursor : pointer;
            font-weight: bold;
        }

        /* 정보를 주는 아이콘 */
        #infoIcon {
            width : 45px;
            font-size: 2em;
        }
        #infoIcon:hover {
            cursor : pointer;
            font-weight: bold;
        }
        
        /* 이미지에 커서를 올렸을때 반응 새로추가한 코드 */
        .images:hover {
            cursor:pointer;
            /* opacity: .4; */
        }
        

    </style>
</head>
<body>
	
	<div id = "secSubject" class = "standardRule" style = "margin-top : 100px;">
            <span id = "secTitle">${throwName}</span><br>이(가) 있는 타일을 모두 선택하세요<br>아무것도 없으면 <span style = "font-weight : bold;">건너뛰기를</span> 클릭하세요
        </div>
        <table id = "secTable" class = "standardRule">
            <tr>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[0]}" alt="" class = "images" id = "img0"></td>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[1]}" alt="" class = "images" id = "img1"></td>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[2]}" alt="" class = "images" id = "img2"></td>
            </tr>
            <tr>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[3]}" alt="" class = "images" id = "img3"></td>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[4]}" alt="" class = "images" id = "img4"></td>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[5]}" alt="" class = "images" id = "img5"></td>
            </tr>
            <tr>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[6]}" alt="" class = "images" id = "img6"></td>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[7]}" alt="" class = "images" id = "img7"></td>
                <td><img src="<%= request.getContextPath() %>/images/securefile/${throwPicList[8]}" alt="" class = "images" id = "img8"></td>
            </tr>
            
        </table>
        
       	
        
    <div id = "answerSubmit">
        <hr style = "border:1px solid #f0f0f0">
        <div style = "float : left;"><span><i class = "glyphicon glyphicon-refresh" id = "updateIcon"></i></span></div>
        <div style = "float : left;"><span><i class = "glyphicon glyphicon-exclamation-sign" id = "infoIcon"></i></span></div>
        <div style = "float : left;"><button id = "answerSubmitBtn">건너뛰기</button></div>
    </div>
	
	
	    <script>

	    //click event 를 걸어야 한다.
        var imges = $(".images");

        var clickNum = new Array();//클릭한 이미지의 번호를 저장할 배열.

        console.log(imges.length);
        console.log(imges[0]);

        var onoffimges = [0,0,0,0,0,0,0,0,0];//0은 눌려지지 않은 상태
        var nextcheck = false;//건너뛰기를 표시할지 제출을 표시할지 정해준다.

        for (var i = 0; i < imges.length ; i++) {
            
            imges[i].onclick = function(){
                
                //눌리고 안눌리고 상태를 정할것이다.
                if (onoffimges[event.srcElement.id.substr(3)] == 0) {
                    
                    onoffimges[event.srcElement.id.substr(3)] = 1;
                    event.srcElement.style.border = "10px solid red";
                    
                } else {
                    
                    onoffimges[event.srcElement.id.substr(3)] = 0;
                    event.srcElement.style.border = "0px";
                    
                } 
                //하나라도 1이 되면 제출하기로 바꿀것임
                for (var i = 0; i < onoffimges.length; i++) {
                    console.log(i);
                    if (onoffimges[i] == 1) {
                        nextcheck = true;
                        break;
                    } else {
                        nextcheck = false;
                    }
                }

                if (nextcheck) {
                    $("#answerSubmitBtn").text("제출하기");        
                } else {
                    $("#answerSubmitBtn").text("건너뛰기");
                }
            }
        }//for
        
        //일단정답을 정해보자
        var myCount = 0;//나의 정답 카운트
        var answer = ${matchCount};//해당 정답개수가 넘어옴
        var title = "${throwSubject}";//정답이 넘어오고
        

        //제출을 눌렀을 경우
        $("#answerSubmitBtn").click(function() {
            console.log("정답");

            for (var i = 0; i < onoffimges.length; i++) {
                if (onoffimges[i] == 1) {
                    if ($("#img" + i).attr("src").includes(title)) {
                        myCount++;     
                    } else {
                        myCount--;
                    }
                }
            }
			
            
            if (myCount == answer) {
                alert("로봇이 아닙니다.");
                opener.close();//부모객체 닫기
             	window.open("/AtTicketProject/adminsecurepass.do");
             	window.close();//부모객체 닫기
                //location.href = "/AtTicketProject/adminsecurepass.do"; 
                
            } else {
                alert("자동로그인 방지");
                window.close();
            }

        });
        
        
        //refresh를 눌렀을 경우...
        $("#updateIcon").click(function(){
        	
        	//popupCenter("/AtTicketProject/adminsecure.do", 1000, 1000);
        	//window.close();
        	//위의 형식으로 해주면 상당히 복잡해진다.. 그냥 페이지 리로드가 더 편한방법
        	location.reload();
        	
        });
        
        
        
        //팝업 중앙정렬 알고리즘
        function popupCenter(href, w, h) {
        	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
        	xPos += window.screenLeft; 
        	var yPos = (document.body.offsetHeight/2) - (h/2);
			
        	//window.open(href, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
        	
        }

        


    </script>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>