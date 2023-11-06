<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Mall</title>
    <style>
         html,
         body {
           height: 100%;
         }

         .form-signin {
           width: 100%;
           max-width: 330px;
           padding: 15px;
           margin: auto;
         }

         .form-signin .checkbox {
           font-weight: 400;
         }

         .form-signin .form-floating:focus-within {
           z-index: 2;
         }

         .form-signin input[type="email"] {
           margin-bottom: -1px;
           border-bottom-right-radius: 0;
           border-bottom-left-radius: 0;
         }

         .form-signin input[type="password"] {
           margin-bottom: 10px;
           border-top-left-radius: 0;
           border-top-right-radius: 0;
         }

         .id_input_check_success{
            color : green;
            display : none;
         }

         .id_input_check_fail{
            color : red;
            display : none;
         }
    </style>
</head>
<body>
    <body class="text-center">

     <main class="form-signin">

        <form:form modelAttribute="memberRequest" action="join" method="post">
          <h1 class="h3 mb-3 fw-normal">회원가입</h1>

          <span class="id_input_check_success">사용 가능한 이메일입니다.</span>
          <span class="id_input_check_fail">이미 존재하는 이메일입니다.</span>

          <div class="form-floating">
              <form:input path="memberEmail" class="form-control" />
              <label for="floatingInput">Email</label>
          </div>

          <div class="form-floating">
            <form:input path="memberPw" class="form-control" />
            <label for="floatingPassword">password</label>
          </div>

          <div class="form-floating">
            <form:input path="memberNickname" class="form-control" />
            <label for="floatingUsername">nickname</label>
          </div>

          <div class="form-floating">
            <form:input path="memberAddr1" class="form-control" />
            <label for="floatingUsername">memberAddr1</label>
          </div>

          <div class="form-floating">
            <form:input path="memberAddr2" class="form-control" />
            <label for="floatingUsername">memberAddr2</label>
          </div>

          <div class="form-floating">
            <form:input path="memberAddr3" class="form-control" />
            <label for="floatingUsername">memberAddr3</label>
          </div>

          <br>
          <button class="w-100 btn btn-lg btn-primary" type="submit">회원 가입</button>
        </form:form>
      </main>
    <%@ include file="include/footer.jsp"%>

    <script>
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
    </script>
</body>
</html>