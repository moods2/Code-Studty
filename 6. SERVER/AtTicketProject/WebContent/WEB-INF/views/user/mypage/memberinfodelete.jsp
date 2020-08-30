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
    <style>

        body {
            background-color: #F8F8F8;
        }
        #top {
            /* border: 1px solid black; */
            width: 900px;
            height: 100px;
            margin: 50px auto;
            margin-top: 20px;
        }
        #topleft {
            display: inline-block;
            /* border: 1px solid white; */
            width: 100px;
            height: 65px;
            background-image: url("./images//title.png");
            background-repeat: no-repeat;
            background-position: center center;
            cursor: pointer;
        }
        #topleft + h1 {
            font-size: 25px;
            font-weight: bold;
            display: inline-block;
            position: relative;
            top: -10px;
            left: 10px;
            color: #333;
        }
        #middle {
            border: 1px solid #C8C8C8;
            border-radius: 10px;
            background-color: white;
            width: 900px;
            height: 1180px;
            margin: 0 auto;
            margin-top: -50px;
            margin-bottom: 100px;
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 50px;
        }
        #menu {
            border-bottom: 1px solid #EBEBEB;
        }
        #menu > ul {
            list-style: none;
            padding: 0;
            text-align: center;
            margin-bottom: 0;
        }
        #menu > ul > li {
            display: inline-block;
            font-size: 17px;
            font-weight: bold;
            padding: 15px 0px 10px 0px;
            cursor: pointer;
        }
        #menu > ul > li:first-child {
            margin-right: 40px;
        }
        #menu > ul > li:last-child {
            color: #196AB3;
            border-bottom: 3px solid #196AB3;
        }
        #precaution {
            width: 85%;
            margin: 50px auto;
        }
        #precaution h1 {
            font-size: 20px;
            font-weight: bold;
        }
        #precaution h2 {
            font-size: 15px;
            font-weight: bold;
        }
        #precaution > div {
            border: 1px solid #EBEBEB;
            background-color: #F8F8F8;
            padding: 10px 15px;
        }
        #precaution > div > div > div {
            font-size: 12px;
            border-bottom: 1px dashed #EBEBEB;
            padding: 20px 0;
        }
        #precaution > div > div > div:last-child {
            border-bottom: 0;
        }
        #precaution > div > div > div span {
            color: red;
        }

        #precaution + div > div:first-child { margin-top: 50px; margin-bottom: 20px; }
        #precaution + div > div h1 {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        #recheck {
            border: 1px solid #EBEBEB;
            background-color: #F8F8F8;
            width: 500px;
            text-align: center;
            margin: 0 auto;
            padding: 20px 0px;
        }
        .txt, #enter {
            margin: 0px auto;
            padding: 10px;
            width: 420px;
            display: block;
            margin-bottom: 10px;
            outline: none;
            border: 1px solid #D8D8D8;
            border-radius: 3px;
            font-weight: bold;
        }
        #enter { margin-bottom: 0; }
        #recheck + div {
            width: 500px;
            margin: 20px auto;
            text-align: center;
        }

        #footer {
            width: 900px;
            margin: 0 auto;
        }
        #copyright {
            text-align: center;
            color: #666;
            margin-top: -70px;
            letter-spacing: -.1px;
        }
        #copyright > span {
            font-weight: bold;
        }
        #menu > ul > li:hover {
            color: #196AB3;
        }
        #mypage {
            float: right;
            position: relative;
            top: 30px;
            outline: none;
        }

    </style>
</head>
<body>
    
    <div id="top">
        <!-- 상단메뉴 좌측(메인화면으로 돌아가기) -->
        <a href="/AtTicketProject/usermypage.do" id="topleft"></a>
        <!-- 상단메뉴 좌측(로그인 문구) -->
        <h1>나의 정보</h1>
        <!-- 상단메뉴 우측(마이페이지로 돌아가기) -->
        <input type="button" value="마이페이지" class="btn btn-default" id="mypage">
    </div>
    <div id="middle">
        <div id="menu">
            <ul>
                <li id="revisionFix">회원정보</li>
                <li>회원탈퇴</li>
            </ul>
        </div>
        <div id="precaution">
            <h1>아래 내용을 꼭 확인해 주세요.</h1>
            <div>
                <div>
                    <h2>회원정보 및 계좌내역 삭제</h2>
                    <div>
                        <span>회원탈퇴 즉시 회원정보는 모두 삭제되며, 재가입시에도 복원되지 않습니다.</span><br><br>
                        <p>· 삭제되는 정보 : 구매하신 eBook, 개인정보, 계좌내역(YES포인트, YES머니, 예치금 등), YES블로그 계정, YES24 중고샵 판매관리 계정</p>
                        <p>· 회원탈퇴 시 중고샵 판매계정 및 판매자회원 자격이 자동으로 상실됩니다.(주문/정산 중에는 탈퇴불가)</p>
                        <p>· 회원탈퇴 시 중고매장에서 회원으로 서비스 이용이 불가합니다.</p>
                        <p>· 회원탈퇴 시 구매하신 eBook도 모두 삭제됩니다. 회원탈퇴 후 타 ID로 사용 권한을 양도하실 수 없습니다.</p>
                        <p>· 탈퇴 후 블로그 및 블로그와 연결된 이용기록(ex.상품리뷰)은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
                        <p>· 게시판형 서비스에 등록한 게시물은 삭제되지 않고 유지됩니다.</p>
                    </div>
                </div>
                <div>
                    <h2>1개월간 회원 재가입 제한</h2>
                    <div>
                        <p>· 회원탈퇴 후, 1개월간은 회원 재가입이 불가능합니다.</p>
                    </div>
                </div>
                <div>
                    <h2>탈퇴 후 정보보관</h2>
                    <div>
                        <p>전자상거래 등에서의 소비자보호에 관한 법률 제6조에 의거 성명, 주소 등 거래의 주체를 식별할 수 있는 정보에 한하여 서비스
                        이용에 관한 동의를 철회한 경우에도 이를 보존할 수 있으며, 동법 시행령 제6조에 의거 다음과 같이 거래 기록을 보관합니다.</p>

                        <p>· 표시, 광고에 관한 기록 : 6개월</p>
                        <p>· 계약 또는 청약철회 등에 관한 기록 : 5년</p>
                        <p>· 대금결제 및 재화등의 공급에 관한 기록 : 5년</p>
                        <p>· 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</p>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div>
                <h1>정확한 본인확인을 위해 비밀번호를 입력해 주세요.</h1>
            </div>
            
            <form method="POST" action="/AtTicketProject/memberinfodeleteend.do">
            <div id="recheck">
                <div>
                    <input type="text" class="txt" value="${userid}" readonly>
                    <input type="password" class="txt" id="password" name="password" placeholder="비밀번호">
                    <input type="submit" class="btn btn-primary" id="enter" value="회원탈퇴">
                </div>
            </div>
            </form>
            
        </div>
    </div>
    <div id="footer">
        <div id="copyright">
            Copyright &copy; <span>AT-Ticket Corp.</span> All rights reserved.
        </div>
    </div>
    

    <script>

        //회원정보 수정 페이지로 이동
        $("#revisionFix").click(function() {
        	location.href = "/AtTicketProject/mypagememberinfo.do";
        });

        //마이페이지로 이동
        $("#mypage").click(function() {
        	location.href = "/AtTicketProject/usermypage.do";
        });
        

        //비밀번호 입력 후 확인 클릭시
        /* $("#enter").click(function() {

            if ($("#password").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#password").focus();
                return false;
            };

            alert("회원탈퇴가 완료되었습니다.");
            location.href = "/AtTicketProject/userindex.do";

        }); */

    </script>


</body>
</html>