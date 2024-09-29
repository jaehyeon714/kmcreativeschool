<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>    


<main class="d-flex flex-column justify-content-center align-items-center">
	<div class="d-flex justify-content-center">
		<h2 style="margin-top:10%">경찰관 등록</h2>
	</div>
	<div style="width:25%">
		<form action="${path }/#" method="post">
 			<div class="input-group input-group-lg">
		    	<div class="input-group-prepend">
		    		<span class="input-group-text">
		    		이름
		    		</span>
		    	</div>
		        <input type="text" id="policeName" name="policeName" 
		        class="form-control" aria-label="Sizing example input" 
		        aria-describedby="inputGroup-sizing-lg" 
		        required>
		    </div> 			
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
		    		이메일
		    		</span>
		    	</div>
		        <input type="text" id="policeMail" name="policeMail" 
		        class="form-control" aria-label="Sizing example input" 
		        aria-describedby="inputGroup-sizing-lg" 
		        required>
		    </div>
		    <div class="input-group input-group-lg">
		    	<div class="input-group-prepend">
		    		<span class="input-group-text">
		    		전화번호
		    		</span>
		    	</div>
		        <input type="text" id="policePhone" name="policePhone" 
		        class="form-control" aria-label="Sizing example input" 
		        aria-describedby="inputGroup-sizing-lg" 
		        required>
		    </div>
		    <div class="input-group input-group-lg">
		    	<div class="input-group-prepend">
		    		<span class="input-group-text">
		    		관활서
		    		</span>
		    	</div>
		        <input type="text" id="policestation" name="policeStation" 
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
		        <input type="password" id="policePassword" name="policePassword" 
		        class="form-control" aria-label="Sizing example input" 
		        aria-describedby="inputGroup-sizing-lg" 
		        required>
		    </div>
		    
		  <div class="form-group d-flex justify-content-center" style="margin-top:5%">
		    <button class="btn btn-outline-success">등록</button>
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    <button class="btn btn-outline-danger">취소</button>
		  </div>
		</form>
	</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>