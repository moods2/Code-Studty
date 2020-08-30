<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
<style>
        #box {
            font-size: 15px;
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
        
        label {
        	font-weight:normal;
        }
</style>
</head>
<body>

    <legend style="width: 200px; margin:20px 25px; font-weight: bold;">쿠폰 추가</legend>
	
	<form method = "POST" action = "/AtTicketProject/coupon/couponinsertok.do">
		<div style="margin-left:30px;" id="box">
			쿠폰명 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="position: relative; top: -2px;" type="text" placeholder="제목을 입력하세요." name="titletxt" id="titletxt" autofocus autocomplete = "off">
			
			<div style="margin-top: 10px;">
					<label for="txtname">쿠폰 사용 가능 기간 : </label>
						<input style="width: 100px; text-align: center;" type="text" name="datefirst" id="datefirst" autocomplete = "off">
						
					<label for="datefirst">
						<span style="font-size: 1em; margin-left: 10px;" class="glyphicon glyphicon-calendar" id="cal"></span>
					</label> &nbsp;&nbsp; ~ &nbsp;&nbsp;
					
					<input style="width: 100px; text-align: center;" type="text" name="datesecond" id="datesecond" autocomplete = "off">
					
					<label for="datesecond">
						<span style="font-size: 1em; margin-left: 10px;" class="glyphicon glyphicon-calendar" id="cal1"></span>
					</label>
			</div>
			
			<div style="margin-top: 10px;">할인금액 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="position: relative; top: -2px;" type="text" name="pricetxt" id="pricetxt" autocomplete = "off"></div>
			
	    	<!-- 여기서 모든 공연을 불러옴. -->
			<div style="margin-top: 10px;">
				사용가능한 공연 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="avashow" id="avashow" style = "height: 30px;">
							<option value="" selected disabled hidden>==선택하세요==</option>
								<!-- <option value = "default">선택</option> -->
								<c:forEach items="${showList}" var="dto">
								<option value = "${dto.seq}">${dto.title}</option>
	        					</c:forEach>
	    					</select>
	    	</div>
	 		<div style="margin-top: 10px;">
	 			해당 공연 기간 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			<input type = "text" id = "term" name = "term" readonly>
	 		</div>
		</div>
		<br>
		<br>
			
		<div style="margin: 10px 20px; margin-left: 280px;">
	            <button type = "button" class = "modified" id = "makebtn"><i class="glyphicon glyphicon-plus"></i>추가</button>
	            <button type = "button" class = "modified" id = "closebtn"><i class="glyphicon glyphicon-remove"></i>닫기</button>
	    </div>
    </form>
    
    <script>   
		
    	//--------------달력 제어------------------    	
        var now = new Date();

        $("#datefirst").datepicker({
            dateFormat: "yy-mm-dd",
            minDate: now.getFullYear() + "-1-1",
            maxDate: now.getFullYear() + "-12-" + "31"
        });

        $("#datesecond").datepicker({
            dateFormat: "yy-mm-dd",
            minDate: now.getFullYear() + "-1-1",
            maxDate: now.getFullYear() + "-12-" + "31"
        });
        
      	//--------------달력 제어------------------  

        $("#closebtn").click(function(){
            window.close();
        }); 
        
        
        //select box 내부의 값이 변경될때  해당공연의 기간을 받아올 것이다. => ajax 처리
        $("#avashow").change(function(){
            
        	var showSeq = -1;
        	
        	$("#avashow option:selected").each(function() {

                //$("#sel").val($(this).val());
                //alert($(this).val());
        		showSeq = $(this).val();
            });
            
            
			$.ajax({
				//페이지를 요청
				type: "POST",//POST방식으로 요청할것이다.
				url: "/AtTicketProject/coupon/couponinsertajax.do",
				
				
				//동기 vs 비동기 -> async : false 가 동기방식, true 가 비동기 방식
				// - ajax 는 대부분 비동기 방식을 사용한다!
				// 비동기 방식 : 다른작업을 할때 기다리고만 있는것이 아님 -> 스마트폰 방식이라고 생각하면 된다 서로 말해도 노상관
				// 동기 방식 : 무전기라고 생각하면 된다 해당 작업을 기다리고 있어야한다! 한쪽에서 일방적으로 보내고 한쪽에서는 일방적으로 받고! 전형적인 동기방식이라고 생각하면 된다!
				async: true,
				
				//페이지 요청 + 데이터 전달(전송)
				//data : "num=10&id=hong"//get방식으로 넘기는 쿼리 스트링 이런식으로 데이터를 보낼 수 있다! 해당 데이터를 들고 갈것이다.
				data : "showSeq=" + showSeq,//애를안넘기면 데이터 전달이 안된다..String 형식이나 map 형식으로 넘길 수 있다.
				
				//요청 + 결과 반환(응답)
				//상대방이 응답할때 자동적으로 생겨나는 콜백함수라고 생각하면된다!
				//result 에 받아오는값을 잘 이해할 필요가 있다.
				success : function(result){
					//alert(result);
					//$("#result1 > span").text(result);//ex03ok에서 가져온  result 값을 적어주는 것이다.
					$("#term").val(result);
					
				},
				
				//ajax 통신하다가 에러나면 보임 -> 그냥 필수적으로 써주는 양식이다.
				error : function(a,b,c) {
					console.log(a,b,c);
				}
			});

        });
        
        
        
        //유효성 검증 -> 추가 버튼 눌렀을 경우에 처리
        var pf = 0;//0이 유지되는 경우 유효성 검사를 통과한다.
        
        $("#makebtn").click(function(){
        	pf = 0;
        	
        	
        	//1. 쿠폰명에 대한 처리. -> 쿠폰명은 한글 영문 숫자 모두 들어갈 수 있다!
        	//쿠폰명에 아무것도 입력하지 않았을 경우
        	if ($("#titletxt").val() == "") {
        		alert("쿠폰명을 입력해주세요");
        		$("#titletxt").select();
        		pf++;
        		return;
        	} 
        	
        	
        	//2. 쿠폰사용  가능 기간에 대한 처리
        	
        	//공백으로 놔둔 경우에
        	if($("#datefirst").val() == "") {
        		alert("쿠폰 사용 가능 기간을 입력해주세요");
        		$("#datefirst").select();
        		pf++;
        		return;
        	}
        	
        	if($("#datesecond").val() == "") {
        		alert("쿠폰 사용 가능 기간을 입력해주세요");
        		$("#datesecond").select();
        		pf++;
        		return;
        	}
        	
        	
        	//3. 할인금액에 대한 처리 -> 무조건 숫자만 들어가야 한다!
        	var pricetxt = document.getElementById("pricetxt");
        	
        	//아예 안적은 경우
        	if(pricetxt.value.length == 0) {
        		alert("할인금액을 입력해주세요.");
        		pricetxt.select();
        		pf++;
        		return;
        	} else {
        		//숫자로 기입하지 않은 경우
        		for (var i = 0; i < pricetxt.value.length; i++) {
        			
        			var price = pricetxt.value.charAt(i);
        			
        			if (price < "0" || price > "9") {
        				alert("할인금액은 숫자로만 입력이 가능합니다.")
        				pricetxt.select();
        				pf++;
        				return;
        			}
        		}
        	}//할인금액에 대한 처리
        	
        	
        	
        	//4. 해당 공연 기간에 대한 처리
        	//아무것도 없는 경우
        	if($("#term").val() == "") {
        		alert("공연을 선택해주세요");
        		$("#term").select();
        		pf++;
        		return;
        	}
        	
        	//5. 모든 검증을 마치고 기간이 맞는지 체크
        	if (pf == 0) {
        		//기간의 적합성 체크 -> 적합하지 않은 경우.
        		var flag = false;
        		
        		//쿠폰사용 가능기간 시작
        		var csyear = parseInt($("#datefirst").val().split("-")[0]);
        		var csmonth = parseInt($("#datefirst").val().split("-")[1]);
        		var csdate = parseInt($("#datefirst").val().split("-")[2]);
        		var date1 = new Date();
        		date1.setFullYear(csyear,csmonth-1,csdate);
        		
        		//쿠폰 사용가능기간 끝
        		var ceyear = parseInt($("#datesecond").val().split("-")[0]);
        		var cemonth = parseInt($("#datesecond").val().split("-")[1]);
        		var cedate = parseInt($("#datesecond").val().split("-")[2]);
        		var date2 = new Date();
        		date2.setFullYear(ceyear,cemonth-1,cedate);
        		
        		//해당 공연기간 
        		var showArr = $("#term").val().split("~");
        		
        		//해당 공연기간 시작
        		var tsyear = parseInt(showArr[0].split("-")[0]);
        		var tsmonth = parseInt(showArr[0].split("-")[1]);
        		var tsdate = parseInt(showArr[0].split("-")[2]);
        		var date3 = new Date();
        		date3.setFullYear(tsyear,tsmonth-1,tsdate);
        		
        	
        		//해당 공연기간 끝
        		var teyear = parseInt(showArr[1].split("-")[0]);
        		var temonth = parseInt(showArr[1].split("-")[1]);
        		var tedate = parseInt(showArr[1].split("-")[2]);
        		var date4 = new Date();
        		date4.setFullYear(teyear,temonth-1,tedate);
        		
        		
        		//console.log(date1.getTime() < date2.getTime());
        		
        		if (date1 < date2 && date1 >= date3 && date2 <= date4) {
        			//모든 조건을 만족한 경우.
        			$("#makebtn").attr("type","submit");
        			
        		} else if (date1 >= date2) {
        			alert("쿠폰 사용 가능 기간을 확인해주세요");
        			$("#datefirst").select();
        			return;
        		} else {
        			alert("쿠폰 사용기간은 해당 공연기간 내여야 합니다.");
        			$("#datefirst").select();
        			return;
        		}
        		

        	} 
        	

        });
        
        
        //닫기버튼을 누른 경우에
        $("#closebtn").click(function(){
        	window.close();
        })
        
        
        

        
    </script>
</body>
</html>