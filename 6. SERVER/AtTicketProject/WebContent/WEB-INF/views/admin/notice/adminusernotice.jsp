<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminbanner.css">
<meta charset="UTF-8">
<title>Admin</title>

<style>
        /* 매인배너 타이틀 */

       #left {
           position: absolute;
           left: 0px;
           top: 0px;
           width: 250px;
           height: 2800px;
           background-color: #444;
           text-align: center;
           z-index: 10;
       }
        
        #bannermg {
            border : 0px;
            border-radius: 5px;
            background-color: #444444;
            outline: none;
            margin : 20px;
            margin-top : 50px;
            font-weight: border;
            color : rgb(220,220,220);
            height : 40px;
            margin-left : -100px; 
        }
        
        #bannermg:hover {
            color : white;
        }
        #mainBanner {
            width :1500px;
            height : 700px;
            margin-left : 280px; 
            margin-bottom: 20px;
        }
        
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }
        
       /* 구분선 */
      .splitHr {
          margin-top : 40px;
          border : 1px solid #999999;
          margin-left : 280px;
          width : 1500px;
      }
	
	 tr td:nth-child(4) a{
           text-decoration:none;
           color:black;
      } 
        
     tr td:nth-child(4) a:hover{
           color:red;
           
     } 

</style>

</head>
<body>
	
	
	<!-- 최상단 -->
    <div id = "title">
        <h1 id = "rltitle">공지사항 <small id = "mainHome"> > Home  </small></h1>
    </div>
	
   <!-------------------------- 회원공지 메인배너 관리 시작 -------------------------->
    <style>
       
       
       /* 배너 타이틀 */
       #banner {
            color:#333;
            padding : 20px;
            width : 400px;
            font-weight: bold;
            font-size: 1.5em;
            padding-top : 60px;
            margin-left : 10px;
        }
        
        
        #slctp1, #slctp2 {
          /*   float : left; */
            /* margin-left : 100px; */
            margin-bottom: 0px;
        }
        #slctp1 {
             margin-left : -10px; 
            /* margin-bottom:-10px; */
        }

        #slctp2 {
            margin-top : 10px;
           /*  margin : 10px auto; */
            margin-bottom: 10px;
            width : 300px;
            /* margin-left: 792px; */
        }
        #searchlogo:hover {
            cursor: pointer;
        }

        #manipulate {
            margin-left: 1085px;
        }
        /* 수정하는 버튼  */
        .edit {
            width : 120px;
            height : 50px;
            border: 0px;
            font-size: 1.3em;
            font-weight: bold;
            margin: auto 30px;
            margin-top : 80px;
            background-color: #D5D5D5;
            color:#333;
            border-radius: 10px;
            visibility: hidden;
        }
        
        /* 배너 내에 들어가는 이미지*/
        .bannerImg {
            width : 300px;
            height : 430px;
            margin : 20px;
            margin-top : 30px;
            float : left;
        }
        #inbanner1 {
            background-image: url("../images/theater14.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #inbanner2 {
            background-image: url("../images/theater16.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #inbanner3 {
            background-image: url("../images/theater11.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #inbanner4 {
            background-image: url("../images/theater2.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #inbanner5 {
            background-image: url("../images/theater9.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #inbanner6 {
            background-image: url("../images/theater5.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #inbanner7 {
            background-image: url("../images/theater13.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #inbanner8 {
            background-image: url("../images/theater20.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }

          /* 이미지 배너 내에 들어가는 화살표 */
        /* 이전 표시 */
        #lookprev {
            position : absolute;
            /* z-index : 1px; */
            top : 450px;
            left : 310px;
        }
        #lookprev:hover {
            cursor : pointer;
        }   
        /* 다음 표시 */
        #looknext {
            position : absolute;
            top : 450px;
            left : 1700px;
        }
        #looknext:hover{
            cursor : pointer;
        }
        /* 클라이언트에게 보여질 그림들~~~-> 오버플로우 시켜서 그림이 차례대로 보이게 해야한다. */
        #seeBanner {
            width : 1360px;
            height : 500px;
            overflow: hidden;
        }

        #look {
            /* border:1px solid red; */
            width : 5000px;
            height : 500px;
            transition: all 1s;
            position:relative;
        }

        /* 내부에 들어가는 요소집합 -> 수정버튼과 내용버튼을 감싸는 div 태그라고 보면 된다. */
        .inner {
            width : 250px; 
            height : 150px;
            /* border : 1px solid orange; */
            display: inline-block;
            visibility: hidden;
        }
		
        /* 이미지 내 수정버튼 */
        .innerbtn1 {
            width : 200px;
            height : 50px;
            font-weight: bold;
            font-size: 1.3em;
            border-radius: 10px;
            background-color: #F0F0F0;
            margin-left : 25px;
            border: 0px;

        }
        /* 버튼에 커서를 올렸을때 반응 */
        .innerbtn1:hover{
            background-color: #D5D5D5;
        }
        /* 이미지 내 내용 */
        .innercontxt {
            border: 0px;
            background-color: #F0F0F0;

        }


    </style>
    
    
    <div id = "mainBanner" style = "padding : 0px; padding-left : 70px; background-color: #F0F0F0;">
        <div id = "banner" style = "font-size : 1.6em;">
            회원 공지 메인배너 관리
        </div>

        <div id = "lookprev" ><img src="../images/slide-dir-prev.png" alt=""></div>
        <div id = "looknext"><img src="../images/slide-dir-next.png" alt=""></div>
        
        <!-- seeBanner -->
        <div id = "seeBanner">
            <div id = "look">
                <!-- 첫번째 그림 -->
                <div class = "bannerImg" id = "inbanner1"></div>
                <div class = "inner" id = "inner1" style = "transform: translate(-2675px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn1">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>

                <!-- 두번째 그림 -->
                <div class = "bannerImg" id = "inbanner2"></div>         
                <div class = "inner" id = "inner2" style = "transform: translate(-2590px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn2">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>     
                <!-- 세번째 그림 -->
                <div class = "bannerImg" id = "inbanner3"></div>
                <div class = "inner" id = "inner3" style = "transform: translate(-2505px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn3">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>
                <!-- 네번쨰 그림 -->
                <div class = "bannerImg" id = "inbanner4"></div>
                <div class = "inner" id = "inner4" style = "transform: translate(-2418px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn4">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>
                <!-- 다섯번째 그림 -->
                <div class = "bannerImg" id = "inbanner5"></div>
                <div class = "inner" id = "inner5"style = "transform: translate(-2330px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn5">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>
                <!-- 여섯번째 그림 -->
                <div class = "bannerImg" id = "inbanner6"></div>
                <div class = "inner" id = "inner6" style = "transform: translate(-2244px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn6">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>
                <!-- 일곱번쨰 그림 -->
                <div class = "bannerImg" id = "inbanner7"></div>
                <div class = "inner" id = "inner7" style = "transform: translate(-2159px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn7">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>
                <!-- 여덜번째 그림 -->
                <div class = "bannerImg" id = "inbanner8"></div>
                <div class = "inner" id = "inner8" style = "transform: translate(-2072px,200px);">
                    <input type="button" value = "수정하기" class = "innerbtn1" id = "modbtn8">
                    <pre style = "margin: 10px;" class = "innercontxt">
2020.07.06(목) 16:00
	
뮤지컬 [머더발라드] 2020...</pre>                
                </div>
            
            
            </div>

        </div>
        
    </div>

	<script>
	

    // 배너사진 효과 수정**
    
    
    var positionX = 0;//look 의 x좌표
    var positionY = 0;//look 의 y좌표
    var clickCountLook = 0;//페이지가 계속 넘어가면 안되므로 제한을 걸어준다
    
    // 이전페이지를 눌렀을 경우
    $("#lookprev").click(function(){
        if(clickCountLook > 0) {
            positionX += 340;
            $("#look").css("transform","translate(" + positionX +"px,0px)");
            clickCountLook--;  
        }
    });

    // 다음 페이지를 눌렀을 경우
    $("#looknext").click(function(){
        if(clickCountLook < 4) {
            positionX -= 340;
            $("#look").css("transform","translate(" + positionX +"px,0px)");   
            clickCountLook++;
        }
    });

    var imgId;//현재 건드린 이미지 아이디
    
    // 이미지에 커서를 올린 경우
    $(".bannerImg").mouseenter(function(){
        $(event.srcElement).css("filter","opacity(.4)");
        imgId = event.srcElement.id;
        console.log(imgId)        
        
        if (imgId == "inbanner1") {
            $("#inner1").css("visibility","visible");
            $("#inner1").mouseenter(function(){
                $("#inner1").css("visibility","visible");
                $("#inbanner1").css("filter","opacity(.4)");
            })
        } else if (imgId == "inbanner2") {
            $("#inner2").css("visibility","visible");
            $("#inner2").mouseenter(function(){
                $("#inner2").css("visibility","visible");
                $("#inbanner2").css("filter","opacity(.4)");
            })
        } else if (imgId == "inbanner3") {
            $("#inner3").css("visibility","visible");
            $("#inner3").mouseenter(function(){
                $("#inner3").css("visibility","visible");
                $("#inbanner3").css("filter","opacity(.4)");
            })
        } else if (imgId == "inbanner4") {
            $("#inner4").css("visibility","visible");
            $("#inner4").mouseenter(function(){
                $("#inner4").css("visibility","visible");
                $("#inbanner4").css("filter","opacity(.4)");
            })
        } else if (imgId == "inbanner5") {
            $("#inner5").css("visibility","visible");
            $("#inner5").mouseenter(function(){
                $("#inner5").css("visibility","visible");
                $("#inbanner5").css("filter","opacity(.4)");
            })
        } else if (imgId == "inbanner6") {
            $("#inner6").css("visibility","visible");
            $("#inner6").mouseenter(function(){
                $("#inner6").css("visibility","visible");
                $("#inbanner6").css("filter","opacity(.4)");
            })
        } else if (imgId == "inbanner7") {
            $("#inner7").css("visibility","visible");
            $("#inner7").mouseenter(function(){
                $("#inner7").css("visibility","visible");
                $("#inbanner7").css("filter","opacity(.4)");
            })
        } else if (imgId == "inbanner8") {
            $("#inner8").css("visibility","visible");
            $("#inner8").mouseenter(function(){
                $("#inner8").css("visibility","visible");
                $("#inbanner8").css("filter","opacity(.4)");
            })
        }
    
    });
     


    // 이미지에 커서를 뗀 경우
    $(".bannerImg").mouseleave(function(){
        // $(event.srcElement).css("filter","opacity(1)")
        for(var i = 1; i <= 8; i++) {
            $("#inbanner"+i).css("filter","opacity(1)");
        }

        $(".inner").css("visibility","hidden");
    });


	</script>


    <!-------------------------- 회원공지 메인배너 관리 끝 -------------------------->
    <hr class = "splitHr">
    

    <!-------------------------------------------- 회원대상 공지사항  게시판 시작 ------------------------------------------->	

    <style>
        #selectable {
            width : 1330px; 
            margin-left : 350px;
            height : 1100px;
        }
        .selectNotice {
                width : 80px;
                /* text-align: center; */
                margin: 10px 0px;
                margin-bottom: -10px;
                background-color: white;
                border : 0px;
                height : 20px;
                border-right: 1px solid #999;
                color : #777;
                padding: 0px;
                /* padding-left : -120px; */
                padding-right: 5px;
                font-size: 1.1em;
        }
        .selectNotice:last-child {
            border-right: 0px;
        }

        .selectNotice:hover {
            color : #111;
            font-weight: bold;
        }


        /* 고객들을 위한 공지 */
        #nttable {
            margin-left : 0px;
        }
        #nttable th {
            background-color:  #999;
            /* color : white; */
        }
        #nttable th:nth-child(1) {width : 25px;}
        #nttable th:nth-child(2) {width : 50px;}
        #nttable th:nth-child(3) {width : 130px;}
        #nttable th:nth-child(4) {width : 775px;}
        #nttable th:nth-child(5) {width : 200px;}
        #nttable th:nth-child(6) {width : 300px;}
        #nttable th:nth-child(7) {width : 100px;}


        #nttable tbody td {
            text-align: center;

        }

        #nttable tbody td:nth-child(3) {
            text-align: left;
            padding-left: 20px;
        }


        #nttable > tbody > tr > td:nth-child(4):hover {
            cursor : pointer;
            text-decoration: underline;
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
        }
        /* .pagebar {
            margin-left : 400px;
        } */
        
        /* 게시판 th 관리 */
        .tableth {
            text-align: center;
        }

       .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
           background-color:#999999;
           border-color: #eeeeee;
       }
        
      .pagination > li > a, .pagination > li > span{
          color: black;
      }

	
		.selectNotice.active {
			font-weight: bold;
		}
		
		/* #tt{
			border:1px solid black;
		}
		
		#tt td{
			border:1px solid black;
		}  */

    </style>

    <!-- 등록순 오름차순 조회순 -->
	<div id="selectable">
    <table style="margin:15px 0px;width:100%;" id = "tt">
    <tr>
		<td style="width:250px;">
				<div class="tableInnerTitle">회원 대상 공지</div>
				<div style="width:300px;" id="slctp1">
					<button class="selectNotice" style="outline: none;"
						onclick="location.href='/AtTicketProject/usernotice/adminusernotice.do?page=${page}&search=${search}&sort=regdate';">등록순</button>
					<button class="selectNotice" style="outline: none;"
						onclick="location.href='/AtTicketProject/usernotice/adminusernotice.do?page=${page}&search=${search}&sort=seq1';">오름차순</button>
					<button class="selectNotice" style="outline: none;"
						onclick="location.href='/AtTicketProject/usernotice/adminusernotice.do?page=${page}&search=${search}&sort=seq';">내림차순</button>
				</div>
		</td>
		<td style="text-align:center;width=500px;">
			<c:if test="${not empty search}">
				<div style="width: 300px;margin:20px auto;"
					class="message well well-sm">'${search}'(으)로 ${totalCount}건의
					게시물을 검색했습니다.</div>
			</c:if>
				
		</td>
		<td style="text-align:right;width:300px;">
			<form method="GET" action="/AtTicketProject/usernotice/adminusernotice.do" id="searchForm">
				<div id="slctp2">
					<div class="input-group">
						<input type="text" id="search" name="search"
							aria-describedby="basic-addon2" class="form-control"
							placeholder="검색어를 입력하세요." required value="${search}"
							autocomplete="off"> <span class="input-group-addon"
							id="searchlogo" style="cursor: pointer;"
							onclick="$('#searchForm').submit();"><i
							class="glyphicon glyphicon-search"></i></span>
					</div>
				</div>
			</form>
		</td>
	</tr>
	</table>
        <%-- <form method="GET" action="/AtTicketProjcet/usernotice/adminusernotice.do" id="searchForm">
	                 <div id = "slctp2">
	                    <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon2" name="search" id="search" required value = "${search}">
	                    <span class="input-group-addon" id = "searchlogo" style="cursor:pointer;" onclick="$('#searchForm').submit();"><span class="glyphicon glyphicon-search"></span></span>
	                </div>
       </form> --%>
        <form method = "POST" action = "/AtTicketProject/usernotice/adminusernoticedelete.do?page=${page}&search=${search}&sort=${sort}" id = "deleteForm">
        <table class = "table table-striped table-bordered table-condensed" id = "nttable">
            <thead>
                <tr>
                    <th><input type="checkbox" id = "total5"></th>
              		<th class = "tableth">번호</th>
                    <th class = "tableth">구분</th>
                    <th class = "tableth">제목</th>
                    <th class = "tableth">등록일</th>
                    <th class = "tableth">티켓오픈일시</th>
                    <th class = "tableth">조회수</th>
                   
                </tr>
            </thead>
            <tbody>
              
                <c:if test = "${not empty search and list.size() == 0}">
                    <tr>
                    	<td colspan = "7">검색 결과가 없습니다.</td>
                    </tr>
                    </c:if>
                    
                    <c:if test = "${empty search and list.size() == 0}">
                    <tr>
                    	<td colspan = "7">게시물이 없습니다.</td>
                    </tr>
                    </c:if>
                    <c:forEach items="${list}" var="dto">
	                    <tr>
	                    		<td><input type="checkbox" name = "noticeseq" class = "t5" value = "${dto.seq}"></td>
	                            <td>${dto.seq}</td>
	                            <td>${dto.nindex}</td>
	                            <td><a href="/AtTicketProject/usernotice/adminusernoticecontent.do?noticeseq=${dto.seq}&page=${page}&search=${search}&sort=${sort}">${dto.title}</td>
	                            <td>${dto.regdate}</td> 
	                            <td>${dto.opendate} (${dto.dy})</td>
	                            <td>${dto.nview}</td>
	                    </tr>
                    </c:forEach>
            </tbody>
        </table>
	</form>
        <!-- 내용물 수정/삭제 페이지 -->
        <div id = "manipulate">
          <div class="btn-group fbtns" role="group" aria-label="...">
	            <button class = "modified" id = "makebtn"><i class="glyphicon glyphicon-plus"></i> 공지작성</button>
	            <button class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i> 공지수정</button>
	            <button class = "modified" id = "delbtn" type = "submit" onclick="$('#deleteForm').submit()"><i class="glyphicon glyphicon-trash"></i> 공지삭제</button>
            </div>
        </div>
            <!-- <input type="button" class = "modified" value = "공지삭제"> -->
        <!-- <input type="button" class = "modified" value = "공지작성"> -->
        <!-- <input type="button" class = "modified" value = "공지수정"> -->


        <!-- 하단 페이지 선택 바 -->
            
           <table style="width:100%;"><tr><td style="text-align:center">${pagebar}<td></tr></table> 
 
 	<script>
 	var index = 0;
 	
 	if("${sort}" == "regdate"){
		index = 0;
	} else if("${sort}" == "seq1") {
		index = 1;
	}  else if("${sort}" == "seq") {
		index = 2;
	}
 	
 	
 	$("#slctp1").children().eq(index).addClass("active");
    
 	// 게시판 맨 상단박스가 체크 되면 아래 박스 모두 체크 해준다. -> 고객공지 대상    
    var ck = document.getElementById("total5");
    var t5 = document.getElementsByClassName("t5");
    
    ck.onclick = function(){
        if (ck.checked) {
            console.log("체크가 됨");
            for (var i = 0; i < t5.length; i++) {
                t5[i].checked = true;
            }

        } else {
            console.log("체크가 안됨");

            for (var i = 0; i < t5.length; i++) {
                t5[i].checked = false;
            }
        }
    }//
    
    
    // 배너 그림 위에 수정 버튼 눌렀을 때! 
    var bannerChild;//자식객체 -> 새로운 페이지에 대한 자식객체라고 생각하면 된다.

    $(".innerbtn1").click(function(){
        
        // console.log(event.srcElement.id);
        
        //bannerChild = window.open("./adminBannerSelect.html","bs","width=630,height=1000");
        popupCenter("/AtTicketProject/usernotice/adminusernoticeimgmodify.do",630,1000);

    });
    
    
    //팝업 중앙정렬 알고리즘
    function popupCenter(href, w, h) {
    	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
    	xPos += window.screenLeft; 
    	var yPos = (document.body.offsetHeight/2) - (h/2);

    	window.open(href, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
    }
 	
 	
    // 고객 공지 삭제 작성 수정 버튼 눌렀을때 반응 crud
    
    //삭제
    $("#delbtn").click(function(){
        if(confirm("해당 공지를 삭제하시겠습니까?")) {
           
        }
    });

    //작성
    // adminNctModify(fix).html
    $("#makebtn").click(function(){
        location.href = "/AtTicketProject/usernotice/adminusernoticecreate.do?page=${page}&sort=${sort}&search=${search}";
    });

    var cnt = 0;
    
    $("#modifybtn").click(function () {
       
        $(".t5").each(function(){  // .each()는 forEach를 뜻한다.
 			if($(this).is(":checked")) { // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
 					cnt+=1;	
 			}
 		});
         
     	 if ($('.t5').is(':checked') == true && cnt == 1) {
        	 location.href = "/AtTicketProject/usernotice/adminusernoticemodify.do?noticeseq="+$('.t5:checked').val();

          } else {
              alert("하나만 체크하시오.");
          }
         	 cnt=0;
    });
    
    
    
    $("#pagebar").val(${page});
 	</script>    
 

    </div><!-- selectable -->	

	<!-------------------------- 회원대상 공지사항 끝 -------------------------->	
	
	




	<%@include file="/WEB-INF/views/inc/menu.jsp" %>
	
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
</script>


</body>
</html>