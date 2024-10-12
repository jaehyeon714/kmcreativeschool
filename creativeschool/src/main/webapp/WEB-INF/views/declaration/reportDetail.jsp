<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	div[id*='info']:not(div[id^='declaration']){
		display:none;
	}
	div[id*='info']:first-of-type{
		display:block;
	}
	div[id*='info']{
		height:380px;
		overflow:auto;
	}
</style>
<main class="container my-4" style="height: 500px;">
	<div style="display:flex;justify-content:space-between;align-items:center;" >
		<div>
			<h3>
				<c:choose>
					<c:when test="${report.status==null}"><span class="badge badge-secondary">대기</span></c:when>
					<c:when test="${report.status=='접수'}"><span class="badge badge-success">${report.status }</span></c:when>
					<c:when test="${report.status=='처리완료'}"><span class="badge badge-black">${report.status }</span></c:when>
				</c:choose>
			</h3>			
		</div>
		<ul id="tabMenu" class="nav nav-pills justify-content-end">
		  <li class="nav-item ">
		    <a class="nav-link active" href="javascript:void(0)" onclick="movePage('declaration',event)">사건정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="javascript:void(0)" onclick="movePage('attacker',event)">가해자</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="javascript:void(0)" onclick="movePage('reporter',event)">신고자</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="javascript:void(0)" onclick="movePage('attach',event)">첨부파일</a>
		  </li>
		</ul>
	</div>
	<div id="declaration-info" class="card">
		<div class="card-body">
			<h5>신고내용</h5>
			<p>종류 : ${report.reportType }</p>
			<p>발생위치 : ${report.incidentAddress }</p>
			<p>발생시간 : ${fn:replace(report.incidentTime,"T"," ")}</p>
			<p>내용</p>
			<p style="padding-left:2%">${report.incidentDetails }</p>
		</div>
	</div>
	<div id="attacker-info" class="card">
		<div class="card-body d-flex flex-md-wrap flex-sm-wrap" >
			<c:forEach var="attacker" items="${report.attackers  }" varStatus="status">
				<div>
					<h5>가해자 정보 ${status.count}</h5>
					<p>이름 : ${attacker.attackerName }</p>
					<p>학교명 : ${attacker.attackerSchool }</p>
					<p>성별 : ${attacker.attackerGender }</p>
					<p>연락처 : ${attacker.attackerContact }</p>
					<p>주소 : ${attacker.attackerAddress }</p>
				</div>
			</c:forEach>	
		</div>
	</div>
	<div id="reporter-info" class="card">
		<div class="card-body">
			<h5>신고자 정보</h5>
			<p>이름 : ${report.reporter.reporterName}</p>
			<p>연락처 : ${report.reporter.reporterPhone}</p>
			<p>이메일 : ${report.reporter.reporterEmail}</p>
			<p>학교 : ${report.reporter.reporterSchool}</p>
			
		</div>
	</div>
	<div id="attach-info" class="card">
		<div class="card-body">
			<c:if test="${report.files.get(0).declarationAttachmentNo==0}">
				<h3>첨부파일이 없습니다.</h3>
			</c:if>
			<ul class="list-group">
			<c:forEach var="file" items="${report.files }">
				<c:if test="${file.declarationAttachmentNo!=0 }">
					<li class="list-group-item">${file.declarationAttachmentOriginalName }</li>
				</c:if>
			</c:forEach>
			</ul>
		</div>
	<%-- <div id="carouselImg" class="carousel slide" style="width:60%;">
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
	</div> --%>
	</div>
	<div style="margin:5%;display:flex;justify-content:center">
		<button class="btn btn-${report.status=='접수'?'dark':'primary'}" 
		onclick="location.assign('${path}/declaration/updatestatus.do?reportNo=${report.reportNo}&status=1')"
		${report.status=='접수'?'disabled':''}>접수</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-${report.status==null?'dark':'info'}" ${report.status==null?'disabled':'' } 
			onclick="location.assign('${path}/declaration/updatestatus.do?reportNo=${report.reportNo}&status=2')">처리완료</button>
	</div>
</main>
	<script>
		const movePage=(title,e)=>{
			console.log(e);
			$("div[id*=info]").css({"display":"none"});
			$("#tabMenu a").removeClass("active");
			$(`#\${title}-info`).css({'display':'flex',"backgroundColor":"ligthgray"});
			$(e.target).addClass("active");
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>