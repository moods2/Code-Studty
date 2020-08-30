<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
    <style>


        #cal {
            position: relative;
            top: 15px;
            left: 5px;
        }

        body{
            font-family: 'NanumBarunGothic';
        }

        #visitTitle {
            margin : 15px auto;
            border : 5px solid #C27BA0;
            color : #C27BA0;
            text-align: center;
            width : 120px;
            font-size: 2em;
        }
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        #content {
            /* border: 1px solid red; */
            width: 80%;
            height: 1880px;
            position: absolute;
            left: 250px;
            top: 120px;
        }

        #tbl {
            /* border: 1px solid gray; */
            border-collapse: collapse;
            width: 1000px;
            height: 100px;
            position: relative;
            margin: 0px auto;
        }
        #tbl th {
            text-align: center;            
            background-color: #999;
            height: 30px;
        }
        #tbl td {
            height: 30px;
        }
        #tbl th:nth-child(1), #tbl td:nth-child(1) {
            width: 70px;
            text-align: center;
        }
        #tbl th:nth-child(2), #tbl td:nth-child(2) {
            width: 100px;
            text-align: center;
        }
        #tbl th:nth-child(3), #tbl td:nth-child(3) {
            width: 350px;
            padding-left: 10px;
            text-align: center;
        }
        #tbl th:nth-child(4), #tbl td:nth-child(4) {
            width: 250px;
            text-align: center;
        }
        
        #btns {
            width: 600px;
            position: relative;
            margin-left: 1190px;
            outline: none;
            font-weight: border;
            height : 35px;
            font-weight: bold;
            margin-top: 10px;
        }
        #btns > a {
            background-color: #999;
            color : rgb(220,220,220);
            margin: 3px;
            box-shadow: none;
            border: 0px;
        }
        #btns > a:hover {
            color: white;
        }
        
        /* 페이징바 색상 */
        .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
            background-color:#999999;
            border-color: #eeeeee;
        }
        
        .pagination > li > a, .pagination > li > span{
            color: black;
        }

         #slctp1 {
            width: 250px;
            /* margin-top: px; */
            position: relative;
            left: 270px;
            top: 40px;
        }
        #slctp2 {
            margin-top : 10px;
            margin-bottom: 10px;
            margin-left: 960px;
            /* margin : 10px auto; */
            width : 300px;
        }
        .selectNotice {
                /* border: 1px solid black; */
                text-align: center;
                margin: 10px 0px;
                margin-bottom: -10px;
                background-color: white;
                border : 0px;
                height : 20px;
                border-right: 1px solid #999;
                color : #777;
                padding: 0px;
                padding-right: 5px;
                /* font-size: 1.5em; */
        }
        .selectNotice:last-child {
            border-right: 0px;
        }

        .selectNotice:hover {
            color : #111;
            font-weight: bold;
        }
        #pbar{
        	
        	width:500px;
        	position: relative;
        	left: 550px;
        	top: 0px;
        	
        }
        
    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminShow</title>
   
</head>

<body>

    <div id = "title">
        <h1 style="color:#555">공연 관리 <small> > Home  </small></h1>
    </div>
	<%@include file="/WEB-INF/views/inc/menu.jsp" %>


    <div id="content">

        <div id = "slctp1">
            <button class = "selectNotice" style = "outline : none;" onclick="location.href='/AtTicketProject/adminshow.do?sort=write&page=${page}&search=${search}';"><span><i class = "glyphicon glyphicon-sort"></i></span>등록순</button>
            <button class = "selectNotice" style = "outline : none;" onclick="location.href='/AtTicketProject/adminshow.do?sort=desc&page=${page}&search=${search}';"><span><i class = "glyphicon glyphicon-sort"></i></span>오름차순</button>
            <button class = "selectNotice" style = "outline : none;" onclick="location.href='/AtTicketProject/adminshow.do?sort=asc&page=${page}&search=${search}';"><span><i class = "glyphicon glyphicon-sort"></i></span>내림차순</button>
        </div>
	
		<form method="GET" action="/AtTicketProject/adminshow.do" id="searchForm">
        <div id = "slctp2">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-describedby="basic-addon2" name="search" id="search" value="${search}">
				<span class="input-group-addon" id="basic-addon2" style="cursor:pointer;" onclick="$('#searchForm').submit();"><i class="glyphicon glyphicon-search"></i></span>
			</div>
        </div>
        </form>

        <table id="tbl" class="table table-striped table-bordered table-condensed">
            <tbody id="tbody">
                <tr>
                    <th>번호</th>
                    <th>장르</th>
                    <th>제목</th>
                    <th>기간</th>

                </tr>
                
                <c:forEach items="${list}" var="dto">
                <tr>
                    <td>${dto.seq}</td>
                    <td>${dto.genre}</td>
                    <td><a href="/AtTicketProject/adminshowview.do?seq=${dto.seq}&page=${page}&search=${search}">
                    ${dto.title}
                    </a></td>
                    <td>${dto.startDate} ~ ${dto.endDate}</td>
                </tr>
                </c:forEach>
                
            </tbody>
        </table>
        
        <div id="btns">
            <a class="btn btn-primary" id="btnadd"><i class="glyphicon glyphicon-plus"></i> 추가</a>
        </div>
 
 		<div id="pbar">
	       	${pagebar}
 		</div>
        

       

    </div>

</body>
<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
    
    // 추가
    $("#btnadd").click(function(){
        window.open("/AtTicketProject/adminshowadd.do","_self");
    });
    
    
    var index = 0;
	
	//서블릿에서 request.setAttribute로 넘긴 거는 el로 사용해야 한다.
	// "${sort}" ""를 붙여야 문자열로 처리되어 비교 가능해진다.
	if("${sort}" == "seq") {
		index = 0;
	} else if("${sort}" == "heart") {
		index = 1;
	} else if("${sort}" == "readcount") {
		index = 2;
	}
	
	$("#pagebar").val(${page});

</script>

</html>