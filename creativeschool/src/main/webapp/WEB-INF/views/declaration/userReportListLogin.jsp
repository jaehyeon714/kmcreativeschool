<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<main class="flex-column justify-content-center" style="padding: 5%">

    <div class="d-flex justify-content-center">
        <h2>신고자 로그인</h2>
    </div>
    <br><br>

    <div class="d-flex justify-content-center" id="div_box">
        <form action="${path}/declaration/userReportLogin.do" method="post"> 
            <div class="d-flex justify-content-evenly">
                <div style="margin-right: 3%">
                    <div class="input-group input-group-lg">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> 아이디 </span>
                        </div>
                        <input type="text" id="id" name="userIdentity"
                            class="form-control" aria-label="Sizing example input"
                            aria-describedby="inputGroup-sizing-lg" required>
                    </div>
                    <div class="input-group input-group-lg">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> 패스워드 </span>
                        </div>
                        <input type="password" id="pw" name="userPassword"
                            class="form-control" aria-label="Sizing example input"
                            aria-describedby="inputGroup-sizing-lg" required>
                    </div>
                </div>
                <input type="submit" class="btn btn-outline-success"
                    style="width: 18%" value="로그인">
            </div>
        </form>
    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
