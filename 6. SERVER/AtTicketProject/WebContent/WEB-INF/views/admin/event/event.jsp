<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
<style>
 #title {
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        * {
            outline: none;
        }

        #info {
            margin-top: 30px;
            margin-left: 280px;
        }

        td {
            text-align: center;
        }

        .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
           background-color:#999999;
           border-color: #eeeeee;
       }
        
      .pagination > li > a, .pagination > li > span{
          color: black;
      }
      
      th {
            background-color:  #999;
            /* color : white; */
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
        
</style>
</head>
<body>
 <div id="title">
        <h1 style="color: #555; font-weight: bold;
        font-family: Arial;
        font-size: 3em;">이벤트 관리 <small>> Home </small></h1>
    </div>

    <div id="info" style="position: relative; left: 300px;">
        <h2>이벤트 관리</h2>
        <div style="margin-bottom: 10px; margin-left: 430px;" id="header">
            <select style="float:left; margin-right: 20px; width: 100px;" name="sel1" id="sel1" class="form-control">
                <option value="name">제목</option>
                <option value="month">기간(월)</option>
                <option value="year">기간(년)</option>
                <option value="sale">구분</option>
            </select>

            <span class="search">
                <span class="form-group">
                    <span style="width: 300px;" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                    </span>
                </span>
            </span>
        </div>
        <table style="width: 850px;" class="table table-striped table-bordered table-condensed" id="tbl">
            <tbody id="tbody1">
                <tr>
                    
                    <th class="title" style="width: 100px;text-align: center;">번호</th>
                    <th class="title" style="width: 400px;text-align: center;">제목</th>
                    <th class="title" style="width: 200px;text-align: center;">기간</th>
                    <th class="title" style="width: 150px;text-align: center;">구분</th>
                    <th class="title" style="width: 200px;text-align: center;">배너</th>
                    <th class="title" style="width: 200px;text-align: center;">배너</th>
                   </tr>
                    
                <c:forEach items="${list}" var="dto">
                <c:if test="${dto.delflag==0}">
                <tr >
                 
                    <td class="data" id="index">${dto.seq}</td>
                    <td class="data" ><a id="edit" href="/AtTicketProject/event/eventedit.do?seq=${dto.seq}" onclick="window.open(this.href, '_blanck', 'width= 700, height = 500'); return false">${dto.title}</a></td>
                    <td class="data">${dto.startdate}-${dto.enddate}</td>
                    <td class="data">${dto.eindex}</td>
                    <td class="data">${dto.banner}</td>
                    <td class="data">${dto.content}</td>
                </tr>
                </c:if>
                </c:forEach>
                
        	</tbody>
        </table>
       
        <div style="margin-left: 700px; width: 150px;">
            <button class = "modified" id = "makebtn"><i class="glyphicon glyphicon-plus"></i>추가</button>
            
            <button class = "modified" id = "delbtn"><i class="glyphicon glyphicon-trash"></i>수정</button>
        </div>
        <!-- <nav style="margin-left: 230px;" class = "pagebar">
            <ul class="pagination">
              <li>
                <a href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">6</a></li>
              <li class = "active"><a href="#">7</a></li>
              <li><a href="#">8</a></li>
              <li><a href="#">9</a></li>
              <li><a href="#">10</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav> -->
    </div>
  <div style="margin-top:-50px; margin-left:950px;">${pagebar}</div>
	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
	

	$("#makebtn").click(function () {        
            window.open("/AtTicketProject/event/eventinsert.do", "추가", "width=700, height=500");
        
    });
	
	$("#delbtn").click(function () {        
        window.open("/AtTicketProject/event/eventedit.do", "수정", "width=700, height=500");
    
});
	
   
   function movePage() {
		//alert(event.srcElement.value);
		location.href = "/AtTicketProject/adminworking.do?page=" + event.srcElement.value;
	}

   $("#pagebar").val(${page});
	</script>
</body>
</html>