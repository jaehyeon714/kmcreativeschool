<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- main > section > article -->
    <main class="container my-4 d-flex justify-content-around" style="height: 700px;">
    	<a href="${ path }/police/이름" style="margin-top: 200px;">
    		<img alt="신고하기" src="/creativeschool/resources/images/declaration_img.jpg" class="img-fluid">
    		<p class="text-center" style="font-size: 30px;">신고하기</p>
    	</a>
    	<a href="${ path }/chat/livechat" style="margin-top: 200px;">
    		<img alt="실시간채팅" src="/creativeschool/resources/images/live_chat_img.png" class="img-fluid">
    		<p class="text-center" style="font-size: 30px;">실시간 채팅</p>
    	</a>
    </main>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>