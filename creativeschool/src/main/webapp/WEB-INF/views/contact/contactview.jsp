<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<main class="container my-4">
	    <div class="card">
	        <div class="card-header">
	            <h2>${contact.title}</h2>
	            <p class="text-muted"><strong>작성 시간:</strong> ${contact.dateTime}</p>
	        </div>
	        <div class="card-body">
	            <p class="font-weight-bold">문의 내용</p>
	            <p>${contact.contactContent}</p>
	        </div>
	        <div class="card-footer text-right">
	            <a href="${path}/contact" class="btn btn-secondary">목록으로 돌아가기</a>
	        </div>
	    </div>
	</main>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>