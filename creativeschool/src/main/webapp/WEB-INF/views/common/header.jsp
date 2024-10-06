<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
	.custom-button {
    margin-right: 150px;
    margin-left: -50px;
	}
	</style>
	<meta charset="UTF-8">
	<title>신고 사이트</title>
	<!-- 공식 문서 - https://getbootstrap.kr/docs/5.3/getting-started/introduction -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	
	<!-- 커스텀 css -->
	<link rel="stylesheet" href="${ path }/resources/css/basic.css">
	<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
	<header class="d-flex justify-content-between align-items-center p-3 bg-white border-bottom">
	    <div class="d-flex align-items-center">
	        <a href="${ path }/">
	            <img alt="로고" src="${ path }/resources/images/km_logo.png" class="mr-2" style="max-height: 50px;">
	        </a>
	        <h3 class="mb-0 ml-2"><strong>폭력은 끝내야 할 행동입니다.</strong></h3>
	    </div>
	    <c:if test="${loginPolice==null }">
		  	<nav class="navbar navbar-expand-lg navbar-light bg-white">
	  			<div class="container-fluid">
	   				<div class="collapse navbar-collapse" id="navbarNav">
	          			<a class="nav-link" href="${path}/declaration/requestdeclaration.km">
    						<button type="button" class="btn btn-outline-danger custom-button">신고하기</button>
						</a>
						<a class="nav-link" href="${path}/chat/livechatlist.km">
    						<button type="button" class="btn btn-outline-primary custom-button">실시간채팅</button>
						</a>
	    			</div>
	  			</div>
			</nav>
		</c:if>
	    <div>
	    	<c:if test="${loginPolice==null}">
		        <a href="${ path }/police/policeenroll.do">
		            <button type="button" class="btn btn-primary px-4">경찰관</button>
		        </a>
		    	<a href="${ path }/contact">
		    		<button type="button" class="btn btn-primary px-4">문의하기</button>
		    	</a>
	    	</c:if>
	    	<c:if test="${loginPolice!=null }">
	    		<span style="font-size:18px;font-weight:bolder;">${loginPolice.policeName } ${loginPolice.policeGrade }</span>
	    		<a href="${ path }/police/logout.do">
		            <button type="button" class="btn btn-primary px-4">로그아웃</button>
		        </a>
	    		<a href="${ path }/declaration/searchDeclaration.do">
		            <button type="button" class="btn btn-primary px-4">접수사건</button>
		        </a>
		        
	    	</c:if>
	    </div>
	</header>
	<script src="${path }/resources/js/chatting-controller.js"></script>
	<script>
		
		openSocket(`\${location.host}`,'${path}')
		if(${loginPolice!=null}){
			sender='${loginPolice.policeIdentity}';
		};
		
		
	</script>