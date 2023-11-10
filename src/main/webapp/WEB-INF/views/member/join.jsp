<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Mall</title>
    <link rel="stylesheet" href="../css/login.css" />
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <body class="text-center">

     <main class="form-signin">

        <form:form modelAttribute="memberRequest" method="post">
          <h1 class="h3 mb-3 fw-normal">회원가입</h1>

          <span class="id_input_check_success">사용 가능한 이메일입니다.</span>
          <span class="id_input_check_fail">이미 존재하는 이메일입니다.</span>

          <div class="form-floating">
              <form:input path="memberEmail" class="form-control" />
              <label for="floatingInput">Email</label>
              <form:errors path="memberEmail" />
          </div>

          <div class="form-floating">
            <form:input path="memberPw" class="form-control" />
            <label for="floatingPassword">password</label>
            <form:errors path="memberPw" />
          </div>

          <div class="form-floating">
            <form:input path="memberNickname" class="form-control" />
            <label for="floatingUsername">nickname</label>
            <form:errors path="memberNickname" />
          </div>

          <div class="form-floating">
            <form:input path="memberAddr1" class="form-control" readonly="true" />
            <label for="floatingUsername">memberAddr1</label>
            <form:errors path="memberAddr1" />
          </div>

          <div class="form-floating">
            <form:input path="memberAddr2" class="form-control" readonly="true" />
            <label for="floatingUsername">memberAddr2</label>
            <form:errors path="memberAddr2" />
          </div>

          <div class="form-floating">
            <form:input path="memberAddr3" class="form-control" readonly="true" />
            <label for="floatingUsername">memberAddr3</label>
            <form:errors path="memberAddr3" />
          </div>
          <div class="address-button" onclick="kakao_address()">
            <input type="button" value="주소찾기" class="w-100 btn btn-lg btn-primary" />
          </div>

          <br>
          <button class="w-100 btn btn-lg btn-primary" type="submit">회원 가입</button>
        </form:form>
      </main>
    <%@ include file="../include/footer.jsp"%>

    <script>
         // 이메일 중복 체크
         $('#memberEmail').on("propertychange change keyup paste input", function() {
            let memberEmail = $('#memberEmail').val();
            let data = {memberEmail : memberEmail}

            $.ajax({
                type : "post",
                url : "/member/memberEmailChk",
                data : data,
                success : function(result){
                    if (result != 'fail'){
                        $('.id_input_check_success').css("display", "inline-block");
                        $('.id_input_check_fail').css("display", "none");
                    } else if (result == 'fail'){
                        $('.id_input_check_fail').css("display", "inline-block");
                        $('.id_input_check_success').css("display", "none");
                    }
                }
            });
        });

        // 카카오 주소 API
        function kakao_address(){
            new daum.Postcode({
                oncomplete: function(data) {
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 주소변수와 참고항목의 문자열을 합친다.
                        addr += extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $('#memberAddr1').val(data.zonecode);
                    $('#memberAddr2').val(addr);
                    // 커서를 상세주소 필드로 이동한다.
                    $('#memberAddr3').attr("readonly", false);
                    $('#memberAddr3').focus();
                }
            }).open();
        }
    </script>
</body>
</html>