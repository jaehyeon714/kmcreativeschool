<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>    
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
<main class="flex-column justify-content-center" style="padding:5%">

    <c:if test="${loginPolice == null }">
        <div class="d-flex justify-content-center">
            <img alt="경찰로고" 
                 src="${path }/resources/images/policeLogo.png" 
                 style="width: 160px; height: 120px;">
        </div>    
        <div class="container d-flex justify-content-center" id="div_box">
            <form action="${path }/policeLogin.do" method="post">
                <div class="d-flex flex-column">
                    <div class="input-group input-group-lg mb-3">
                        <input type="text" id="policeIdentity" name="policeIdentity" 
                               class="form-control" placeholder="아이디" 
                               aria-label="Sizing example input" 
                               aria-describedby="inputGroup-sizing-lg" 
                               required>
                    </div>
                    <div class="input-group input-group-lg mb-3">
                        <input type="password" id="policePassword" name="policePassword" 
                               class="form-control" placeholder="비밀번호" 
                               aria-label="Sizing example input" 
                               aria-describedby="inputGroup-sizing-lg" 
                               required>
                    </div>
                    <input type="submit" class="input-group btn btn-outline-primary btn-custom mb-1" value="로그인">    
                <hr class="w-100 border-bottom">
                </div>
            </form>
        </div>
       
        <div class="d-flex justify-content-center" style="margin-top: -25px;" id="div_box">
            <div style="margin-right:3%" class="d-flex justify-content-center align-items-center">
                <a href="javascript:searchIdPassword();" id="d">아이디/비밀번호찾기</a>
            </div>
            <div class="d-flex justify-content-center align-items-center">
                <a href="${path}/police/policeinsert.km">경찰등록</a>
            </div>
        </div>
        
    </c:if>
    <!-- 로그인 실패 시 에러 메시지 출력 -->
    <c:if test="${not empty error}">
    </c:if>
    <c:if test="${loginPolice != null }">
        <div class="d-flex justify-content-center">
            <img alt="경찰로고" 
                 src="${ path }/resources/images/defaultimg.png" 
                 style="width: 130px; height: 100px; 
                 border-radius:100px">
        </div>    
        <h2 style="text-align: center; margin-top:5%">${loginPolice.policeName} 경찰관님 환영합니다.</h2>
    </c:if>
</main>
<script>
 function searchIdPassword() {
     open("${path}/police/findIdPw.do","_blank","width=500,height=330,top=250%,left=700%");
 }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
