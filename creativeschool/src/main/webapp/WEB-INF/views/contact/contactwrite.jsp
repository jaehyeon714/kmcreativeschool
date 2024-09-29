<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container mt-5 mb-5">
        <h2>문의 글 작성</h2>
        <form action="/contactwrite.form" method="post" autocomplete="off">
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="subject" placeholder="제목을 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="message">내용</label>
                <textarea class="form-control" id="message" rows="5" placeholder="내용을 입력하세요" required style="resize: none;"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">제출</button>
        </form>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />