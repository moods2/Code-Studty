<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <%@include file="/WEB-INF/views/inc/asset.jsp"%>
    <link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
    <style>
        #title {
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }
        
        #left {
           position: absolute;
           left: 0px;
           top: 0px;
           width: 250px;
           height: 900px;
           /* border: 1px solid black; */
           background-color: #444;
           text-align: center;
           z-index: 10;
       }

        h1 {
            font-weight: bold;
            font-family: Arial;
            font-size: 3em;
            color: #555;
        }

        small {
            color: #777;
            font-family: Arial;
            font-size: 27.3px;
            font-weight: lighter;
        }

        body {
            outline: none;
        }

        .search {
            float: left;
            width: 200px;
        }

        #sel1 {
            width: 150px;
            float: left;
        }

        #header {
            margin-left: 490px;
            width: 1000px;
            margin-top: 10px;
            background-color: gray;
        }

        #box {
            margin: 70px auto;
        }

        th {
            text-align: center;
        }

        td {
            text-align: center;
        }

        .pagination>.active>a,
        .pagination>.active>span,
        .pagination>.active>a:hover,
        .pagination>.active>span:hover,
        .pagination>.active>a:focus,
        .pagination>.active>span:focus {
            background-color: #999999;
            border-color: #eeeeee;
        }

        .pagination>li>a,
        .pagination>li>span {
            color: black;
        }

        th {
            background-color: #999;
            /* color : white; */
        }

        #manipulate {
            margin-left: 1540px;
        }

        .modified {
            border: 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color: rgb(220, 220, 220);
            height: 35px;
            font-weight: bold
        }

        .modified:hover {
            color: white;
            /* background-color: #333; */
        }

        .input-group-addon:hover {
            cursor: pointer;
        }

        tr td:nth-child(5) a{
           text-decoration:none;
           color:black;
        } 
        
         tr td:nth-child(5) a:hover{
           color:red;
           
        } 

        /* 추가 */
        #list {
            margin-top: 10px;
        }

        li {
            margin-bottom: 10px;
        }
      	
    </style>

</head>

<body>

    <div id="title">
        <h1> 고객 관리 <small>> Home </small></h1>
    </div>

	<table style="width:1320px; margin:30px 380px;">
		<tr>
			<!-- <div style="margin-top: 30px; margin-left: 480px;"> -->
				<td style="width:50%;">
					<c:if test="${not empty search}">
							<div style="width:270px;"class="message well well-sm">'${search}'(으)로
								${totalCount}건의 게시물을 검색했습니다.</div>
					</c:if>
				</td>
				<!-- 이름, 아이디, 주민번호, 전화번호 -->
				<td>
					<form method="GET"action="/AtTicketProject/customer/admincustomerlist.do" id="searchForm">
						<div style="margin-left:500px;" class="input-group search">
							<input placeholder="검색어를 입력하세요." type="text" class="form-control" aria-describedby="basic-addon2" name="search" id="search" required value="${search}" autocomplete="off"> 
								<span class="input-group-addon" id="basic-addon2" style="cursor: pointer;" onclick="$('#searchForm').submit();">
								<span class="glyphicon glyphicon-search"></span>
								</span>
						</div>
					</form>
				</td>
			<!-- </div> -->
		<tr>
	</table>
	<div style="clear:both;"></div>
    
    <form method = "POST" action = "/AtTicketProject/customer/cuslistdelete.do" id="deleteForm">
    <div id="box" style="margin-left: 100px; margin-top:30px;">
        <table style="width: 1320px; margin-left: 280px;" class="table  table-bordered table-striped table-condensed"
            id="tbl">
                <thead>
                    <tr>
                        <th style="text-align: center;">
                        <input type="checkbox" name="cbAll"></th>
                        <th style="width: 80px;">번호</th>
                        <th style="width: 90px;">이름</th>
                        <th style="width: 200px;">주민번호</th>
                        <th style="width: 110px;">아이디</th>
                         <th style="width: 110px;">비밀번호</th>
                        <th class="title" style="width: 300px; text-align: center;">주소</th>
                        <th style="width: 110px;">고객등급</th>
                        <th class="title" style="width: 150px; text-align: center;">전화번호</th>
                        <th style="width: 160px;">이메일</th>
                        <th style="width: 110px;">사진</th>
                    </tr>
                </thead>
            <tbody id="tbody1">
                <c:if test="${not empty search and list.size() == 0}">
                    <tr>
                        <td colspan="11">검색 결과가 없습니다.</td>
                    </tr>
                </c:if> 
                <c:forEach items="${list}" var="dto">
                    <tr>
                        <td><input type="checkbox" class="cb" name = "cb" value = "${dto.seq}"></td>
                        <td>${dto.seq}</td>
                        <td>${dto.name}</td>
                        <td>${dto.ssn}</td>
                        <td><a href="/AtTicketProject/customer/admincustomerinfo.do?seq=${dto.seq}&page=${page}&search=${search}">${dto.getId()}</a>
                               </td>
                        <td>${dto.pw}</td>
                        <td>${dto.addr}</td>
                        <td>${dto.grade}</td>
                        <td>${dto.tel}</td>
                        <td>${dto.email}</td>
                        <td>${dto.photo}</td>       
                    </tr>
                    
                </c:forEach>
            </tbody>
        </table>
      
    </div>

    <div id="manipulate">
        <button type = "button" class="modified" id="makebtn">
            <i class="glyphicon glyphicon-plus"></i>추가
        </button>

        <button type = "button" class = "modified" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i>수정</button>
        <button type = "button" class="modified" id="delbtn"><i class="glyphicon glyphicon-trash"></i>삭제</button>
       
    </div>
    
    <input type="hidden" name="page" value="${page}">
    <input type="hidden" name="search" value="${search}">
    
    </form>
    <table style="width:100%;">
    	<tr style="text-align:center">
    			<td>${pagebar}<td>
    	</tr>
    </table>

    <%@include file="/WEB-INF/views/inc/menu.jsp"%>
    <script>
		<%@include file = "/WEB-INF/views/inc/adminScript.jsp" %>	
  		var index = 1;
        var list = [];
        var count = 10;
        var tbl = document.getElementById("tbl");
        var tbody1 = document.getElementById("tbody1");
        var sel1 = document.getElementById("sel1");
        var tr = document.getElementsByTagName("tr");
        var cbAll = document.all.cbAll; // 일괄 체크박스
        var cb = document.getElementsByClassName("cb");
        var td = document.getElementsByTagName("td");

        // select에서 바뀌면 검색창에 focus가 가도록 한 구문
        $("#sel1").change(function () {
            $(".form-control").focus();
        });


        /* for (var i = 2; i < tr.length; i++) {
            tr[i].children[2].onclick = function () {
               

            };
        } */

        cbAll.onchange = function () {
            for (var i = 0; i < cb.length; i++) {
                cb[i].checked = cbAll.checked;

            }
        }


        $("#name").keyup(function () {
            if (event.keyCode == 13)
                $("#email").focus();
        });

        $("#email").keyup(function () {
            if (event.keyCode == 13)
                $("#tel").focus();
        });

        $("#tel").keyup(function () {
            if (event.keyCode == 13)
                $("#ssn").focus();
        });

        $("#ssn").keyup(function () {
            if (event.keyCode == 13)
                $("#id").focus();
        });

        $("#id").keyup(function () {
            if (event.keyCode == 13)
                $("#pwd").focus();
        });

        $("#pwd").keyup(function () {
            if (event.keyCode == 13)
                $("#addr").focus();
        });

        //추가
        /* $("#dialog1").hide(); */
     
        $("#makebtn").click(function () {
            window.open("/AtTicketProject/customer/cuslistinsert.do","추가","width=910,height=550");
        });
        
        var cnt = 0;
        
        $("#modifybtn").click(function(){
	        $(".cb").each(function(){  // .each()는 forEach를 뜻한다.
				if($(this).is(":checked")) { // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
						cnt+=1;	
				}
			});
	        
        	 if ($('.cb').is(':checked') == true && cnt == 1) {
                //$("form").attr("action","/AtTicketProject/customer/cuslistupdate.do");
                //$("#deleteForm").submit();	
                window.open("/AtTicketProject/customer/cuslistupdate.do?seq=" + $('.cb:checked').val(),"수정","width=880,height=550");
             } else {
                 alert("하나만 체크하시오.");
             }
            	 cnt=0;
        });

        //삭제

        $("#delbtn").click(function () {
            if ($('input').is(':checked') == true) {
                if (confirm("정말로 삭제하시겠습니까?")) {
                	//alert("/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}");
                	//location.href="/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}";
                	$("#deleteForm").submit();	
                }
            } else {
                alert("하나 이상을 체크하시오.");
            }
        });
        
        
        
        $("#pagebar").val(${page}); // 서블릿이 준값을 기본값으로 

    </script>
</body>

</html>