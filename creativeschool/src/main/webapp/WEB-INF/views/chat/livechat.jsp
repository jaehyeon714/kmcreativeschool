<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<main class="container my-4">
		<h2>실시간 채팅방</h2>
		<a href="${ path }/chat/livechatlist.km">돌아가기</a>
        <div class="border rounded p-3 mb-3" style="height: 400px; overflow-y: auto;">
            <div class="message my-2">
                <div class="alert alert-secondary" role="alert">안녕하세요! 어떻게 도와드릴까요?</div>
            </div>
            <div class="message my-2">
                <div class="alert alert-primary" role="alert">안녕하세요! 질문이 있습니다.</div>
            </div>
        </div>
        <form>
            <div class="input-group">
                <input type="text" class="form-control" placeholder="메시지를 입력하세요..." aria-label="메시지를 입력하세요..." required>
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">전송</button>
                </div>
            </div>
			<input type="file" value="사진 보내기">
        </form>
	</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>