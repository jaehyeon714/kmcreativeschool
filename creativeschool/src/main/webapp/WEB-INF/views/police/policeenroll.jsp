<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>    
<!DOCTYPE html>
<html>
<head>
    <title>Police Login Page</title>
	<style>
		#div_box{
			margin-top: 30px;
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
    <div class="d-flex justify-content-center">
    	<img alt="경찰로고" src="${ path }/resources/images/policeLogo.png" style="width: 150px; height: 50px; margin: 20px;">
	 </div>	 
	<div class="d-flex justify-content-center" id="div_box">
	    <form action="login" method="post">
	    	<table></table>
	        <label for="policename">Policename:</label>
	        <input type="text" id="policename" name="policename" required><br>
	
	        <label for="password">Password:</label>
	        <input type="password" id="password" name="password" required><br>
			
			<input type="submit" value="Login">	
	        
	        <a href="${path }/#">아이디/비밀번호찾기</a>
	   
			<a href="${ path }/police/등록하기">
				<button type="button" class="btn btn-primary px-0">경찰등록</button>
			</a>
	    </form>
	    
	   </div>	 
	   
    <!-- 로그인 실패 시 에러 메시지 출력 -->
    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
    
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>