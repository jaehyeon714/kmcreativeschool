<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container mt-5 mb-5">
        <h2>문의 글 작성</h2>
        <form action="${ path }/contactwriteSubmit" method="post" autocomplete="off">
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="email" class="form-control" id="writer" name="writer" placeholder="작성자" required>
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="제목" required>
            </div>
            <div class="form-group">
                <label for="contactContent">내용</label>
                <textarea class="form-control" id="contactContent" rows="5" name="contactContent" placeholder="문의하고 싶은 내용을 입력하세요." required style="resize: none;"></textarea>
            </div>
            <button type="submit" class="btn btn-outline-primary">문의하기</button>
            <a href="${ path }/contact" class="btn btn-outline-dark">돌아가기</a>
        </form>
    </div>
    
    <script>
	    "use strict";
	
	    // RegExp 객체를 생성
	    const testStr = /^[a-zA-Z0-9._%+-]{1,35}@[a-zA-Z0-9.-]{1,35}\.[a-zA-Z]{2,6}$/;
	    const writer = document.getElementById("writer");
	
	    document.addEventListener("submit", (e) => {
	        if (!testStr.test(writer.value)) {
	            e.preventDefault();
	            alert("유효한 이메일 주소를 입력하세요.");
	        }
	    });
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />