<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="shortcut icon" href="./images/favicon.ico">
    <style>

        body {
            background-color: #F8F8F8;
        }
        .create {
            float: right;
            outline: none;
            cursor: pointer;
        }
        .find {
            float: left;
        }
        #login {
            border: 1px solid #C8C8C8;
            border-radius: 10px;
            background-color: white;
            width: 450px;
            height: 450px;
            margin: 0 auto;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 50px;
        }
        #login > div {
            margin: 0 auto;
            margin-bottom: 20px;
        }
        #username, #password {
            margin: 0px auto;
            padding: 10px 0 10px 50px;
            width: 305px;
            display: block;
            margin-bottom: 20px;
            outline: none;
            border: 1px solid #C8C8C8;
            border-radius: 3px;
        }
        #username {
            background-image: url("./images/user.png");
            background-position-x: 5px;
            background-position-y: 2px;
            background-repeat: no-repeat;
        }
        #password {
            background-image: url("./images/password.png");
            background-position: -4px -8px;
            background-repeat: no-repeat;
        }
        #login > div:nth-child(3) {
            width: 300px;
            text-align: left;
            font-size: 14px;
        }
        #enter {
            padding: 13px 20px;
            width: 305px;
            border: 1px solid #C8C8C8;
            border-radius: 3px;
            outline: none;
        }
        #login > div:nth-child(5) {
            width: 305px;
        }
        #login > div:nth-child(5) > div {
            float: left;
            font-size: 13px;
        }
        #login > div:nth-child(5) a {
            text-decoration: none;
            color: black;
        }
        #footer {
            text-align: center;
            margin: 0 auto;
        }
        #copyright {
            color: #666;
            margin-top: 20px;
            letter-spacing: -.1px;
        }
        #copyright > span {
            font-weight: bold;
        }
        

    </style>
</head>
<body>
    
    <div id="login">
        <h1>Sign In</h1>
        
        <form name = "userlogin" method = "POST" action = "/AtTicketProject/userloginend.do">
        <div>
            <input type="text" placeholder="아이디" id="username" name = "userid" autocomplete="off">
            <input type="password" placeholder="비밀번호" id="password" name = "userpw">
        </div>
<!--         <div>
            <input type="checkbox" name="saveid" id="saveid">
            <label for="saveid">아이디 저장</label>
        </div> -->
        <div>
        	<!-- <button type="submit" id = "enter">SIGN IN</button> -->
             <input type="submit" value="SIGN IN" id="enter">
        </div>
    	</form>
        
        <div>
            <div style="width: 305px;">
                <div class="find">
                    <a href="/AtTicketProject/index.do">관리자페이지로 이동하기</a>
                </div>
                <a class="create">회원가입</a>
            </div>
        </div>
    </div>
    
    <div id="footer">
        <div id="copyright">
            Copyright &copy; <span>AT-Ticket Corp.</span> All rights reserved.
        </div>
    </div>

    <script>

        //회원가입 클릭시
        $(".create").click(function() {
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
            location.href = "/AtTicketProject/usercreateaccount.do";
        });

        //로그인 시 메인페이지로 이동
        $("#enter").click(function() {
            console.log($("#username").val());
            console.log($("#password").val());

            if($("#username").val().length < 1) {
                console.log("아이디를 입력하세요.");
                $("#username").focus();
                return false;
            };            
            if($("#password").val().length < 1) {
                console.log("비밀번호를 입력하세요.");
                $("#password").focus();
                return false;
            };
            
            /* if ($("#saveid").prop("checked")) {
                console.log("아이디 저장");
            } else {
                console.log("아이디 미저장");
            }; */

            window.opener.location.href = "/AtTicketProject/userindex.do";
            window.close();

        });

    </script>


</body>
</html>