<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
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
	        <h3 class="mb-0 ml-2">당신의 용기 있는 신고가 안전한 학교를 만드는 첫걸음입니다.</h3>
	    </div>
	  	<nav class="navbar navbar-expand-lg navbar-light bg-white">
  			<div class="container-fluid">
   				<div class="collapse navbar-collapse" id="navbarNav">
      				<ul class="navbar-nav">
        				<li class="nav-item">
          					<a class="nav-link" href="#">신고하기</a>
        				</li>
        				<li class="nav-item">
          					<a class="nav-link" href="#">실시간 채팅</a>
        				</li>
      				</ul>
    			</div>
  			</div>
		</nav>
	    <div>
	        <a href="${ path }/police/policeenroll.do">
	            <button type="button" class="btn btn-primary px-4">경찰관</button>
	        </a>
	    	<a href="${ path }/contact">
	    		<button type="button" class="btn btn-primary px-4">문의하기</button>
	    	</a>
	    </div>
	</header>