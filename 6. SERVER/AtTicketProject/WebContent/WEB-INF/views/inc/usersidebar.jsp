<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="submenu">
 <ul>
     <li>
         <span
             style="font-size: 2.4em;"
             class="glyphicon glyphicon-list-alt"
         ></span>
         <br />
         <a class="subfont" href="/AtTicketProject/usernotice.do"
             >공지사항</a
         >
     </li>
     <li>
         <span
             style="font-size: 2.4em;"
             class="glyphicon glyphicon-pencil"
         ></span>
         <br />
         <a class="subfont" href="/AtTicketProject/userreview.do"
             >커뮤니티</a
         >
     </li>
     <li>
         <span
             style="font-size: 2.4em;"
             class="glyphicon glyphicon-search"
         ></span>
         <br />
         <a class="subfont" href="/AtTicketProject/userconcerthall.do"
             >공연장 검색</a
         >
     </li>
     <li>
         <span
             style="font-size: 2.4em;"
             class="glyphicon glyphicon-map-marker"
         ></span>
         <br />
         <a class="subfont" href="#!"
             >지역 검색</a
         >
     </li>
     <li>
         <span
             style="font-size: 2.4em;"
             class="glyphicon glyphicon-question-sign"
         ></span>
         <br />
         <a class="subfont" href="/AtTicketProject/userqna.do">Q & A</a>
     </li>
     <%-- <% if (session.getAttribute("userid") == null) {%> --%>
     <c:if test = "${empty userid}"><!-- 여기에 이런식으로 처리 해주는 이유는 -> 로그인을 하면 또 로그인을 할 필요가 없기 때문이다. -->
     <li>
         <span
             style="font-size: 2.4em;"
             class="glyphicon glyphicon-off"
         ></span>
         <br/>
         
         <a class="subfont" id="login"
             >로그인</a>
     </li>
     </c:if>
     
     <c:if test = "${!empty userid}"><!-- 여기에 이런식으로 처리 해주는 이유는 -> 로그인을 하면 또 로그인을 할 필요가 없기 때문이다. -->
     <li>
         <span
             style="font-size: 2.4em;"
             class="glyphicon glyphicon-off"
         ></span>
         <br/>
         
         <a class="subfont" id="logout"
             >로그아웃</a>
     </li>
     </c:if>                   
     
     
     <%-- <%} %> --%>
    </ul>
</div>