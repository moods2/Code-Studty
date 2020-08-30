<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <div id="left">
        
        
        <img src="<%= request.getContextPath() %>/images/man.png" 
            style="margin-top: 40px; width: 80px; border: 1px solid #333; border-radius:50%; background-color: #999;">
        <div class="info" style="color:white">
            <span><br>Welcome,</span></br></span>
            <span>
            	${sessionScope.id} 
            </span>
        </div>
        <!-- <div class="b">
            <input style="font-weight: bold; background-color: #C27BA0; margin : 80px;" type="button" value="Logout" id="btn2"
                class="btn">
        </div> -->
        <!-- 로그아웃 버튼 관련 -->
        <div id = "logout">
        	<%
        		//session.invalidate();//해당 세션을 비워준다. -> 로그아웃을 진행해야 하므로
        		
        	%>
            <input style="font-weight: bold; background-color: #999; margin-top : 30px; margin-bottom : 50px; color: #D5D5D5; width: 70px; height: 30px; outline: none;"
                     type="button" value="Logout" id="btn2" class="btn" onclick = "location.href = '/AtTicketProject/adminlogout.do';">
        </div>
        <!-- 로그아웃버튼을 눌렀을때 취할 행동 -->
        <script>
        	
        
        </script>
        
        <!-- 왼쪽 바 메뉴 -->
        <div class="accomenu">
            <h3>공연</h3>
            <div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/adminshow.do"><span>▶</span> 공연 조회</a></div>
            </div>
            <h3>통계</h3>
            <div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/customer/adminview.do"><span>▶</span> 방문자 통계</a></div>
            </div>
            <h3>정산 관리</h3>
            <div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/adminsales.do"><span>▶</span> 매출액 통계</a></div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admin/adminbank.do"><span>▶</span> 계좌 관리</a></div>
            </div>
            <h3>직원 정보</h3>
            <div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/adminemployee.do"><span>▶</span> 직원 조회</a></div>
            </div>
            <h3>이벤트</h3>
            <div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/event/adminevent.do"><span>▶</span> 이벤트 조회</a></div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/coupon/admincoupon.do"><span>▶</span> 쿠폰 조회</a></div>
            </div>
            <h3>1:1 문의</h3>
            <div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admincustomerqna.do"><span>▶</span> 문의 조회</a></div>
            </div>
            <h3>공지사항</h3>
            <div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/usernotice/adminusernotice.do"><span>▶</span> 공지사항 조회</a></div>
            </div>
            <h3>고객 정보</h3>
            <div>
            <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/customer/admincustomerlist.do"><span>▶</span> 고객 정보 조회</a></div>
            </div>
            <h3>업무 게시판</h3>
            <div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="adminworking.do"><span>▶</span> 업무 게시판 조회</a></div>
            </div>
            <h3>배너 관리</h3>
            <div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admin/adminbannermain.do"><span>▶</span>메인 배너 수정</a></div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admin/adminbannerconcert.do"><span>▶</span>콘서트 배너 수정</a></div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admin/adminbannermusical.do"><span>▶</span>뮤지컬 배너 수정</a></div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admin/adminbannertheater.do"><span>▶</span>연극 배너 수정</a></div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admin/adminbannerclassic.do"><span>▶</span>클래식 배너 수정</a></div>
                <div style="margin-left:-30px; padding-left: 30px; width: 231px; height: 25px;"><a href="/AtTicketProject/admin/adminbannerdisplay.do"><span>▶</span>전시 배너 수정</a></div>
            </div>
        </div>
        


        <!-- container -->


        
        <!-- <div class="b">
            <input style="font-weight: bold; background-color: #D5A6BD;" type="button" value="Login" id="btn1"
                class="btn">
        </div> -->

        <div id="calendar">
            <input style="width: 100px;" type="text" name="date" id="date" value="">
            <label for="date"><span style="font-size: 2.5em; color:white" class="glyphicon glyphicon-calendar" id = "cal"></span></label>
        </div>

        <!-- 티켓 사이트 로고 바로가기 -->
        <div style="margin-top: 20px; position: fixed; bottom: 30px; left: 70px;">
            <img src="<%= request.getContextPath() %>/images/title.png" id="tickethome" 
                    style="cursor: pointer; height: 50px;">
        </div>


    </div>


    <div id="topmenu">
        <div class="home">
            <span style="font-size: 2.5em;" class="glyphicon glyphicon-home" id = "homeLogo"></span>
        </div>
        <div class="search">
            <div class="form-group">
                <div class="input-group">
                    <span style="border-radius: 30px; cursor: pointer;" class="input-group-addon" id="btnsearch"><i
                            class="glyphicon glyphicon-search"></i></span>
                    <input style="border-radius: 30px; width: 200px;" type="text" class="form-control"
                        placeholder="검색어를 입력하세요.">
                </div>
            </div>
        </div>
    </div>
	
    <div id = "fixedBtn">
        <img src = "<%= request.getContextPath() %>/images/switch_on.png" id="sw" name="sw"
            style="width: 70px; position: fixed; bottom: 0px; right: 50px; margin-bottom : 45px;">

        <!-- 제일 위로 돌아가기 -->
        <div id="movetop" style = "position: fixed; bottom: 0px; right: 0px;margin-bottom : 63px;">↑</div>
    </div>

    <!-- 아래 회색 바닥 페이지 없앰 -->
    <!-- <div id="bottom" style="width: 100%; height: 50px; background-color: #eeeeee;"> -->
    </div>
 