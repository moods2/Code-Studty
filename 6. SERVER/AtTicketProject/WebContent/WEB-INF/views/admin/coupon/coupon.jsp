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
		#left {
           position: absolute;
           left: 0px;
           top: 0px;
           width: 250px;
           height: 1600px;
           /* border: 1px solid black; */
           background-color: #444;
           text-align: center;
           z-index: 10;
       }
	


</style>
</head>
<body>
	
	<!-- ------------------------최상단 타이틀 시작------------------------ -->	
	<style>
	    /* 쿠폰 정보 */
        #title {
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }
	
	</style>
    <div id="title">
        <h1 style="color: #555; font-weight: bold;
        font-family: Arial;
        font-size: 3em;">쿠폰 정보 <small>> 쿠폰조회 > Home </small></h1>
    </div>
	<!-- ------------------------최상단 타이틀 끝------------------------ -->
	
	
	<!-- ------------------------쿠폰 조회 추가 수정 삭제  시작------------------------ -->
	
	<style>
		
		
		/* 페이지바 조정 */
    	.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
           background-color:#999999;
           border-color: #eeeeee;
       }
        
      .pagination > li > a, .pagination > li > span{
          color: black;
      }
      
      
      

      /* 쿠폰 이미지 처리*/
      .cimages {
        background-repeat: no-repeat;
        background-size: 100% 100%;
        width : 250px;
        height :200px;
        /* border: 1px solid blue; */
      }
      .cimages > div {
          /* border: 1px solid red; */
          width : 250px;
          height : 200px;
          font-size: 1.3em;
          font-weight: bolder;
          position: relative;
          top : 90px;
          left : -20px;
      }

      /* 테이블  내 td 조정 */
        #tbl td {
            text-align: center;
            vertical-align: middle;    
        }

        /* 추가 수정 삭제 관련 버튼. */

        .modf {
            border: 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 35px;
            font-weight: bold    
        }
        .modf:hover {
            color : white;

        }	
        
        /* 쿠폰테이블 제목 테이블 수정 */
        .title {
        
        	background-color : #999;
        }
        
	</style>
	
	
	<div id="info" style="position: relative; left: 550px;">
        <h2>쿠폰 정보</h2>
        
        <!-- 검색 창 시작 -->
        <form method = "GET" action = "/AtTicketProject/coupon/admincoupon.do" id = "searchform">
			<div style="margin-bottom: 10px; margin-left: 700px; width : 422px;" id="header">
	            <span class="search">
	                <span class="form-group">
	                    <span style="width: 300px;" class="input-group">
	                    	<input type="text" class="form-control" placeholder="검색어를 입력하세요." name="search" id="search" value = "${search}">
	                        <span class="input-group-addon" style="cursor:pointer;" onclick="$('#searchForm').submit();" ><i class="glyphicon glyphicon-search"></i></span>
	                    </span>
	                </span>
	            </span>
	        </div>
        </form>
        
        <!-- 검색 창 끝 -->
        
        <table style="width: 1000px;" class="table  table-bordered table-striped table-condensed" id="tbl">
            <tbody id="tbody1">
                <tr>
                    <th style="text-align: center; background-color : #999;"><input type="checkbox" name="cbAll"></th>
                    <th class="title" style="width: 80px;text-align: center;">Index</th>
                    <th class="title" style="width: 320px;text-align: center;">쿠폰명</th>
                    <th class="title" style="width: 250px;text-align: center;">기간</th>
                    <th class="title" style="width: 100px;text-align: center;">할인금액</th>
                    <th class="title" style="width: 250px;text-align: center;">쿠폰이미지</th>
                </tr>
                <c:forEach items="${list}" var="dto">
                <tr>
                    <td><input type="checkbox" class="cb" name="checkRow" value="1"></td>
                    <td class="data" id="index">${dto.seq}</td>
                    <td class="data">${dto.title}</td>
                    <td class="data">${dto.getStartDate()} ~ ${dto.getEndDate()}</td>
                    <td class="data">${dto.discount}</td>
                    <td class="data"><div class = "cimages" id = "img1" style = "background-image: url(../images/redcp.png);"><div>${dto.discount}원 할인쿠폰</div></div></td>
                </tr>
                </c:forEach>
			</tbody>
        </table>


        <!-- 내용물 수정/삭제 페이지 -->
        <div>
        	<button class = "modf" id = "makebtn" ><i class="glyphicon glyphicon-plus"></i> 쿠폰추가</button>
        	<button class = "modf" id = "modifybtn"><i class="glyphicon glyphicon-pencil"></i> 쿠폰수정</button>
        	<button class = "modf" id = "delbtn"><i class="glyphicon glyphicon-trash"></i> 쿠폰삭제</button>
        </div>


		<div id="pbar" style = "margin-left: 380px;">
	       	${pagebar}
 		</div>
 		
 		 <!-- 삭제 -->
 		<form method = "POST" action = "/AtTicketProject/coupon/coupondelete.do" id = "delnumform" style = " visibility : hidden;">
 			<input type = "text" name = "delNum" id = "delNum">
 			<input type="submit" id = "delsubmit">
 		</form>
 		
 		
    </div>	

	<!-- ------------------------쿠폰 조회 추가 수정 삭제  끝------------------------ -->
	



	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	
	<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	

    //쿠폰 정보 -> 일괄체크박스 하기 위함이다.
    var cbAll = document.all.cbAll; // 일괄 체크박스
    var child;
    var cb = document.getElementsByClassName("cb");

    // 모두 선택 기능, 페이지 이동 
    cbAll.onchange = function () {
        for (var i = 0; i < cb.length; i++) {
            cb[i].checked = cbAll.checked;
        }
    }
    
    
    /* 쿠폰 추가 수정 삭제 눌렀을때 반응! */
    
    //쿠폰추가
    
    $("#makebtn").click(function () {
    	popupCenter("/AtTicketProject/coupon/couponinsert.do", 700, 400);   
    });
    
    
    var innerlist = $(".cb");
    var count = 0;
    
    
    //삭제 -> 히든태그에 정보를 담아서 넘겨버릴것이다.
    $("#delbtn").click(function(){
    	count = 0;
    	
    	//카운트를 몇번했는지 알기위해 써준것이다.
    	for (var i = 0; i < innerlist.length; i++) {
    		
            if($(innerlist[i]).is(":checked")) {
            	count++;
            } 
    	}
    	
    	if(count == 0) {
    		alert("적어도 하나이상 체크해주세요.");
    	} else {
    		//여기서 삭제 시작할것이다.
    		
    		alert("삭제되었습니다");
    		
    		var throwNum = "";//넘겨줄 번호
    		
    		for (var i = 0; i < innerlist.length; i++) {
    			
    			if ($(innerlist[i]).is(":checked")) {
    				
    				throwNum += $(innerlist[i]).parent().parent().children().eq(1).text() + ",";
    				
    			}	
    		}//for
    		
    		//alert(throwNum);
    		
    		$("#delNum").val(throwNum);//값을 변경해준다
			$("#delsubmit").trigger("click");
    		
    		
    	}//else
    	
    });
    
    
    //수정
    var edithref = "/AtTicketProject/coupon/couponedit.do?editnum="//get방식으로 넘겨줄것이다.
    
    $("#modifybtn").click(function(){
    	count = 0;
    	//여기서는 몇개의 체크박스에 체크를 걸었는지 확인해줄것이다.
    	for (var i = 0; i < innerlist.length; i++) {
    		
            if($(innerlist[i]).is(":checked")) {
            	count++;
            } 
    	}
    	
    	
    	if(count != 1) {
    		alert("하나만 선택해주세요");
    	} else if (count == 0){
    		alert("하나만 선택해주세요");
    	} else {
    		//alert("수정을 시작합시다.");
    		//수정시작
    		var throwNum = "";//넘겨줄 번호
			for (var i = 0; i < innerlist.length; i++) {
        		
                if($(innerlist[i]).is(":checked")) {
              	  
                	throwNum = $(innerlist[i]).parent().parent().children().eq(1).text() + "";
            		    	
                } 
        	}//for
    		
			popupCenter(edithref + throwNum,700,400);
    	}
    });
    
    //팝업 중앙정렬 알고리즘
    function popupCenter(href, w, h) {
    	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
    	xPos += window.screenLeft; 
    	var yPos = (document.body.offsetHeight/2) - (h/2);

    	window.open(href, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
    }
    

	</script>
</body>
</html>