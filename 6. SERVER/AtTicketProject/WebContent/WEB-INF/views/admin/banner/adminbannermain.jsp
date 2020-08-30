<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminbanner.css">

<meta charset="UTF-8">
<title>Insert title here</title>


<style>
		
		#left {
           position: absolute;
           left: 0px;
           top: 0px;
           width: 250px;
           height: 3000px;
           background-color: #444;
           text-align: center;
           z-index: 10;
       }
	    /* 최상단 타이틀 */
        #title{ 
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
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
            width : 1400px;
            overflow: hidden;
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
            width : 1400px;
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
            height : 330px;

        }
        /* 상단배너 그림 url 가져오기 */
        .topBannerSelect {
            width : 1000px;
            margin : 0px auto;
            display: none;
        }
        .topBannerSelect1 {
        	display: table;
        }
        .topBannerSelect td {
            border: 2px solid #ddd;
            height : 55px;
        }
        .topBannerSelect td:nth-child(1) {
            padding-left : 20px;
            background-color: #f0f0f0;
        }
        .topBannerSelect td:nth-child(2) {
            padding-left : 20px;
        }
        /* 상단배너 이미지 이름 prev next 할때마다 바뀔것이다. */
        #topImgName {
            margin:10px;
            margin-left : 600px;
            font-size: 1.2em;
            font-weight: bold;
        }
        .topBannerInputType {
            width : 98%;
            height : 60%;
            border: 0px;
            
        }
        
        .btn-sm {
        	float: right;
        	margin-right: 20px;
        	box-shadow: none;
        	font-weight: bold;
        }
        
        /* --------------------상단배너 끝----------------------- */


</style>

</head>
<body>

	
	
	<!-- 메인배너 관리하는 페이지 -->
	
    <div id = "title">
        <h1 id = "rltitle">배너관리 <small id = "mainHome"> > 메인배너 관리  </small></h1>
    </div>

	<!-- ------------------------상단배너 관리 시작-------------------------------------------->

    
    <div class = "titlebanner">TOP배너 관리</div>
    <div id = "topbanner">
        <div id = "topcover">
            <div id = "topbaby">
            <c:set var="i" value="1" />
            <c:forEach items="${slide}" var="slide">
                <div class = "topsetting" id="topsetting${i}" style = "background-image: url(../images/${slide.img});"></div>
			<c:set var="i" value="${i + 1}" />
            </c:forEach>
            </div>
        <div id = "topImgName">상단배너 1 번째 사진</div>
        </div>
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
                if (clickCountTop < 8) {
                     positionTopX -= 1400;
                    $("#topbaby").css("transform","translate(" + positionTopX + "px,0px)");
                    //$("#topImgName").text(`상단배너 ${clickCountTop + 2} 번째 사진`);
                    //$("#topImgName").text("${clickCountTop}");
                    var sta1 = "상단배너 ";
                    var one = clickCountTop + 2
                   	var sta2 = " 번째 사진";
                    $("#topImgName").text(sta1 + one + sta2);
                    $(".topBannerSelect").css("display", "none");
                    $(".topBannerSelect" + one).css("display", "table");
                    clickCountTop++;
                }
        });
        //이전페이지를 눌렀을 때
        $("#mainprev").click(function(){
                if (clickCountTop > 0) {
                     positionTopX += 1400;
                    $("#topbaby").css("transform","translate(" + positionTopX + "px,0px)");
                    //$("#topImgName").text(`상단배너 ${clickCountTop} 번째 사진`);
                   	var sta1 = "상단배너 ";
                    var one = clickCountTop;
                   	var sta2 = " 번째 사진";
                   	$("#topImgName").text(sta1 + one + sta2);
                   	$(".topBannerSelect").css("display", "none");
                   	$(".topBannerSelect" + one).css("display", "table");
                    clickCountTop--;
                }
        });
        
        $(document).ready(function(){
        		
			$(".topBannerInputType").on('change', function(){  // 값이 변경되면
				
				var id = $(this).attr("id").replace("pic", "");
				if(window.FileReader){  // modern browser
					var filename = $(this)[0].files[0].name;
				} 
				else {  // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				}

				$("#topsetting" + id).css("background-image", "url(../images/" + filename + ")");
				
			});
				
		});
        
        
    </script>
    
    <!-- 상단배너 그림을 고르기 -->
    <div class = "bannerTool" style = "margin-left: 330px; width : 1400px">
    	<c:set var="i" value="1" />
        <c:forEach items="${slide}" var="slide">
    	<form method="POST" action="/AtTicketProject/admin/adminbannermainend.do" id="form${i}">
	        <table class="topBannerSelect topBannerSelect${i}">
	            <tr>
	                <td>상단배너 <span>${i}</span>번째 사진 선택</td>
	                <td style = "padding-top : 5px;"><input type="file" class = "topBannerInputType" id="pic${i}" name="pic"></td>
	            </tr>
	            <tr>
	                <td>상단 기입 내용</td>
	                <td><input type="text" class = "topBannerInputType" id="top${i}" name="top" value="${slide.intro1}"></td>
	            </tr>
	            <tr>
	                <td>중간 기입 내용</td>
	                <td style = "height: 100px; padding-top : 5px;"><textarea id="middle${i}" name="middle" 
	                cols="30" rows="3" style = "resize : none; width : 97%; height : 80%; border : 0px;">${slide.intro2}</textarea></td>
	            </tr>
	            <tr>
	                <td>하단 기입 내용</td>
	                <td><input type="text" class="topBannerInputType" id="bottom${i}" name="bottom" value="${slide.intro3}"></td>
	            </tr>
	            <tr>
	                <td>기입 내용 글자색 지정</td>
	                <td>
	                <input type="color" style="width: 300px;" id="color${i}" name="color" value="${slide.fontcolor}">
	                <input type="hidden" name="num" value="${i}">
	                <input type="submit" class="btn btn-default btn-sm" value="저장" style="outline: none;">
	                </td>
	            </tr>
	        </table>
		</form>          
        <c:set var="i" value="${i + 1}" />
        </c:forEach>
    </div>

    <hr class = "splitHr">

    

    <!--------------------------- 상단배너 관리 끝------------------------------------------------->



    <!--------------------------- 중간배너 시작------------------------------------------------->
    <style>
        /* 중간배너 */
        #middleBanner {
            /* border: 1px solid black; */
            margin-top : 20px;
            margin-left : 280px;
            width : 1500px;
            height : 440px;
            background-color: #F0F0F0;
            padding-top: 50px;
            padding-left : 50px;
        }
        /* 중간배너에 들어가는 이미지 컨테이너 */
        #middleImg {
            /* border: 1px solid red; */
            width: 1400px;
            height : 320px;
            margin-top : 10px;
        }

        #middleImg img {
            width : 100%;
            height : 100%;
            transition: all 1s;
        }
        /* 중간배너 수정버튼 */
        #mdBtn {
            position : relative;
            border: 1px solid #ddd;
            top : -180px;
            left : 575px;
            width : 200px;
            height : 60px;
            margin-left: 25px;
            visibility: hidden;
        }
        /* 수정버튼에 마우스 대면  */
        #mdBtn:hover {
            font-weight: bold;
            background-color: #ddd;
        }
        
        
    </style>
    
    <form method="POST" action="/AtTicketProject/admin/adminbannermainend.do">
    <div class = "titlebanner"> MIDDLE 배너 관리</div>  
    <div id = "middleBanner">
        <div id = "middleImg" style="background-color: ${banner.backcolor}">
            <img src="<%= request.getContextPath() %>/images/${banner.img}" alt="" id = "middlePic">
            <div id = "mdEditBtn"><button type="button" id = "mdBtn">수정하기</button></div>  
        </div>
        <input type="hidden" name="middleBackcolor" id="middleBackcolor">
        <input type="hidden" name="middleSrc" id="middleSrc">
    </div>


    <script>
    
    	console.log("${filename}");
    	console.log("${bgcolor}");
    	
    	<c:if test="${filename != null}">
    		$("#middlePic").attr("src", "<%= request.getContextPath() %>/images/${filename}");
		</c:if>
		<c:if test="${bgcolor != null}">
    		$("#middleImg").css("background-color", "${bgcolor}");
    	</c:if>
    	
        //이미지 box 내에 마우스를 넣었을때 수정버튼이 보여야한다 -> 배경색도 어둡게 처리
        $("#middleImg").mouseenter(function(){
            $("#mdBtn").css("visibility","visible");
            $("#middlePic").css("opacity",".2");
            
        });

        //마우스 뗏을때 
        $("#middleImg").mouseleave(function(){
            $("#mdBtn").css("visibility","hidden");
            $("#middlePic").css("opacity","1");
        }); 


        // 마우스 클릭 했을 때 -> 나중에 서버때문에 일단 만들어둠
        $("#mdBtn").click(function(){
            //console.log("클릭함");
            window.name = "parentPage";
            window.open("/AtTicketProject/admin/adminbannermodify.do", "adminbanner", "width=1250,height=950");
        });
        
        function rgb2hex(rgb) {
            rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
            function hex(x) {
                return ("0" + parseInt(x).toString(16)).slice(-2);
            }
            return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
        };
        
        $("#middleBackcolor").val(rgb2hex($("#middleImg").css("background-color")));
        $("#middleSrc").val($("#middlePic").attr("src").substring($("#middlePic").attr("src").lastIndexOf('/')).substring(1));
        
    </script>

    <hr class = "splitHr">

    <!--------------------------- 중간배너 끝------------------------------------------------->

    
    
    
    <!--------------------------- 하단페이지 시작 ------------------------------------------------->
        
    <style>
        /* 하단페이지 컨테이너 */
        #btmBanner {
            /* border: 1px solid red; */
            margin-top : 20px;
            margin-left : 280px;
            width : 1500px;
            height : 850px;
            /* background-color: #F0F0F0; */
            padding-top: 20px;
            padding-left : 8px;
        }
        /* 소제목 배너 */
        .subtitlebanner {
            /* border-bottom: 2px solid #ddd; */
            height : 40px;
            width : 150px;
            font-size: 1.3em;
            margin-top : 20px;
        }
        /* bottom 배너 컨테이너 통일양식 */
        .intBtmBanner {
            /* border: 1px solid orange; */
            width : 1430px;
            margin: 0px auto;
            height : 300px;
        }

        /* 회사 로고변경 */
        #logoModify {
            /* border: 1px solid blue; */
            width : 300px;
            height : 300px;
            /* background-color: black; */
        }
        
        /* 회사 로고 이미지 컨테이너*/
        #innerLogo {
            /* border: 1px solid green; */
            width : 300px;
            height : 300px;
            /* background-color: black; */
            transition: all 1s;
        }
        /* 회사 로고 이미지*/
        #innerLogoImg {
            width : 100%;
            height : 100%;
            transition: all 1s;
        }
        /* 회사 로고 수정하기 버튼 */
        #compLogoBtn {
            
            border: 1px solid #ddd;
            width : 200px;
            height: 60px;
            visibility: hidden;
        }
        #compLogoBtns {
            position : relative;
            /* border: 1px solid red; */
            width : 202px;
            top : -180px;
            left : 50px;
        }
        #compLogoBtn:hover {
            background-color: #ddd;
            font-weight: bold;
        }


        /* 세부내용 */
        #compDetailTbl {
            /* border: 1px solid #D2D2D2; */
            width : 700px;
            height : 300px;
        }
        #compDetailTbl td{
            /* border: 1px solid red; */
        }
        #compDetailTbl td{
            /* border: 1px solid red; */
            border: 2px solid #D2D2D2;

        }
        #compDetailTbl td:nth-child(1){
            width : 200px;
            padding-left : 20px;
            background-color: #F0F0F0;
        }
        /* 세부내용 둘째 열 내부*/
        #compDetailTbl td:nth-child(2) input{
            border: 0px;
            margin-left : 20px;
            width : 90%;
            height : 60%;
        }
    </style>
    
    
    <div class = "titlebanner">BOTTOM 배너 관리</div>
    <div id = "btmBanner">
        <!-- 회사 로고 수정 -->
        <div class = "subtitlebanner">회사로고 수정</div>
        <div id = "logoModify" class = "intBtmBanner" style = "margin-left : 30px;">
            <div id = "innerLogo"><img src="<%= request.getContextPath() %>/images/${logo.img}" alt="" id = "innerLogoImg"></div>
            <div id = "compLogoBtns"><input type="button" value = "수정하기" id = "compLogoBtn"></div>
            <input type="hidden" name="logoImg" id="logoImg">
        </div>
        
        <!-- 세부내용 -->
        <div class = "subtitlebanner">세부내용</div>
        <div class = "intBtmBanner">
            <table id = "compDetailTbl" >
                <tr>
                    <td>회사명</td>
                    <td><input type="text" id = "compName" name="compName" value = "${logo.company}"></td>
                </tr>
                <tr>
                    <td>회사 주소</td>
                    <td><input type="text" id = "compAddress" name="compAddress" value = "${logo.address}"></td>
                </tr>
                <tr>
                    <td>대표자</td>
                    <td><input type="text" id = "compOwner" name="compOwner" value = "${logo.owner}"></td>
                </tr>
                <tr>
                    <td>개인정보 보호 책임자</td>
                    <td><input type="text" id = "compManager" name="compManager" value = "${logo.manager}"></td>
                </tr>
                <tr>
                    <td>회사 이메일</td>
                    <td><input type="text" id = "compEmail" name="compEmail" value = "${logo.email}"></td>
                </tr>
                <tr>
                    <td>사업자 등록번호</td>
                    <td><input type="text" id = "compLicense" name="compLicense" value = "${logo.license}"></td>
                </tr>
            </table>
        </div>
    </div>

    <script>
        // 이미지 수정 버튼 관련 이벤트
        
        //로고에 커서를 가져다 대면 변한다
        $("#logoModify").mouseenter(function(){
            $("#innerLogo").css("background-color","black");
            $("#innerLogoImg").css("opacity",".2");
            $("#compLogoBtn").css("visibility","visible");
        });

        // 로고에서 커서를 뗏을 떄
        $("#logoModify").mouseleave(function(){
            $("#innerLogo").css("background-color","#fff");
            $("#innerLogoImg").css("opacity","1");
            $("#compLogoBtn").css("visibility","hidden");
        });

    </script>
    <hr class = "splitHr"> 

    
    <!---------------------------하단페이지 끝 ------------------------------------------------->
    
    
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
    
    
    <div><input type="submit" value = "저장하기" id = "saveBtn"></div>
	</form>
	
    <script>
    
    	$("#logoImg").val($("#innerLogoImg").attr("src").substring($("#innerLogoImg").attr("src").lastIndexOf('/')).substring(1));
    	
        //저장하기 눌렀을때 이벤트
        $("#saveBtn").click(function(){
            if (confirm("해당 내용을 저장하시겠습니까?")) {
                alert($("#middleBackcolor").val());
                alert($("#middleSrc").val());
                alert($("#logoImg").val());
                alert($("#compName").val());
                alert("저장 완료.");
            }    
        });

    </script>
    <!---------------------------내용 저장하기 끝------------------------------------------------->


	<%@include file="/WEB-INF/views/inc/menu.jsp" %>


<script>

	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
	
</script>


</body>
</html>