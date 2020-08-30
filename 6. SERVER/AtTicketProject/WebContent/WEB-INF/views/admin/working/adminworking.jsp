<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">

    <style>

       #right {
            /* border : 1px solid red; */
            margin-left: 500px;
            margin-top: 30px;
            width : 1000px;

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
        #btnadd {
            position: relative;
            top: 55px;
            left: 650px;

            border : 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 35px;
            font-weight: bold;   
        }
        #btnadd:hover {
            color : white;

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
            /* background-color: #333; */

        }
        
        #tbl th {
            background-color: #999;
            text-align: center;
        }
        #tbl td { text-align: center;}
        #tbl td:nth-child(3) {
            text-align: left;
            padding-left: 20px;
        }

        #slctp1, #slctp2 {
            float : left;
            /* margin-left : 100px; */
            margin-bottom: 0px;
        }

        #slctp2 {
            margin-top : 10px;
            margin : 10px auto;
            margin-bottom: 10px;
            width : 300px;
            margin-left: 700px;
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
                padding-right: 5px;
               /* font-size: 1.5em; */
               position: relative;
               top: 40px;
        }
        .selectNotice:last-child {
            border-right: 0px;
        }

        .selectNotice:hover {
            color : #111;
            font-weight: bold;
        }
        
        /* 페이징바 색상 */
       .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
           background-color:#999999;
           border-color: #eeeeee;
       }
        
      .pagination > li > a, .pagination > li > span{
          color: black;
      }
      .pagination {
		      style="width: 500px; position: relative; margin: 20px auto;
      }
      .pagebar {
      width: 600px;
      margin: 0px auto;
      margin-left: 800px;
      }
      
    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminWorking</title>
</head>

<body>

    <div id = "title">
        <h1 style="color:#555">업무 현황</h1>
    </div>

	

    
    <div id = "right">

        <!-- <div id = "slctp1">
            <button class = "selectNotice" style = "outline : none;"><span><i class = "glyphicon glyphicon-sort"></i></span>등록순</button>
            <button class = "selectNotice" style = "outline : none;"><span><i class = "glyphicon glyphicon-sort"></i>오름차순</button>
            <button class = "selectNotice" style = "outline : none;"><span><i class = "glyphicon glyphicon-sort"></i>내림차순</button>
        </div> -->
            <!-- <input type="button" class = "selectNotice" value = "등록순">
            <input type="button" class = "selectNotice" value = "오름차순">
            <input type="button" class = "selectNotice" value = "내림차순"> -->
        
        
        <!-- <select style=" position: relative; left: 370px; top: 43px; height: 30px; outline: none;">
            <option>개발부</option>
            <option>영업부</option>
            <option>마케팅부</option>
            <option>인사부</option>
            <option>디자인부</option>
            <option>총무부</option>
        </select> -->
		
		
        <!-- <div id = "slctp2">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
				<span class="input-group-addon" id = "searchlogo"><i class="glyphicon glyphicon-search"></i></span>
			</div>
        </div> -->
        <form style="margin-left: 700px;" method="GET" action="/AtTicketProject/adminworking.do" id="searchForm">
	                <div style="width: 300px;" class="input-group search">
	                    <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon2" name="search" id="search" required value="${search}">
	                    <span class="input-group-addon" id="basic-addon2" style="cursor:pointer;" onclick="$('#searchForm').submit();"><span class="glyphicon glyphicon-search"></span></span>
	                </div>
                </form>
                
                <div style="clear:both;"></div>


        <table id="tbl" class="table table-striped table-bordered table-condensed">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>부서</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>조회수</th>
                </tr>
           </thead>
           <tbody>
           <c:if test="${not empty search and list.size() == 0}">
                    	<tr>
                    		<td colspan="5">검색 결과가 없습니다.</td>
                    	</tr>                    	
                    	</c:if>
                    	
                    	<c:if test="${empty search and list.size() == 0}">
                    	<tr>
                    		<td colspan="5">게시물이 없습니다.</td>
                    	</tr>                    	
                    	</c:if>
                <c:forEach items="${list}" var="dto">
                <tr>
                    <td>${dto.seq}</td>
                    <td style="color: red;">공지</td>              
                          
                    <td>
                    <a href="/AtTicketProject/adminnoticecontent.do?seq=${dto.seq}&search=${search}">
                    ${dto.title}
                    </a>
                    </td>
                    <td>${dto.name}</td>
                    <td>${dto.regdate}</td>
                    <td>${dto.nview }</td>
                </tr>
                </c:forEach>
            </tbody>

            </tbody>
        </table>
        


       <!--  <nav class="pagebar" style="width: 500px; position: relative; margin: 20px auto;">
=======
		
		
        <nav class="pagebar" style="width: 500px; position: relative; margin: 20px auto;">
>>>>>>> 6837d78116448c6d0bbe7836de94fe1ae0cd02b1
            <ul class="pagination">
              <li>
                <a href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="active"><a href="#">1</a></li>
               <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">6</a></li>
              <li><a href="#">7</a></li>
              <li><a href="#">8</a></li>
              <li><a href="#">9</a></li>
              <li><a href="#">10</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
                
              </li>
            </ul>
             </nav> 
            -->
             <nav style="width: 500px; position: relative; margin: 0px auto;">
            <a style="margin-top: -40px;" class="btn" id="btnadd"><i class="glyphicon glyphicon-plus"></i> 글쓰기</a>
       		 </nav> 

    </div>
    	${pagebar}
    <%@include file="/WEB-INF/views/inc/menu.jsp" %>

</body>

<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>
    $("#btnadd").click(function(){
        location.href="adminnoticeedit.do";
    });

    var date = document.getElementById("date");
    var now = new Date();
    var sw = document.images["sw"];
	
    function movePage() {
		//alert(event.srcElement.value);
		location.href = "/AtTicketProject/adminworking.do?page=" + event.srcElement.value;
	}
    
    
	$("#pagebar").val(${page});
</script>


</html>