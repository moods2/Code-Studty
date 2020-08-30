<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
 	<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">

    <style>
		#left {
           position: absolute;
           left: 0px;
           top: 0px;
           width: 250px;
           height: 1300px;
           /* border: 1px solid black; */
           background-color: #444;
           text-align: center;
           z-index: 10;
       }
       #right {
            border : 1px solid red;
            margin-left: 300px;
            margin-top: 100px;
            width : 700px;
            /* color : white;
            background-color: #C27BA0; */
        }
        #visitTitle {
            margin : 15px auto;
            border : 5px solid #C27BA0;
            color : #C27BA0;
            text-align: center;
            width : 120px;
            font-size: 2em;
        }
        #right2 {
            border : 1px solid black;
            /* text-align: center; */
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
            /* height: 1200px; */
            position: absolute;
            left: 250px;
            top: 120px;
        }

        #tbl {
            border: 1px solid red; 
            border-collapse: collapse;
            width: 880px;
            height: 80px;
            /* position: relative; */
            margin: 0px;
            margin-left : 320px;
        }
        #tbl th {
            text-align: center;            
            background-color: #999;
            height: 30px;
        
        }
        #tbl td {
            height: 30px;
        }
        #tbl th:nth-child(1), #tbl td:nth-child(7) {
            width: 100px;
            text-align: center;
        }
        #tbl th:nth-child(2), #tbl td:nth-child(1) {
            width: 80px;
            text-align: center;
        }
        #tbl th:nth-child(3), #tbl td:nth-child(2) {
            width: 50px;
            text-align: center;
        }
        #tbl th:nth-child(4), #tbl td:nth-child(3) {
            width: 200px;
            padding-left: 10px;
            text-align: center;
        }
        #tbl th:nth-child(5), #tbl td:nth-child(4) {
            width: 200px;
            text-align: center;
        }
        #tbl th:nth-child(6), #tbl td:nth-child(5) {
            width: 100px;
            text-align: center;
        }
        #tbl th:nth-child(7), #tbl td:nth-child(6) {
            width: 150px;
            text-align: center;
        }

        
        #btns {
            width: 800px;
            position: relative;
            margin-left: 980px;
            margin-top: 20px;

        }
        #btns > a {
            margin: 3px;
            box-shadow: none;
            border : 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 30px;
            font-weight: bold;  
        }
        #btns > a:hover {
            color : white;
        }

             /* 페이징바 색상 */
       .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
           background-color:#999999;
           border-color: #eeeeee;
       }
        
      .pagination > li > a, .pagination > li > span{
          color: black;
      }

      #slctp1, #slctp2 {
            margin-bottom: 0px;
        }
        #slctp1 {
            width: 250px;
            position: relative;
            left: 325px;
            top: 40px;
        }
        #slctp2 {
            margin-top : 10px;
            margin-bottom: 10px;
            margin-left: 900px;
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

</style>
        

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminEmployee</title>
</head>

<body>

    <div id = "title">
        <h1 style="color: #555;">인사 관리 <small> > Home  </small></h1>
    </div>
	<%@include file="/WEB-INF/views/inc/menu.jsp" %>

	
    <div id="content">
    	<!-- 차순 정리.  -->
        <div id = "slctp1">
            <button class = "selectNotice" style = "outline : none;" onclick="location.href='/AtTicketProject/adminemployee.do?sort=write';"><span><i class = "glyphicon glyphicon-sort"></i></span>등록순</button>
            <button class = "selectNotice" style = "outline : none;" onclick="location.href='/AtTicketProject/adminemployee.do?sort=desc';"><span><i class = "glyphicon glyphicon-sort"></i></span>오름차순</button>
            <button class = "selectNotice" style = "outline : none;" onclick="location.href='/AtTicketProject/adminemployee.do?sort=asc';"><span><i class = "glyphicon glyphicon-sort"></i></span>내림차순</button>
        </div>
        
		
		<!-- 검색어 입력하는 곳..! -->
		<form method = "GET" action = "/AtTicketProject/adminemployee.do" id = "searchform">
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
                    <th>선택</th>
                    <th>번호</th>
                    <th>이름(부서)</th>
                    <th>주민번호</th>
                    <th>전화번호</th>
                    <th>직급</th>
                    <th>월급</th>
                </tr>
                <c:forEach items="${list}" var="dto">
                <tr>
                    <td><input type="checkbox" name="is_check" class="cb"></td>
                    <td>${dto.seq}</td>
                    <td>${dto.name}(${dto.buseo})</td>
                    <td>${dto.ssn}</td>
                    <td>${dto.tel}</td>
                    <td>${dto.jikwi}</td>
                    <td>${dto.salary}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- <hr style="width: 940px;"> -->
        
        <div id="btns">
	        <a class="btn" id="btnadd"><i class="glyphicon glyphicon-plus"></i> 추가</a>
	        <a class="btn" id="btnmodify"><i class="glyphicon glyphicon-pencil"></i> 수정</a>
	        <a class="btn" id="btndelete"><i class="glyphicon glyphicon-trash"></i> 삭제</a>
    	</div>
        
 		
 		<div id="pbar" style = "padding-left : 500px; margin-top : 30px;">
	       	${pagebar}
 		</div>
 		
 		<!-- 삭제 -->
 		<form method = "POST" action = "/AtTicketProject/employee/adminemployeedelete.do" id = "delnumform" style = " visibility : hidden;">
 			<input type = "text" name = "delNum" id = "delNum">
 			<input type="submit" id = "delsubmit">
 		</form>
 		
 		<!-- 수정 (바꿔야한다) 하나만 넘어가므로 get방식을 취하자.-->
 		<form method = "GET" id = "editnumform" style = "visibility : hidden;">
 			<input type = "text" name = "editNum" id = "editNum">
 			<input type="submit" id = "editsubmit">
 		</form>
 		
 		
 		<!-- <form method = "POST" action = "/AtTicketProject/employee/adminemployeeedit.do" id = "editnumform" style = " visibility : hidden;">
 			<input type = "text" name = "editNum" id = "editNum">
 			<input type="submit" id = "editsubmit">
 		</form> -->
 		
 		
 		
    </div>
    

</body>
<script>
<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
	
	/* 	//로봇이 아님을 증명할 것이다.
	$("#robotTest").click(function(){
		 popupCenter("/AtTicketProject/adminsecure.do", 1000, 1000); 
	}); */
	
	
    // 추가 -> 완료
    $("#btnadd").click(function(){
        //window.open("/AtTicketProject/employee/adminemployeeadd.do","EmployeeAdd","width=600, height=600");
        popupCenter("/AtTicketProject/employee/adminemployeeadd.do", 600, 600);
    });
    
    
    
    // 수정
    var innerlist = $(".cb");
    var count = 0;
    var edithref = "/AtTicketProject/adminemployeeedit.do?editnum="
    
    $("#btnmodify").click(function(){
    	count = 0;
    	
    	//여기서는 몇개의 체크박스에 체크를 걸었는지 확인해줄것이다.
    	for (var i = 0; i < innerlist.length; i++) {
    		
            if($(innerlist[i]).is(":checked")) {
            	count++;
            } 
    	}
    	
    	//하나도 체크안하면 삭제가 불가능하게 만들어 줄것이다.
    	if(count != 1) {
    		alert("하나만 선택해주세요");
    	} else if (count == 0) {
    		alert("하나만 선택해주세요");
    	}
    	else {//딱 하나만 선택한 경우 
    		
			var throwNum = "";//넘겨줄 번호
			for (var i = 0; i < innerlist.length; i++) {
        		
                if($(innerlist[i]).is(":checked")) {
              	  
                	throwNum = $(innerlist[i]).parent().parent().children().eq(1).text() + "";
            		    	
                } 
        	}//for
        	
        	//edithref += throwNum;
        	
			popupCenter(edithref + throwNum,600,600);
    			
    	}

    });
    
    
    
    
    // 삭제 

    $("#btndelete").click(function(){
    	count = 0;
    	//alert(innerlist.length);
    	
    	//여기서는 몇개의 체크박스에 체크를 걸었는지 확인해줄것이다.
    	for (var i = 0; i < innerlist.length; i++) {
    		
            if($(innerlist[i]).is(":checked")) {
            	count++;
            } 
    	}
    	
    	//하나도 체크안하면 삭제가 불가능하게 만들어 줄것이다.
    	if(count == 0) {
    		alert("적어도 하나이상 체크해주세요.");
    	} else {
    		
    		if (confirm("정말 삭제하시겠습니까?")) {
    			
    			alert("삭제되었습니다.");
             	
    			var throwNum = "";//넘겨줄 번호
    			for (var i = 0; i < innerlist.length; i++) {
            		
                    if($(innerlist[i]).is(":checked")) {
                  	  
                    	throwNum += $(innerlist[i]).parent().parent().children().eq(1).text() + ",";
                    	
                    } 
            	}//for
            	
            	//alert(throwNum);
            	
            	$("#delNum").val(throwNum);//값을 변경해준다. 
            	
            	//alert($("#delNum").val());
            	console.log($("#delNum").val());
            	$("#delsubmit").trigger("click");
            	
             	
            }//삭제하는 곳. 
    	}
    });//삭제 버튼 눌렀을때 행동.
    
    

   
   
    //팝업 중앙정렬 알고리즘
    function popupCenter(href, w, h) {
    	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
    	xPos += window.screenLeft; 
    	var yPos = (document.body.offsetHeight/2) - (h/2);

    	window.open(href, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
    }
    
    
    
    
    

</script>

</html>