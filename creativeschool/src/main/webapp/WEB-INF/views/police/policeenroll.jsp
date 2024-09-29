<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>    
	<style>
		#div_box{
			margin-top: 30px;
			margin-bottom: 20px;
		}
	</style>
<main class="flex-column justify-content-center" style="padding:5%">

	<c:if test="${loginPolice == null }">
	    <div class="d-flex justify-content-center">
	    	<img alt="경찰로고" 
	    	src="${ path }/resources/images/policeLogo.png" 
	    	style="width: 130px; height: 100px; 
	    	border-radius:100px">
		 </div>	
		<div class="d-flex justify-content-center" id="div_box">
			<form action="${path }/policeLogin.do" method="post">
			    <div class="d-flex justify-content-evenly">
				    <div style="margin-right:3%">
					    <div class="input-group input-group-lg">
					    	<div class="input-group-prepend">
					    		<span class="input-group-text">
					    		아이디
					    		</span>
					    	</div>
					        <input type="text" id="policeIdentity" name="policeIdentity" 
					        class="form-control" aria-label="Sizing example input" 
					        aria-describedby="inputGroup-sizing-lg" 
					        required>
					    </div>
					    <div class="input-group input-group-lg">
					    	<div class="input-group-prepend">
					    		<span class="input-group-text">
					    		패스워드
					    		</span>
					    	</div>
					        <input type="password" id=policePassword name="policePassword" 
					        class="form-control" aria-label="Sizing example input" 
					        aria-describedby="inputGroup-sizing-lg" 
					        required>
					    </div>
				    </div>
						<input type="submit" class="btn btn-outline-success" style="width:18%" value="로그인">	
				  </div>
		    </form>
	   </div>
	   
	   <div class="d-flex justify-content-center" id="div_box">
	   		<div style="margin-right:3%"class="d-flex justify-content-center align-items-center">
				<a href="${path }/#">아이디/비밀번호찾기</a>
			</div>
			<div class="d-flex justify-content-center align-items-center">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='${path}/police/policeinsert.km'">경찰등록</button>
			</div>
		</div>
	</c:if>
    <!-- 로그인 실패 시 에러 메시지 출력 -->
    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
   <c:if test="${loginPolice != null }">
       <div class="d-flex justify-content-center">
    	<img alt="경찰로고" 
    	src="${ path }/resources/images/policeLogo.png" 
    	style="width: 130px; height: 100px; 
    	border-radius:100px">
	 </div>	
	 <h2 style="text-align: center; margin-top:5%">${loginPolice.policeName} 경찰관님 환영합니다.</h2>
   	</c:if>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>