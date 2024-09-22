<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- main > section > article -->    
    <main class="container my-5" style="height: 600px;">
        <h2>채팅 리스트</h2>
        <ol class="list-group">
            <li class="list-group-item">
            	<a href="${ path }/chat/livechatlist/livechat.km"
            		class="stretched-link">경찰관 1</a>
            </li>
            <li class="list-group-item">
            	<a href="${ path }/chat/livechatlist/livechat.km"
            		class="stretched-link">경찰관 2</a>
            </li>
            <li class="list-group-item">
            	<a href="${ path }/chat/livechatlist/livechat.km"
            		class="stretched-link">경찰관 3</a>
            </li>
            <li class="list-group-item">
            	<a href="${ path }/chat/livechatlist/livechat.km"
            		class="stretched-link">경찰관 4</a>
            </li>
		</ol>
    </main>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>