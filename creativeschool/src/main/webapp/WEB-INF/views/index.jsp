<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- main > section > article -->
    <main class="container my-4 d-flex justify-content-around aling-items-center" style="height: 500px;">
    	<a href="${ path }/declaration/requestdeclaration.km">
    		<img alt="신고하기" src="/creativeschool/resources/images/declaration_img.jpg" class="img-fluid">
    		<p class="text-center" style="font-size: 30px;">신고하기</p>
    	</a>
    	<a href="${ path }/chat/livechatlist.km">
    		<img alt="실시간채팅" src="/creativeschool/resources/images/live_chat_img.png" class="img-fluid">
    		<p class="text-center" style="font-size: 30px;">실시간 채팅</p>
    	</a>
    </main>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
