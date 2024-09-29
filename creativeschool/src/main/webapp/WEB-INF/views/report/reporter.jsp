<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />    
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.requiredData{
		font-weight:bolder;
		color:red;
	}
</style>
<main class="d-flex flex-column justify-content-center align-items-center">
	<div class="d-flex justify-content-center">
		<h2>신고자정보 등록</h2>
	</div>
	<div style="width:60%">
		<form action="${path }/declaration/reportenroll.km" 
		method="post">
		  <div class="form-group">
		    <label for="reporterName">신고자이름<span class="requiredData"> *</span></label>
		    <input type="text" class="form-control" 
		    id="reporterName" name="reporterName" 
		    placeholder="신고자이름입력" required>
		  </div>
		  <div class="form-group">
		    <label for="reporterEmail">신고자이메일<span class="requiredData"> *</span></label>
		    <input type="email" class="form-control" 
		    id="reporterEmail" name="reporterEmail" 
		    placeholder="신고자이메일(example@email.com)" required>
		  </div>
		  <div class="form-group">
		    <label for="reporterPhone">신고자전화번호</label>
		    <input type="text" class="form-control" 
		    id="reporterPhone" name="reporterPhone"
		    placeholder="전화번호(000-0000-0000)">
		  </div>
		  <div class="form-group">
		    <label for="reporterSchool">신고자학교</label>
		    <input type="text" class="form-control" 
		    id="reporterSchool" name="reporterSchool"
		    placeholder="초,중,고">
		  </div>
		   <div class="form-group">
		    <label for="reporterPassword">비밀번호<span class="requiredData"> *</span></label>
		    <input type="password" class="form-control" 
		    id="reporterPassword" name="reporterPassword"
		    placeholder="비밀번호">
		  </div>
		  <div class="form-group">
		    <label for="reporterPassword2">비밀번호확인</label>
		    <input type="password" class="form-control" 
		    id="reporterPassword2"
		    placeholder="비밀번호확인">
		  </div>
		  <div class="form-group d-flex justify-content-center">
		    <button class="btn btn-outline-success">등록</button>
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    <button class="btn btn-outline-warning">취소</button>
		  </div>
		</form>
	</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
