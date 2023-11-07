<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Mall</title>
    <link rel="stylesheet" href="../css/login.css" />
</head>
<body>
    <body class="text-center">

    <main class="form-signin">
      <form:form modelAttribute="loginRequest" action="login" method="post">
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <form:errors />

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

        <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
      </form:form>
    </main>
    <%@ include file="include/footer.jsp"%>
    </body>
</html>