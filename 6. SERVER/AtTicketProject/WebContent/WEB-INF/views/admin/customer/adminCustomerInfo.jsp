<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

small {
	color: #777;
	font-family: Arial;
	font-size: 27.3px;
	font-weight: lighter;
}

body {
	outline: none;
}

#info {
	margin-top: 30px;
	margin-left: 280px;
}

td {
	text-align: center;
}

th {
	background-color: #999;
	/* color : white; */
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

.customertitle {
	margin-bottom: 20px;
	margin-top: 20px;
}

#img1 {
	width: 500px;
	margin-top: 20px;
	margin-left: -200px;
}

th {
	text-align: center;
}

.btnAll {
	margin-left: 640px;
	width: 200px;
}

#manipulate6{
	margin-left:750px;
}
</style>
</head>
<body>

	<div id="title">
		<h1
			style="color: #555; font-weight: bold; font-family: Arial; font-size: 3em;">
			회원정보 <small>> 고객 관리 > Home </small>
		</h1>
	</div>

	<div id="info" style="margin-left: 700px;">
		<h2 class="customertitle">최근 예매내역</h2>

		<div id="box1" style="width: 1000px;">
		<form method="POST" action="/AtTicketProject/customer/cusbookdelete.do?seq=${seq}&page=${page}&search=${search}" id = "deleteForm">
			<table class="table table-bordered" style="width: 800px;">
				
				<thead>
					<tr>
						<th style="text-align: center; width: 50px;"><input
							type="checkbox" name="cbAll1"></th>
						<th style="width: 100px; vertical-align: middle;">예매일</th>
						<th style="vertical-align: middle; width: 150px;">예매번호</th>
						<th style="vertical-align: middle;">공연명</th>
						<th style="vertical-align: middle; width: 100px;">관람일시</th>
						<th style="vertical-align: middle; width: 100px;">예매상태</th>

					</tr>
				</thead>
				<tbody id="tbody1">
				 <c:if test="${empty search and list.size() == 0}">
                    <tr>
                        <td colspan="6">검색 결과가 없습니다.</td>
                    </tr>
                </c:if>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td><input type="checkbox" class="cb1" name = "bookseq" value="${dto.bookseq}"></td>
						<td>${dto.bookdate}</td>
						<td>${dto.bookseq}</td>
						<td>${dto.showtitle}</td>
						<td>${dto.bdate}</td>
						<td>${dto.bookstate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div style="margin-left:690px;" class="btnAll" id="manipulate1">
				<!-- <button class="modified" id="makebtn1">
					<i class="glyphicon glyphicon-plus"></i>추가
				</button> -->
				<button type = "button" class="modified" id="modifybtn1">
					<i class="glyphicon glyphicon-pencil"></i>수정
				</button>
				<button type = "button" class="modified" id="delbtn1">
					<i class="glyphicon glyphicon-trash"></i>삭제
				</button>
			</div>
		</form>
			<h2 class="customertitle">Egg포인트 적립내역</h2>

			<div id="box1" style="width: 1000px;">
				<table class="table table-bordered" style="width: 800px;">
					<thead>
					<tr>
						<th style="text-align: center; width: 50px;"><input
							type="checkbox" name="cbAll2"></th>
						<th style="width: 200px; vertical-align: middle;">공연명(예매번호)</th>
						<th style="vertical-align: middle;">적립일</th>
						<th style="vertical-align: middle;">Egg포인트</th>
						<th style="vertical-align: middle;">적립상태</th>
						<th style="vertical-align: middle;">적립유형</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty search and list2.size() == 0}">
						<tr>
							<td colspan="6">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list2}" var="dto">
						<tr>
							<td><input type="checkbox" class="cb2" name = "cb2" value = "${dto.bookseq}"></td>
							<td>${dto.showtitle}</td>
							<td>${dto.pointdate}</td>
							<td>${dto.egg}</td>
							<td>${dto.valid}</td>
							<td>${dto.type}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="margin-left:750px;" class="btnAll" id="manipulate2">
				<!-- <button class="modified" id="makebtn2">
					<i class="glyphicon glyphicon-plus"></i>추가
				</button> -->
				<button class="modified" id="modifybtn2">
					<i class="glyphicon glyphicon-pencil"></i>수정
				</button>
				<!-- <button class="modified" id="delbtn2">
					<i class="glyphicon glyphicon-trash"></i>삭제
				</button> -->
			</div>
			<h2 class="customertitle">관심 공연</h2>
			
			<form method = "POST" action = "/AtTicketProject/customer/cusintershowdelete.do?seq=${seq}&page=${page}&search=${search}" id = "deleteForm2">
			<div id="box1" style="width: 1000px;">
				<table class="table table-bordered" style="width: 800px;">
				<thead>
					<tr>
						<th style="text-align: center; width: 50px;"><input
							type="checkbox" name="cbAll3"></th>
						<th style="width: 200px; vertical-align: middle;">공연명</th>
						<th style="vertical-align: middle;">기간</th>
						<th style="vertical-align: middle;">장소</th>
					</tr>
				</thead>
					<tbody>
					<c:if test="${empty search and list3.size() == 0}">
						<tr>
							<td colspan="4">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list3}" var="dto">
						<tr>
							<td><input type="checkbox" class="cb3" name = "myshowseq" value = "${dto.myshowseq}"></td>
							<td>${dto.showtitle}</td>
							<td>${dto.startdate} ~ ${dto.enddate}</td>
							<td>${dto.showaddr}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
			<div class="btnAll" id="manipulate3">
				<button class="modified" id="makebtn3">
					<i class="glyphicon glyphicon-plus"></i>추가
				</button>
				<button class="modified" id="modifybtn3">
					<i class="glyphicon glyphicon-pencil"></i>수정
				</button>
				<button type = "button" class="modified" id="delbtn3">
					<i class="glyphicon glyphicon-trash"></i>삭제
				</button>
			</div>
			<h2 class="customertitle">관람 공연</h2>
			
		<form method = "POST" action="/AtTicketProject/customer/cusviewdelete.do?seq=${seq}&page=${page}&search=${search}" id = "deleteForm4">
			<div id="box1" style="width: 1000px;">
				<table class="table table-bordered" style="width: 800px;">
					<thead>
						<tr>
							<th style="text-align: center; width: 50px;"><input
								type="checkbox" name="cbAll4"></th>
							<th style="width: 100px; vertical-align: middle;">공연명</th>
							<th style="vertical-align: middle;">기간</th>
							<th style="vertical-align: middle;">장소</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty search and list4.size() == 0}">
						<tr>
							<td colspan="4">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list4}" var="dto">
						<tr>
							<td><input type="checkbox" class="cb4" name = "cb4" value = "${dto.bookseq}"></td>
							<td>${dto.showtitle}</td>
							<td>${dto.startdate} ~ ${dto.enddate}</td>
							<td>${dto.showaddr}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
			<div style="margin-left:690px;" class="btnAll" id="manipulate4">
				<!-- <button class="modified" id="makebtn4">
					<i class="glyphicon glyphicon-plus"></i>추가
				</button> -->
				<button class="modified" id="modifybtn4">
					<i class="glyphicon glyphicon-pencil"></i>수정
				</button>
				<button type = "button" class="modified" id="delbtn4">
					<i class="glyphicon glyphicon-trash"></i>삭제
				</button>
			</div>
			<h2 class="customertitle">쿠폰</h2>
			
			<form method = "POST" action="/AtTicketProject/customer/cuscoupondelete.do?seq=${seq}&page=${page}&search=${search}" id = "deleteForm5">
			<div id="box1" style="width: 1000px;">
				<table class="table table-bordered" style="width: 800px">
				<thead>
					<tr>
						<th style="text-align: center; width: 50px;"><input
							type="checkbox" name="cbAll5"></th>
						<th style="width: 100px; vertical-align: middle;">할인금액</th>
						<th style="vertical-align: middle;">사용조건</th>
						<th style="vertical-align: middle;">사용기간</th>
						<th style="vertical-align: middle;">등록일</th>

					</tr>
				</thead>
				<tbody>
					<c:if test="${empty search and list5.size() == 0}">
						<tr>
							<td colspan="5">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list5}" var="dto">
						<tr>
							<td><input type="checkbox" class="cb5" name = "cuscouponseq" value = "${dto.cuscouponseq}"></td>
							<td>${dto.discount}</td>
							<td>${dto.terms}</td>
							<td>${dto.startdate} ~ ${dto.enddate}</td>
							<td>${dto.firstdate}</td>
						</tr>
					</c:forEach>
				</tbody>
	
				</table>
			</div>
			</form>
			
			<div class="btnAll" id="manipulate5">
				<button class="modified" id="makebtn5">
					<i class="glyphicon glyphicon-plus"></i>추가
				</button>
				<button class="modified" id="modifybtn5">
					<i class="glyphicon glyphicon-pencil"></i>수정
				</button>
				<button type = "button" class="modified" id="delbtn5">
					<i class="glyphicon glyphicon-trash"></i>삭제
				</button>
			</div>
			<!-- <h2 class="customertitle">프로필 사진</h2>

			<div id="box1" style="width: 1000px;">
				<table class="table table-bordered" style="width: 800px">
					<tr>
						<th
							style="width: 100px; vertical-align: middle; text-align: center;">사진</th>
						<td style="width: 1000px;">
							<div style="margin-left: -500px; margin-top: 15px;">
								<label for="txtphoto"></label><input type="file" id="txtphoto"
									style="display: inline-block; width: 200px;">
							</div>
							<div class="img_wrap">
								<img id="img1">
							</div>
						</td>

					</tr>
				</table>
			</div> -->

			<!-- <div class="btnAll" id="manipulate6">
				
				<button class="modified" id="modifybtn6">
					<i class="glyphicon glyphicon-pencil"></i>수정
				</button>
				
			</div> -->
		</div>
	</div>

	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
	 /* var sel_file;

	    $(document).ready(function () {
	        $("#txtphoto").on("change", handleImgFileSelect1);
	    });

	    function handleImgFileSelect1(e) {
	        var files = e.target.files;
	        var filesArr = Array.prototype.slice.call(files);

	        filesArr.forEach(function (f) {
	            if (!f.type.match("image.*")) {
	                alert("확장자는 이미지 확장자만 가능합니다.");
	                return;
	            }

	            sel_file = f;

	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $("#img1").attr("src", e.target.result);
	            }
	            reader.readAsDataURL(f);

	        });
	    } */
	    
	var cbAll1 = document.all.cbAll1; // 일괄 체크박스
    var cb1 = document.getElementsByClassName("cb1");

    // 모두 선택 기능, 페이지 이동 
    cbAll1.onchange = function () {
        for (var i = 0; i < cb1.length; i++) {
            cb1[i].checked = cbAll1.checked;
        }
    }

    var cbAll2 = document.all.cbAll2; // 일괄 체크박스
    var cb2 = document.getElementsByClassName("cb2");

    // 모두 선택 기능, 페이지 이동 
    cbAll2.onchange = function () {
        for (var i = 0; i < cb2.length; i++) {
            cb2[i].checked = cbAll2.checked;
        }
    }


    var cbAll3 = document.all.cbAll3; // 일괄 체크박스
    var cb3 = document.getElementsByClassName("cb3");

    // 모두 선택 기능, 페이지 이동 
    cbAll3.onchange = function () {
        for (var i = 0; i < cb3.length; i++) {
            cb3[i].checked = cbAll3.checked;
        }
    }

    var cbAll4 = document.all.cbAll4; // 일괄 체크박스
    var cb4 = document.getElementsByClassName("cb4");

    // 모두 선택 기능, 페이지 이동 
    cbAll4.onchange = function () {
        for (var i = 0; i < cb4.length; i++) {
            cb4[i].checked = cbAll4.checked;
        }
    }

    var cbAll5 = document.all.cbAll5; // 일괄 체크박스
    var cb5 = document.getElementsByClassName("cb5");

    // 모두 선택 기능, 페이지 이동 
    cbAll5.onchange = function () {
        for (var i = 0; i < cb5.length; i++) {
            cb5[i].checked = cbAll5.checked;
        }
    }
    
    $("#delbtn1").click(function () {
        if ($('.cb1').is(':checked') == true) {
            if (confirm("정말로 삭제하시겠습니까?")) {
            	//alert("/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}");
            	//location.href="/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}";
            	$("#deleteForm").submit();	
            }
        } else {
            alert("하나 이상을 체크하시오.");
        }
    });
    
    $("#delbtn3").click(function () {
        if ($('.cb3').is(':checked') == true) {
            if (confirm("정말로 삭제하시겠습니까?")) {
            	//alert("/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}");
            	//location.href="/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}";
            	$("#deleteForm2").submit();	
            }
        } else {
            alert("하나 이상을 체크하시오.");
        }
    });
    
    $("#delbtn4").click(function () {
        if ($('.cb4').is(':checked') == true) {
            if (confirm("정말로 삭제하시겠습니까?")) {
            	//alert("/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}");
            	//location.href="/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}";
            	$("#deleteForm4").submit();	
            }
        } else {
            alert("하나 이상을 체크하시오.");
        }
    });
    
    $("#delbtn5").click(function () {
        if ($('.cb5').is(':checked') == true) {
            if (confirm("정말로 삭제하시겠습니까?")) {
            	//alert("/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}");
            	//location.href="/AtTicketProject/customer/cuslistdelete.do?page=${page}&search=${search}";
            	$("#deleteForm5").submit();	
            }
        } else {
            alert("하나 이상을 체크하시오.");
        }
    });
    
    //추가

   /*  $("#makebtn1").click(function () {
        window.open("/AtTicketProject/customer/cusbookinsert.do", "예매추가", "width=700,height=300");
    });
    
    
     $("#makebtn2").click(function () {
        window.open("/AtTicketProject/customer/cuspointinsert.do", "포인트 적립추가", "width=500,height=300");
    });
 */
  
     $("#makebtn3").click(function () {
        window.open("/AtTicketProject/customer/cusintershowinsert.do?seq=${seq}", "관심공연 추가", "width=550,height=250");
    });

   
    /*  $("#makebtn4").click(function () {
        window.open("/AtTicketProject/customer/cusviewconcertinsert.do", "관람공연 추가", "width=600,height=350");
    }); */

  
     $("#makebtn5").click(function () {
        window.open("/AtTicketProject/customer/cuscouponinsert.do?seq=${seq}", "쿠폰 추가", "width=600,height=400");
    });
     

 	/* $("#makebtn6").click(function() {
 		if (confirm("정말로 추가하시겠습니까?")) {
 			location.href = "adminCustomer.html";
 		}
 	}); */


    //수정 
 	
 	var cnt = 0;
    
    $("#modifybtn1").click(function(){
        $(".cb1").each(function(){  // .each()는 forEach를 뜻한다.
			if($(this).is(":checked")) { // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
					cnt+=1;	
			}
		});
        
    	 if ($('.cb1').is(':checked') == true && cnt == 1) {
            //$("form").attr("action","/AtTicketProject/customer/cuslistupdate.do");
            //$("#deleteForm").submit();	
            window.open("/AtTicketProject/customer/cusbookupdate.do?seq=${seq}&bookseq="+$('.cb1:checked').val(),"예매 수정","width=700,height=400");
         } else {
             alert("하나만 체크하시오.");
         }
        	 cnt=0;
    });

    
     $("#modifybtn2").click(function () {
    	 $(".cb2").each(function(){  // .each()는 forEach를 뜻한다.
 			if($(this).is(":checked")) { // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
 					cnt+=1;	
 			}
 		});
         
     	 if ($('.cb2').is(':checked') == true && cnt == 1) {
        	window.open("/AtTicketProject/customer/cuspointupdate.do?seq=${seq}&bookseq="+$('.cb2:checked').val(), "포인트 적립수정", "width=500,height=400");
             //$("form").attr("action","/AtTicketProject/customer/cuslistupdate.do");
             //$("#deleteForm").submit();	
         
          } else {
              alert("하나만 체크하시오.");
          }
         	 cnt=0;
    });

  
     $("#modifybtn3").click(function () {
        /* window.open("/AtTicketProject/customer/cusintershowupdate.do", "관심공연 수정", "width=600,height=350"); */
        $(".cb3").each(function(){  // .each()는 forEach를 뜻한다.
 			if($(this).is(":checked")) { // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
 					cnt+=1;	
 			}
 		});
         
     	 if ($('.cb3').is(':checked') == true && cnt == 1) {
        	window.open("/AtTicketProject/customer/cusintershowupdate.do?seq=${seq}&myshowseq="+$('.cb3:checked').val(), "포인트 적립수정", "width=500,height=300");
             //$("form").attr("action","/AtTicketProject/customer/cuslistupdate.do");
             //$("#deleteForm").submit();	
         
          } else {
              alert("하나만 체크하시오.");
          }
         	 cnt=0;
    });

   
     $("#modifybtn4").click(function () {
        $(".cb4").each(function(){  // .each()는 forEach를 뜻한다.
 			if($(this).is(":checked")) { // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
 					cnt+=1;	
 			}
 		});
         
     	 if ($('.cb4').is(':checked') == true && cnt == 1) {
        	window.open("/AtTicketProject/customer/cusviewupdate.do?seq=${seq}&bookseq="+$('.cb4:checked').val(), "포인트 적립수정", "width=600,height=350");
             //$("form").attr("action","/AtTicketProject/customer/cuslistupdate.do");
             //$("#deleteForm").submit();	
         
          } else {
              alert("하나만 체크하시오.");
          }
         	 cnt=0;
    });

  
     $("#modifybtn5").click(function () {
        window.open("/AtTicketProject/customer/cuscouponupdate.do?seq=${seq}&cuscouponseq="+$('.cb5:checked').val(), "쿠폰 수정", "width=600,height=400");
    });
     
  
    $("#modifybtn6").click(function () {
        if(confirm("정말로 수정하시겠습니까?")){
            location.href = "adminCustomer.html";
        }
    });


	</script>
</body>
</html>