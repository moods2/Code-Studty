<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bottom">
    <div>
        <!-- 회사 마크 -->
        <img src="./images/title2.png"/>
    </div>
    <div class="txt">
        <p class="black">At-Ticket (주)</p>
        <p>서울시 강남구 역삼동 한독빌딩 8층 대표: 한시연 | 개인정보보호책임자: 한시연</p>
        <p>it1234@atticket.com 사업자등록번호 229-81-37000</p>
        <p class="black">Copyright &copy; At-Ticket Corp. All Rights Reserved.</p>
    </div>
    <div id="service">
        <p><span>☎</span> 고객센터 전화상담</p>
        <p>1544-6399</p>
        <p>평일 09:00 ~ 18:00</p>
        <p>토요일 09:00 ~ 17:00</p>
        <p>일요일 공휴일 휴무</p>
    </div>
</div>

<script>

$(document).scroll(function () {
    //메뉴가 시야에서 사라지는 순간 -> 메뉴를 붙박이로 만들기
    if ($(document).scrollTop() > $("#middle1").position().top) {
        $("#topmenu").css({
            width: "100%",
            position: "fixed",
            top: "0px",
            bottom: "",
            zIndex: "1",
            "background-color": "white",
            color: "black",
            "border-bottom": "1px solid #ddd",
        });
        $("#search").css({
            "border-bottom-color": "black",
            color: "black",
        });
        $(window).resize(function () {
            if ($(window).width() < 970) {
                // console.log($(window).width());
                $("#topcenter").css(
                    "transform",
                    "translate(-100px, 0)"
                );
            } else {
                $("#topcenter").css("transform", "translate(0, 0)");
            }
        });
        $("#submenu").css({
            display: "block",
            position: "fixed",
            left: "50px",
            top: "200px",
            zIndex: "5"
        });
    }

    //상단 헤더(top)이 눈에 보일때 쯤
    if ($(document).scrollTop() <= $("#middle1").position().top) {
        $("#topmenu").css({
            position: "absolute",
            top: "0px",
            bottom: "",
            color: "white",
            "background-color": "transparent",
            "border-bottom": "0",
        });
        $("#search").css({
            "border-bottom-color": "white",
            color: "white",
        });
        $("#submenu").css({
            display: "none",
        });
    }
});

</script>