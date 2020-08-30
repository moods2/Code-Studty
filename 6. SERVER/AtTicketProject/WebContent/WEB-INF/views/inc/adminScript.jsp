<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 var date = document.getElementById("date");
    var now = new Date();
    var sw = document.images["sw"];

    //날짜 자동 입력, 읽기만 가능 
    date.value = now.getFullYear() + " / " + (now.getMonth()+1) + " / " + now.getDate();
    if (date.value != null) {
        date.readOnly = true;
    }

    // 캘린더
        $("#date").datepicker({
            dateFormat: "yy-mm-dd",
            minDate: now.getFullYear() + "-1-1",
            maxDate: now.getFullYear() + "-12-" + "31"
        });
    

   	

    document.body.bgColor = "white";
    


    //스위치 

    var swCount = 1;
    $("#sw").click(function () {
        // console.log("클릭함");

            if(swCount % 2 == 0) {
                // 배경화면 기본상태
                console.log("들어옴");
                sw.src="<%= request.getContextPath() %>/images/switch_on.png";
                $("body").css("background-color","white");
                $("#homeLogo").css("color","#333333");
                $("#adminName").css("color","#333333");
                $("#nttable > tbody > tr:nth-child(2n)").css("color","#333333");
                $("#empNoticeTitle").css("color","#333");
                $(".chartWord").css("color","#333");
                $("#vistreserve").css("color","#333");
                $("#moneyTitle").css("color","#333");
            } else {
                // 배경화면이 어두운 색일 경우
                sw.src="<%= request.getContextPath() %>/images/switch_off.png";
                $("body").css("background-color","#292A2D");
                $("#homeLogo").css("color","white");
                $("#adminName").css("color","white");
                $("#nttable > tbody > tr:nth-child(2n)").css("color","white");
                $("#empNoticeTitle").css("color","white");
                $(".chartWord").css("color","white");
                $("#vistreserve").css("color","white");
                $("#moneyTitle").css("color","white");
            }
            swCount++;
    });
    

    // $("#btn1").click(function(){
    //     window.open("login.html","Login","width=300, height=300");
    // });
    
    // 버튼을 클릭하면 로그아웃 창이 뜸
    $("#btn2").click(function(){
        if(confirm("로그아웃하시겠습니까?")){
            console.log("로그아웃 되었습니다.");
         }
    });

    $(".accomenu").accordion({
        collapsible: true,
        active: false,
        heightStyle: "content"
    });

    //홈버튼 링크
    $("#homeLogo").click(function() {
        location.href = "/AtTicketProject/adminmain.do";
    });

    //상단 메뉴 고정
    $(document).scroll(function() {
        //메뉴가 시야에서 사라지는 순간 -> 메뉴를 붙박이로 만들기
            if ($(document).scrollTop() > $("#topmenu").position().top) {
                $("#topmenu").css({
                    width: "100%",
                    position: "fixed",
                    top: "0px",
                    bottom: "",
                    zIndex: "1"
                });

            };

        //상단 헤더(top)이 눈에 보일때 쯤
        if ($(document).scrollTop() <= $("#topmenu").position().top) {
            $("#topmenu").css({
                position: "absolute",
                top: "0px",
                bottom: ""
            });             
        }
    });


    //logout 버튼 관련 -> 커서 가져다 대면 더 밝아짐    
    $("#btn2").mouseenter(function(){
        // $("#btn2").css("background-color","cornflowerblue");
        $("#btn2").css("color","white");
    });
    $("#btn2").mouseleave(function(){
        // $("#btn2").css("background-color","#C27BA0");
        $("#btn2").css("color","#D5D5D5");
    })

    //티켓 홈
    $("#tickethome").click(function() {
        window.open("/AtTicketProject/userindex.do","At-Ticket");
    });

    
    //상단으로 돌아가기 -> 스무스 하게 올림
    $("#movetop").click(function(){
        	
        $("html,body").animate({
			scrollTop: 0
		}, 700);
        
    });

    //검색
    $("#btnsearch").click(function(){
        // 검색어 넘기기
        window.location.href="adminSearch.html";
    });
