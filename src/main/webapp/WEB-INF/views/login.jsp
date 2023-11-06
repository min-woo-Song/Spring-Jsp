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
     </style>
</head>
<body>
    <body class="text-center">

    <main class="form-signin">
      <form:form modelAttribute="loginRequest" method="post">
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <form:input path="memberEmail" class="form-control" />
            <label for="floatingInput">Email</label>
        </div>

        <div class="form-floating">
            <form:input path="memberPw" class="form-control" />
            <label for="floatingPassword">password</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
      </form:form>
    </main>
    <%@ include file="include/footer.jsp"%>
    </body>
</html>