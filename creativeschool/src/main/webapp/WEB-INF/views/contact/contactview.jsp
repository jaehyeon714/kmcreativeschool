<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main class="container my-4">
    <h2>${contact.title}</h2>
    <p><strong>문의 내용:</strong></p>
    <p>${contact.contactContent}</p>
    <p><strong>작성 날짜:</strong> ${contact.dateTime}</p>

    <a href="${pageContext.request.contextPath}/contact.do" class="btn btn-secondary">목록으로 돌아가기</a>

</main>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>