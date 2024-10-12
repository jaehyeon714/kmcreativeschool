<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
    #div_box {
        margin-top: 30px;
        margin-bottom: 20px;
    }
    .input-group {
        width: 350px;
    }
    .btn-custom {
        padding: 10px 0; /* 세로 크기를 줄이기 위한 패딩 설정 */
        width: 100%; /* 버튼의 너비를 100%로 설정 */
    }
</style>
<main class="flex-column justify-content-center" style="padding: 5%">

    <div class="d-flex justify-content-center">
        <h2>신고자 로그인</h2>
    </div>
    <br><br>

    <div class="d-flex justify-content-center" id="div_box">
        <form action="${path}/declaration/userReportLogin.do" method="post"> 
            <div class="d-flex flex-column">
                    <div class="input-group input-group-lg mb-3">
                        <input type="text" id="id" name="id" 
                               class="form-control" placeholder="아이디" 
                               aria-label="Sizing example input" 
                               aria-describedby="inputGroup-sizing-lg" 
                               required>
                    </div>
                    <div class="input-group input-group-lg mb-3">
                        <input type="password" id="pw" name="pw" 
                               class="form-control" placeholder="비밀번호" 
                               aria-label="Sizing example input" 
                               aria-describedby="inputGroup-sizing-lg" 
                               required>
                    </div>
                    <input type="submit" class="input-group btn btn-outline-primary btn-custom mb-1" value="로그인">    
        	</div>
        </form>
    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
