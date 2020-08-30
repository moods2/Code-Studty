<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="shortcut icon" href="./images/favicon.ico">
    <link rel="stylesheet" href="css/usermypage.css" />
    <style>

        #right {
            /* border: 1px solid black; */
            float: right;
            width: 850px;
            height: 993px;
            margin-left: 15px;
        }
        #right > h1 {
            font-size: 18px;
            margin-top: 0px;
            color: #444;
        }
        #tbl1 {
            border-collapse: collapse;
            width: 100%;
        }
        #tbl1 th, #tbl1 td {
            border-right: 1px solid #D3D3D3;
            text-align: center;
            font-size: 13px;
            color: #444;
            padding: 10px 0;
        }
        #tbl1 th {
            background-color: #EEE;
            border-top: 3px solid #7A98B4;
            border-bottom: 1px solid #CCC;
        }
        #tbl1 td { border-bottom: 1px solid #CCC; }
        #tbl1 th:nth-child(2) { width: 40%; }
        #tbl1 th:nth-child(3) { width: 20%; }
        #tbl1 th:last-child, #tbl1 td:last-child {
            border-right: 0;
        }
        #tbl1 > tbody > tr > td > div {
            padding: 5px 0;
            text-align: left;
        }
        #tbl1 > tbody > tr > td > button {
            outline: none;
        }
        #tbl1 > tbody > tr > td:nth-child(2) > div > img {
            width: 80px;
            height: 100px;
            float: left;
            margin: 0 10px;
        }
        #tbl1 > tbody > tr > td:nth-child(2) > div > p {
            margin-top: 30px;
            font-size: 12px;
            color: #444;
        }
        #tbl1 > tbody > tr > td:nth-child(3) > p > span {
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
        #tbl1 > tbody > tr > td > button {
            font-weight: bold;
        }
        #paging {
            text-align: center;
            letter-spacing: 1px;
            margin: 40px 0;
        }
        #buttonbox {
            margin-top: 10px;
            text-align: right;
        }
        #buttonbox > input, #buttonbox > button { outline: none; }
        #buttonbox > button > span {
            color: blue;
        }

    </style>
</head>
<body>
    
    <div id="main">
<!-------------------------------- 화면 상단부 -------------------------------->
        <%@include file="/WEB-INF/views/inc/mypagetopbar.jsp" %>
<!-------------------------------- 내용부분 -------------------------------->
        <div id="middle">
            <!-- 마이페이지 좌측 -->
            <%@include file="/WEB-INF/views/inc/mypageleft.jsp" %>

<!----------------------------------------------------------------------------->

            <!-- 마이페이지 우측 -->
            <div id="right">
                <h1>나의 관심 공연</h1>
                <table id="tbl1">
                    <thead>
                        <th>등록일</th>
                        <th>공연명</th>
                        <th>관련 컨텐츠</th>
                        <th>상세정보</th>
                    </thead>
                    <tbody>
                        <c:if test="${empty search and list.size() == 0}">
                        <tr>
                            <td colspan="4">등록한 관심공연이 없습니다.</td>
                        </tr>
                        </c:if>
                        
                    	<c:forEach items="${list}" var="dto">
                        <tr>
                            <td><p>${dto.myShowRegistration }</p><input type="checkbox" class="check cbDelete" name="cbDelete" value="${dto.msseq}"></td>
                            <td>
                                <div>
                                <img src="./images/${dto.myShowPoster}">
                                <strong>${dto.myShowTitle }</strong>
                                <p>${dto.myShowstart } ~ ${dto.myShowend }<br>
                                ${dto.myShowTheater}</p>
                                </div>
                            </td>
                            <td>
                                <p>관련 공지 : <span class="notice">02</span>개</p>
                            </td>
                            <td>
                                <button class="btn btn-danger btn-sm" class="book" onclick="location.href='/AtTicketProject/usertickekting.do?seq=${dto.myShowseq}'">예매하기</button>
                            </td>
                        </tr> 
                        </c:forEach>
                    </tbody>
                </table>
                <div id="buttonbox">
                    <button class="btn btn-default btn-sm" id="add">관심 공연 담기<span>+</span></button>
                    <input type="button" class="btn btn-default btn-sm" value="전체선택" id="selectall">
                    <input type="button" class="btn btn-default btn-sm" value="삭제" id="delete" onclick="deleteMessage()">
                </div>
           		<!-- 페이징 -->
           		${pagebar}
            </div>

            <!-- 챗봇 : 단비봇 -->
            <%@include file="/WEB-INF/views/inc/userchat.jsp" %>
            <!-- 제일 위로 돌아가기 버튼 -->
            <div id="movetop">↑</div>
        </div>
<!-------------------------------- 화면 하단부 -------------------------------->
        <%@include file="/WEB-INF/views/inc/mypagebottom.jsp" %>
    </div>



    <script>

        //관련 컨텐츠 공지 클릭시
        $(".notice").click(function() {
            location.href = "/AtTicketProject/usernotice.do";
        });

        //예매하기 클릭시
        $(".book").click(function() {
            location.href = "";
            // 해당 공연페이지로 이동
        })

        //팝업창 가운데 배치
/*         var popupWidth = 900;
        var popupheight = 650;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        var popupY = (window.screen.height / 2) - (popupheight / 2);
        //관심 공연 담기 팝업창
        $("#add").click(function() {
            window.open("/AtTicketProject/mypageinterestpopup.do","_black",`left=${popupX}, top=${popupY}, width=${popupWidth}, height=${popupheight};`);
        }); */
        
        //관심 공연 담기 팝업창
        $("#add").click(function() {
           popupCenter("/AtTicketProject/mypageinterestpopup.do",1220,600);
        }); 
   
        //팝업창 가운데 배치
        function popupCenter(href, w, h) {
            
            var popupX = (window.screen.width / 2) - (w / 2);
            // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

            var popupY= (window.screen.height /2) - (h / 2);
            // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
            

            window.open(href, "pop_name", 'status=no, height=665, width=1235, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
          
          }

        //전체선택
        $("#selectall").click(function() {
            if ($(".cbDelete").prop("checked")) {
                $(".cbDelete").prop("checked", false);
            } else {
                $(".cbDelete").prop("checked", true);
            }
        });
        
    	function deleteMessage() {
    		
    		if($(".cbDelete:checked").length >0){
    		 	location.href = "/AtTicketProject/myShowDeleteok.do?" + $(".cbDelete").serialize();
    		}else{
    			alert("삭제할 문의내역를 선택하세요.");
    		}
    	}
    	
        //alert(couponSeq.indexOf($('#coupontxt').val()));
		 $("#usermenu p:nth-child(3)").css("color","#4C7CCE");
	    $("#usermenu p:nth-child(3)").mouseout(function(){
	    	$("#usermenu p:nth-child(3)").css("color","#4C7CCE");
	    });

    </script>

</body>
</html>