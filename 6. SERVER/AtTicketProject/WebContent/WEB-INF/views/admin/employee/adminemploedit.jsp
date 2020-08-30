<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <style>
        @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); }

        body{
            font-family: 'NanumBarunGothic';
        }
        html{
            width: 500px;
        }
        #title{
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            width: 500px;
            border-bottom: 1px dashed black;
        }
        h1{
            font-weight: bold;
            font-family: Arial;
            font-size: 3em; 
            /* color: #B4A7D6; */
        }


        #content {
            /* border: 1px solid red; */
            width: 100%;
            height: 450px;
           
        }

        #add {
            width: 500px;
            height: 450px;
            position: relative;
            left: 40px
            /* margin: 20px auto; */
            
        }
        #content > #add > div {
            margin: 10px;

        }
        #content > #add > div > label {
            margin: 5px;
        }
/*         #btnadd {
            margin-top: 0px;
            margin-left: 200px;
        } */
    </style>

    <style type="text/css">
        .img_wrap {
            /* border: 1px solid black; */
            width: 300px;
            height: 100px;
            margin-top: 50px;
        }
        .img_wrap img {
            max-width: 50%;
        }

    </style>
   

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>adminEmployeeEdit</title>
</head>

<body>

    <div id = "title">
        <h1 style="color: #444;">직원 추가</h1>
    </div>



	
    <div id="content">
    	<form method = "POST" action = "/AtTicketProject/admineditok.do">
        <fieldset id="add" class="form-control" style="border: 0px;">
			
            <div><label for="txtname">*이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="txtname" name = "txtname" style="width: 100px;" value = "${name}" autofocus autocomplete="off"></div>
            <br>
            <div><label for="txtjumin">*주민번호 : &nbsp;</label>
                 <input type="text" class="txtjumin" style="width: 100px;" autofocus id = "txtjuminfirst" name = "txtjuminfirst" autocomplete="off" value = "${firstSsn}"><span> - </span><input type="text" class="txtjumin" style="width: 100px;" autofocus name = "txtjuminlast"  id = "txtjuminlast" autocomplete="off" value = "${secondSsn}">
            </div>
            <br>
            <div><label for="txtphone">*전화번호: &nbsp;</label>
                <input type="text" value="010" class="txtphone" name = "txtteltop" style="width: 50px;" autocomplete="off">
                <span> - </span>
                <input type="text" class="txtphone" style="width: 50px;" autofocus name = "txttelmiddle" id = "txttelmiddle" autocomplete="off" value = "${middleTel}">
                <span> - </span>
                <input type="text" class="txtphone" style="width: 50px;" autofocus name = "txttelbottom" id = "txttelbottom" autocomplete="off" value = "${bottomTel}">
            </div>
            <br>
            <!-- <div><label for="txtgrade">직급 : </label><input type="text" id="txtgrade" name = "txtgrade" style="width: 70px;" autofocus></div> -->
            <div>
            	<label for="txtgrade">*직급 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            		<select id="txtgrade" name = "txtgrade" style="width: 70px;">
            			<option value = "사원" <c:if test="${jikwi == '사원'}">selected='selected'</c:if>>사원</option>
            			<option value = "대리" <c:if test="${jikwi == '대리'}">selected='selected'</c:if>>대리</option>
            			<option value = "과장" <c:if test="${jikwi == '과장'}">selected='selected'</c:if>>과장</option>
            			<option value = "차장" <c:if test="${jikwi == '차장'}">selected='selected'</c:if>>차장</option>
            			<option value = "부장" <c:if test="${jikwi == '부장'}">selected='selected'</c:if>>부장</option>
            			<option value = "이사" <c:if test="${jikwi == '이사'}">selected='selected'</c:if>>이사</option>
            		</select>
            </div>
            <br>
            <div><label for="txtsalary">*월급 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" id="txtsalary" name = "txtsalary" style="width: 150px;" autofocus autocomplete="off" value = "${salary}"></div>
			<br>
			<div><label for="txtbuseo">*부서배치 : &nbsp;&nbsp;&nbsp;</label>
				<select name = "txtbuseo">
					
					<option value = "인사부" <c:if test="${buseoName == '인사부'}">selected='selected'</c:if> >인사부</option>
					<option value = "개발부" <c:if test="${buseoName == '개발부'}">selected='selected'</c:if>>개발부</option>
					<option value = "기획부" <c:if test="${buseoName == '기획부'}">selected='selected'</c:if>>기획부</option>
					<option value = "경영지원" <c:if test="${buseoName == '경영지원'}">selected='selected'</c:if>>경영지원</option>
					<option value = "홍보부" <c:if test="${buseoName == '홍보부'}">selected='selected'</c:if>>홍보부</option>
					<option value = "영업부" <c:if test="${buseoName == '영업부'}">selected='selected'</c:if>>영업부</option>
				</select>
			</div>
			<br>
			<div style = "height : 200px;">
            <div style = "float : left; margin-left : 150px;"><input type="button" id="btnedit" value="수정하기" class="btn btn-default"></div>
            <div style = "float : left; margin-left : 20px;"><input type="button" id="btnmenu" value="목록으로" class="btn btn-default"></div>
            </div>
            <br>
        </fieldset>
        <div style = "visibility:hidden;">
        	<input type = "text" name = "empSeq" value = "${seq}">
        </div>
        </form>
    </div>


</body>
<script>

	//목록으로 나가기 -> get 방식이므로... 나가기할떄 새로고침 필수..
	$("#btnmenu").click(function(){
		
		opener.location.reload();
		 window.close();

	});
	
	

	//아래에서 유효성 검증을 할것이다.
	
	
	
	
	

	var pf = 0;//아직 유효성 검증을 통과하지 못함. -> 0 이 유지되는 경우 유효성 검사를 통과한다.
	
    $("#btnedit").click(function() {
        //입력된 버튼 추가하기 -> 여기서 유효성 검사를 해줄것이다.
       	//alert("이름을 필수로 입력해주세요");
         pf = 0;//여기서 초기화 작업 한번 수행해준다.
        
        //1.이름에 관련된 유효성검사!
        var txtname = document.getElementById("txtname");
        
        //이름에 아무것도 입력하지 않았을 경우.
        if ($("#txtname").val() == "") {
        	alert("이름을 필수로 입력해주세요");
        	$("#txtname").focus();
        	pf++;
        	return;
        } else {
            // 쓰긴 썻는데 한글로만 구성되어 있는지 검사하자
            for (var i=0; i < txtname.value.length; i++) {
            	
                var c = txtname.value.charAt(i);

                if(c < "가" || c > "힣") {
                    alert("이름은 한글로 입력하세요.");
                    txtName.select();
                    pf++;
                    return;//다시 돌지 않고 루프를 그냥 빠져나가기 위함이다.
                }
            }        	
        }
        

        //2.주민번호에 관련된 유효성 검사
        var txtjuminfirst = document.getElementById("txtjuminfirst");
        var txtjuminlast = document.getElementById("txtjuminlast");
        var juminList = [txtjuminfirst,txtjuminlast];
        
        for (var i = 0; i < juminList.length; i++) {
        	
        	//주민번호를 하나도 안적은 경우
        	if (juminList[i].value.length == 0) {
        		alert("주민번호를 입력해주세요");
        		juminList[i].select();
        		pf++;
        		return;//리턴을 땡기면서 중단시켜주는 역할도 수행한다.
        	} else {
        		// 기입하긴 기입 했는데 입력값이 6자가 아닌경우 -> 주민번호는 앞자리 뒷자리 모두 6자리가 되어야 한다!.
        		if (juminList[i] == txtjuminfirst && juminList[i].value.length != 6) {
       				alert("주민번호 양식과 동일하게 입력해주세요");
        			juminList[i].select();
        			pf++;
        			
        		} else if (juminList[i] == txtjuminlast && juminList[i].value.length != 7) {
        			alert("주민번호 양식과 동일하게 입력해주세요");
        			juminList[i].select();
        			pf++;
        		} else {
        			// 주민번호 잘 적은경우 -> 숫자로만 구성되어 있는지 볼것이다.
                	for (var j = 0; j < juminList[i].value.length; j++) {
                		
                		var jc = juminList[i].value.charAt(j);
                		if (jc < "0" || jc > "9") {
                			alert("주민등록번호는 숫자로만 입력이 가능합니다.");
                			juminList[i].select();
                			pf++;
                			return;
                		}
                	} 	
        		}
        	}
        }
        
        
        //3.전화번호 유효성 검사
        var txttelmiddle = document.getElementById("txttelmiddle");
        var txttelbottom = document.getElementById("txttelbottom");
        var telList = [txttelmiddle,txttelbottom];
        
        for (var i = 0; i < telList.length; i++) {
        	
        	//전화번호를 하나도 입력 안한경우
        	if (telList[i].value.length == 0) {
        		alert("전화번호를 입력해주세요");
        		telList[i].select();
        		pf++;
        		return;//리턴을 땡기면서 중단시켜주는 역할도 수행한다.
        	} else {
        		//기입하기는 했는데 4자리숫자가 아닌경우.
        		if (telList[i].value.length != 4) {
        			alert("전화번호는 4자리 숫자만 입력해주세요");
        			telList[i].select();
            		pf++;
            		return;//리턴을 땡기면서 중단시켜주는 역할도 수행한다.
        		} else {
        			//4자리 숫자를 잘 입력한 경우 -> 이제 숫자만 들어있는지 확인해준다.
                	for (var j = 0; j < telList[i].value.length; j++) {
                		
                		var tc = telList[i].value.charAt(j);
                		if (tc < "0" || tc > "9") {
                			alert("전화번호는 숫자로만 입력이 가능합니다.");
                			telList[i].select();
                			pf++;
                			return;
                		}
                	} 
        		}	
        	}
        }
        
      		//4.월급 유효성 검사
      		var txtsalary = document.getElementById("txtsalary");
        	if (txtsalary.value.length == 0) {
        		//월급을 하나도 안적은 경우
        		alert("해당 직원의 급여를 입력해주세요");
        		txtsalary.select();
        		pf++;
        		return;//리턴을 땡기면서 중단시켜주는 역할도 수행한다.
        	} else {
        		//월급에 기입은 했는데 숫자로만 기입하지 않은 경우
            	for (var j = 0; j < txtsalary.value.length; j++) {
            		
            		var ts = txtsalary.value.charAt(j);
            		if (ts < "0" || ts > "9") {
            			alert("급여는 숫자로만 입력이 가능합니다.");
            			txtsalary.select();
            			pf++;
            			return;
            		}
            	} 
        	}
      		
        	//이상이 없을경우  DB로 넘겨주는 작업을 수행한다.
			
      		if (pf == 0) {
      			//하나의 오류도 없는경우 -> 넘겨줄 것이다.
      			$("#btnedit").attr("type","submit");
      		}
    });

    



</script>
