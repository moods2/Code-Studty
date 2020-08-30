<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminbanner.css">

    <style>

        /* 최상단 타이틀 */
        #title{ 
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        .basicBox {
            /* border: 1px solid red; */
            margin-left: 330px;
            margin-top: 50px;
            width: 1400px;
            height : 540px;
            /* border: 1px solid black; */
            padding: 20px;
        }


        /* 그리드 사용 */
        .wrapper {
            width : 1400px;
            height : 600px;
            display : grid;
            grid-template-columns: 700px 700px;
            grid-template-rows: 100px 100px;
            /* border: 1px solid red; */
            margin-left : 330px;
            margin-top : 20px;
            
        }
        .wrapper div {
            /* border : 1px solid blue; */
        }
        .wrapper div:nth-child(1) {
            /* background-color: #F4F4F4; */
            width : 280px;
            /* margin-left : 20px; */
        }
        .wrapper div:nth-child(2) {
            margin-left : 10px;
            /* background-color: #F4F4F4; */
            width : 280px;

        }
        
        .wrapper div:nth-child(3) {
            margin-top : 10px;
            height : 500px;
            border: 3px solid #EEEEEE;
        }
        .wrapper div:nth-child(4) {
            margin-left : 10px;
            margin-top : 10px;
            height : 500px;
            border: 3px solid #EEEEEE;

        }
        

        /* 배너 타이틀 제목 -> 어떤 배너인지 구분해주는 것임 */
        .titlebanner {
            margin-top : 50px;
            margin-left : 280px;
            font-size: 1.6em;
            font-weight: bold;
        }

        .splitHr {
            border: 1px solid #ddd;
            width : 1500px;
            margin-left: 280px;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        /* --------------------상단배너 시작----------------------- */
        /* 상단배너 */
        #topbanner {
            /* border: 1px solid red; */
            margin-top : 20px;
            margin-left : 280px;
            width : 1500px;
            height : 500px;
            background-color: #F0F0F0;
            padding-top: 50px;
            padding-left : 50px;
        }
        /* 사진들을 감싸는 객체 */
        #topcover {
            /* border : 1px solid blue; */
            width : 450px;
            overflow: hidden;
            margin: 0 auto;
        }
        /*상단배너 자식*/
        #topbaby {
            position : relative;
            /* border: 1px solid green; */
            height : 400px;
            width : 13000px;
            transition: all 1.3s;
        }
        /* 상단배너 자식 floating 시킨다. */
        #topbaby div {
            float: left;
            width : 450px;
            height : 400px;
        }
        /* 상단배너 배경의 속성 */
        .topsetting {
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        
        /* 상단배너 prev */
        #mainprev {
            position : absolute;
            top : 430px;
            left : 280px;
        }
        #mainprev:hover {
            cursor : pointer;
        }
        
        /* 상단배너 next */
        #mainnext {
            position : absolute;
            top : 430px;
            left : 1730px;
        }
        #mainnext:hover {
            cursor:pointer;
        }
        
        /* 전체 배너 선택들의 길이조정 너비조정 */
        .bannerTool {
            /* border : 1px solid red; */
            margin-top : 20px;
            margin-left : 280px;
            width : 1500px;
            height : 320px;

        }
        /* 상단배너 그림 url 가져오기 */
        #topBannerSelect {
            border: 1px solid blue;
            width : 1000px;
            margin : 0px auto;
            

        }
        #topBannerSelect td {
            border: 2px solid #ddd;
            height : 35px;
        }
        #topBannerSelect td:nth-child(1) {
            padding-left : 20px;
            background-color: #f0f0f0;
        }
        #topBannerSelect td:nth-child(2) {
            padding-left : 20px;
        }
        /* 상단배너 이미지 이름 prev next 할때마다 바뀔것이다. */
        #topImgName {
            /* border: 1px solid black; */
            width: 450px;
            text-align: center;
            margin:10px auto;
            /* margin-left : 600px; */
            font-size: 1.2em;
            font-weight: bold;
        }


    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminBannerDisplay</title>
</head>

<body>
    <!-- 메인배너 관리하는 페이지 -->

    <div id = "title">
        <h1 id = "rltitle">전시 배너 관리 <small id = "mainHome"> > 배너 관리  </small></h1>
    </div>
    
    <!-- ------------------------상단배너 관리 시작-------------------------------------------->
    <div class = "titlebanner">상단배너 관리</div>
    <div id = "topbanner">
        <div id = "topcover">
            <div id = "topbaby">
                <div class = "topsetting" style = "background-image: url(../images/Exhibitionslide1.jpeg);"></div>
                <div class = "topsetting" style = "background-image: url(../images/Exhibitionslide2.jpeg);"></div>
                <div class = "topsetting" style = "background-image: url(../images/Exhibitionslide3.jpeg);"></div>
                <div class = "topsetting" style = "background-image: url(../images/Exhibitionslide4.jpeg);"></div>
                <div class = "topsetting" style = "background-image: url(../images/Exhibitionslide5.jpeg);"></div>
            </div>
        </div>
        <div id = "topImgName">상단배너 1 번째 사진</div>
    </div>
    
    <div><img src="../images/slide-dir-prev.png" alt="" id = "mainprev"></div>
    <div><img src="../images/slide-dir-next.png" alt="" id = "mainnext"></div>
    
    <!-- 사진 움직이게 하려는 컨트롤 -->
    <script>

        var positionTopX = 0;//look 의 x좌표
        var clickCountTop = 0;//페이지가 계속 넘어가면 안되므로 제한을 걸어준다
        // 다음 페이지를 눌렀을 때
        $("#mainnext").click(function(){
            console.log("asd");
                if (clickCountTop < 4) {
                     positionTopX -= 450;
                    $("#topbaby").css("transform","translate(" + positionTopX + "px,0px)");
                    //document.getElementById("topImgName").textContent = parseInt(clickCountTop + 2) + " 번째 사진";
                    //$("#topImgName").text(`상단배너 ${clickCountTop + 2} 번째 사진`);
                    var sta1 = "상단배너 ";
                    var one = clickCountTop + 2
                   	var sta2 = " 번째 사진";
                    $("#topImgName").text(sta1 + one + sta2);
                    clickCountTop++;
                }
        });
        //이전페이지를 눌렀을 때
        $("#mainprev").click(function(){
                if (clickCountTop > 0) {
                     positionTopX += 450;
                    $("#topbaby").css("transform","translate(" + positionTopX + "px,0px)");
                    //$("#topImgName").text(`상단배너 ${clickCountTop} 번째 사진`);
                    var sta1 = "상단배너 ";
                    var one = clickCountTop;
                   	var sta2 = " 번째 사진";
                   	$("#topImgName").text(sta1 + one + sta2);
                    
                    clickCountTop--;
                }
        });
        
    </script>
    <!-- 상단배너 그림을 고르기 -->
    <div class = "bannerTool" style = "margin-left: 330px; width : 1400px">
        <table id = "topBannerSelect">
            <tr>
                <td>상단배너 1번째 사진</td>
                <td><input type="file"></td>
            </tr>
            <tr>
                <td>상단배너 2번째 사진</td>
                <td><input type="file"></td>
            </tr>
            <tr>
                <td>상단배너 3번째 사진</td>
                <td><input type="file"></td>
            </tr>
            <tr>
                <td>상단배너 4번째 사진</td>
                <td><input type="file"></td>
            </tr>
            <tr>
                <td>상단배너 5번째 사진</td>
                <td><input type="file"></td>
            </tr>
        </table>
    </div>

    <hr class = "splitHr">

    

    <!--------------------------- 상단배너 관리 끝------------------------------------------------->





       <!--------------------------- 중간배너 시작------------------------------------------------->
       <style>
        #mbanner {
            /* border: 1px solid black; */
            margin-top : 20px;
            margin-left : 280px;
            width : 1500px;
            height : 500px;
            background-color: #F0F0F0;
            padding-top: 50px;
            padding-left : 8px;
        }

        .mPicture {
            /* border: 1px solid red; */
            margin-left:15px;
            width : 1400px;
            height : 200px;
            /* height : 100px; */
            float: left;
            background-color: black;
        }

        .mPicture img {
            width : 100%;
            height : 100%;
            transition: all 1s;
        }
        /* 이미지 내 수정 버튼 */
        .mEditBtn {
            position : relative;
            /* border: 1px solid orange; */
            top : -120px;
            left : 570px;
            /* margin: 0 auto; */
        }
        .mEditBtn button {
            width : 200px;
            height : 60px;
            margin-left: 14px;
            border: 1px solid #ddd;
            visibility: hidden;
        }
        /* 수정 버튼에 커서를 올렸을떄 */
        .mEditBtn button:hover {
            background-color: #ddd;
            font-weight: bold;
        }
    </style>

    <div class = "titlebanner">MIDDLE 배너 관리</div>    
    
    <div id = "mbanner">
        <div class = "mPicture" id = "mOpen1">
            <img src="../images/exhibition_banner2.jpeg" alt="">
            <div class = "mEditBtn"><button id = "mBtn1">수정하기</button></div>
        </div>
        <div class = "mPicture" id = "mOpen2">
            <img src="../images/exhibition_banner.jpeg" alt="">
            <div class = "mEditBtn"><button id = "mBtn2">수정하기</button></div>
        </div>
    </div>

    <!-- 이미지위에 올리면 수정버튼이 떠야한다 -->
    <script>
        
        for (var i = 1; i <= 6; i++) {
            //사진 영역 내에 마우스 커서를 올렸을 때
            //$(`#mOpen${i}`).mouseenter(function(){
            $("#mOpen" + i).mouseenter(function(){
                //console.log($(this).context.id);
                // console.log($(this).context.id);
                $("#" + $(this).context.id + " button").css("visibility","visible")
                $("#" + $(this).context.id + " img").css("opacity",".2");
            });

            // 수정 버튼을 클릭했을때
            //$(`#mBtn${i}`).click(function(){
            $("#mBtn" + i).click(function(){
                console.log($(this)[0].id);
            })
            //사진 영역 내에 마우스 커서를 똇을 때
            //$(`#mOpen${i}`).mouseleave(function(){
            $("#mOpen"+i).mouseleave(function(){
                console.log($(this).context.id);
                $("#" + $(this).context.id + " button").css("visibility","hidden");
                $("#" + $(this).context.id + " img").css("opacity","1");
            }); 
            

        }

    </script>

    <hr class = "splitHr">    

    
    <!--------------------------- 중간배너 끝------------------------------------------------->



    <!---------------------------내용 저장하기 시작------------------------------------------------->
    <style>
        #saveBtn {
            margin-top : 30px;
            margin-left : 930px;
            width : 200px;
            height: 60px;
            font-size: 1.3em;
            border: 1px solid #ddd;
        }
        #saveBtn:hover {
            background-color: #ddd;
            font-weight: bold;
        }
    </style>
    
    
    <div><input type="button" value = "저장하기" id = "saveBtn"></div>

    <script>
        //저장하기 눌렀을때 이벤트
        $("#saveBtn").click(function(){
            if (confirm("해당 내용을 저장하시겠습니까?")) {
                alert("저장 완료.");

                location.href = "./adminMain.html";
            }    
        });

    </script>
    <!---------------------------내용 저장하기 끝------------------------------------------------->

 	<%@include file="/WEB-INF/views/inc/menu.jsp" %>


</body>


<script>
<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
</script>

</html>