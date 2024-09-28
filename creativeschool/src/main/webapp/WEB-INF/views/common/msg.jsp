<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main class="container my-4 d-flex justify-content-around aling-items-center" style="height: 500px;">
	<div class="alert alert-${status }" role="alert">
 		${msg }
 		<br>
 		<span>3초 후에 메인화면으로 이동합니다.</span>
	</div>
</main>
<script>
	setTimeout(()=>{
		location.replace("${path}");
	},3000)
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>