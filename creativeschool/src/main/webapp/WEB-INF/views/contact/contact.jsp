<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<h2 class="text-center mt-4">문의하기</h2>

	<div class="container mt-4 mb-4">
		<div class="text-right mb-3">
			<a href="${ path }/contactwrite.do">
				<button type="button" class="btn btn-light border">문의 글 작성하기</button>
			</a>
		</div>
		<table class="table table-hover">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성일</td>
				<td>답변</td>
			</tr>
			<c:forEach var="contacts" items="${ contacts }">
				<tr>
					<td>${ contacts.qnaTitle }</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
