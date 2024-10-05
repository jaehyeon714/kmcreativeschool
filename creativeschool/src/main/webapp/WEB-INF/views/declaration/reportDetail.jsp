<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<main class="container my-4" style="height: 500px;overflow:auto">
	<div style="display:flex;justify-content:end">
		<h5><span class="badge text-bg-secondary">${report.status==null?"대기":report.status}</span></h5>
	</div>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<ul class="nav">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="#">사건정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">가해자</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">신고자</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">첨부파일</a>
		  </li>
		</ul>
	</nav>
	<div class="card">
		<div class="card-body">
			<h5>신고내용</h5>
			<p>종류 : ${report.reportType }</p>
			<p>발생위치 : ${report.incidentAddress }</p>
			<p>발생시간 : ${fn:replace(report.incidentTime,"T"," ")}</p>
			<p>내용</p>
			<p style="padding-left:2%">${report.incidentDetails }</p>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5>가해자 정보</h5>
			<c:forEach var="attacker" items="${report.attackers  }">
				<p>이름 : ${attacker.attackerName }</p>
				<p>학교명 : ${attacker.attackerSchool }</p>
				<p>성별 : ${attacker.attackerGender }</p>
				<p>연락처 : ${attacker.attackerContact }</p>
				<p>주소 : ${attacker.attackerAddress }</p>
			</c:forEach>	
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5>신고자 정보</h5>
			
		</div>
		${report.reporter }
	</div>
	<div style="margin-top:3%;display:flex;flex-direction:column;
	justify-content:center; align-items:center">
		<div>
			<h4>사건사진</h4>
		</div>
		<div id="carouselImg" class="carousel slide" style="width:60%;">
		  <div class="carousel-inner">
		  	<c:if test="${report.files.get(0).declarationAttachmentNo==0 }">
			    <div class="carousel-item active">
			      <img src="${path }/resources/images/defaultimg.jpg" 
			      class="d-block w-100" alt="경찰이미지">
			    </div>
		    </c:if>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselImg" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselImg" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	<div style="margin:5%;display:flex;justify-content:center">
		<button class="btn btn-primary">접수</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-info">처리완료</button>
	</div>
</main>
	<script>

	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>