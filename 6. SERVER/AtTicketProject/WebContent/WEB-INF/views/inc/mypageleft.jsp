<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="left" style="z-index:10;">
    <!-- 유저 정보 -->
    <div id="userinfo">
        <p id="infohead">MY공연<small style="color: #BBB"> | MYPAGE</small></p>
        <p><span>${username}</span>님은 <span>${usergrade}</span>입니다.</p>
        <div id="point">
            <p>Egg포인트 : ${useregg}원</p>
        </div>
        <div>
            <input type="button" class="btn btn-default btn-sm" value="포인트 안내▶" id="btnpoint">
            <input type="button" class="btn btn-default btn-sm" value="회원정보 수정▶" id="btninfo">
        </div>
        <div>
            <input type="button" class="btn btn-default btn-sm" value="상세 보기▶" id="btndetail">
            <input type="button" class="btn btn-default btn-sm" value="로그 아웃▶" id="btnlogout">
        </div>
    </div>
    <!-- 유저 메뉴 -->
    <div id="usermenu">
        <p class="usermenu" data-lo="/AtTicketProject/mypagereservation.do">예매확인/취소<span>▶</span></p>
        <p class="usermenu" data-lo="/AtTicketProject/mypagecoupon.do">할인쿠폰<span>▶</span></p>
        <p class="usermenu" data-lo="/AtTicketProject/mypageinterest.do">나의 관심 공연<span>▶</span></p>
        <p class="usermenu" data-lo="/AtTicketProject/mypagewatched.do">나의 관람 공연<span>▶</span></p>
        <p class="usermenu" data-lo="/AtTicketProject/mypagepersonalize.do">나의 맞춤 설정<span>▶</span></p>
    </div>
    <!-- 맞춤별 예매 -->
    <div id="personalize">
        <p><span class="glyphicon glyphicon-hand-up
            "></span> 맞춤별 예매</p>
        <p class="personaltitle">지역별예매</p>
        └<a href="#!">서울</a>,<a href="#!">경기/인천</a>,<a href="#!">대전/충청/강원</a>,<br><a href="#!">부산/대구/울산/경상</a>,<a href="#!">광주/전라</a>,<a href="#!">제주</a>
        <p class="personaltitle" style="margin-top: 20px;">공연장별예매</p>
        └<a href="#!">세종문화회관</a>,<a href="#!">광림아트센터</a>,<a href="#!">예술의전당</a>,<br><a href="#!">샤롯데씨어터</a>,<a href="#!">한전아트센터</a>
        <p class="personaltitle" style="margin-top: 20px;">날짜별예매 <input type="button" value="달력보기" class="btn btn-default btn-xs" id="btncalendar"></p>
    </div>
    <!-- 고객센터 -->
    <div>
        <p><span>☎</span> 고객센터 전화상담</p>
        <p>1544-6399</p>
        <p class="time">평일 09:00 ~ 18:00</p>
        <p class="time">토요일 09:00 ~ 17:00</p>
        <p class="time">일요일 공휴일 휴무</p>
    </div>
</div>

<script>

//MY공연 클릭 시
$("#infohead").click(function() {
    location.href = "/AtTicketProject/usermypage.do";
});

//달력보기
$("#btncalendar").datepicker({
    dateFormat: "yy-mm-dd",
    minDate: "today"
});

//유저메뉴 css
$(".usermenu").mouseover(function() {
    $(this).css("color", "#4E7AD1");
});
$(".usermenu").mouseout(function() {
    $(this).css("color", "");
});
//유저메뉴 클릭시 이동
$(".usermenu").click(function() {
    // console.log($(this).data("lo"));
    location.href = $(this).data("lo");
});

//포인트 안내 클릭시
$("#btnpoint").click(function() {
    location.href = "/AtTicketProject/userinfouse.do";
});

//회원정보 수정 클릭시
$("#btninfo").click(function() {
    location.href = "/AtTicketProject/mypagememberinfo.do";
});

//상세보기 클릭시
$("#btndetail").click(function() {
    location.href = "/AtTicketProject/mypage/mypagedensity.do";
});

//로그아웃 클릭시
$("#btnlogout").click(function() {
    //alert("로그아웃");
    location.href = "/AtTicketProject/userlogout.do";
});

</script>