<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/modern-business.css" rel="stylesheet">

        <!-- Bootstrap core JavaScript -->
        <script src="../js/jquery-3.7.1.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script>
            function login(){
                location.href = "/member/login";
            }

            function join(){
                location.href = "/member/join";
            }
            function admin(){
                location.href = "/admin";
            }
        </script>
    </head>

    <body>
        <header class="p-3 bg-dark text-white">
            <div class="container">
              <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                  <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                  <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
                  <li><a href="#" class="nav-link px-2 text-white">product</a></li>
                  <li><a href="#" class="nav-link px-2 text-white">board</a></li>
                  <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
                  <li><a href="#" class="nav-link px-2 text-white">About</a></li>
                </ul>

                <c:if test="${sessionScope.member == null}">
                    <div class="text-end">
                      <button type="button" class="btn btn-outline-light me-2" onclick = login();>로그인</button>
                      <button type="button" class="btn btn-warning" onclick = join();>회원가입</button>
                    </div>
                </c:if>


                <c:if test="${sessionScope.member != null}">
                    <div class="text-end">
                      <c:if test="${sessionScope.member.adminCk == 1}">
                          <div class="text-end">
                              <input type="button" value="관리자" onclick=admin(); />
                          </div>
                      </c:if>
                      <span>이메일 : ${sessionScope.member.memberEmail} | </span>
                      <span>닉네임 : ${sessionScope.member.memberNickname} | </span>
                      <span>지갑 : ${sessionScope.member.money} | </span>
                      <span>포인트 : ${sessionScope.member.point}</span>
                      <form action="member/logout" method="post">
                        <button type="submit" class="btn btn-warning" >로그아웃</button>
                      </form>
                    </div>
                </c:if>

              </div>
            </div>
        </header>
    </body>
</html>