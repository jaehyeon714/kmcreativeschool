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
			<tr>
				<td>1</td>
				<td><a href="${ path }/contact/contactview.do">~~~를 신고합니다.</a></td>
				<td><a href="${ path }/contact/contactview.do">내 친구를 때림</a></td>
				<td>2024년 9월 30일</td>
				<td>답변안함</td>
			</tr>
			<tr>
				<td>2</td>

				<td><a href="${ path }/contact/contactview.do">OO고 ~~가 학교에서 담배핌</a></td>
				<td><a href="${ path }/contact/contactview.do">OO이 담배핌</a></td>
				<td>2024년 9월 29일</td>
				<td>답변함</td>
			</tr>
		</table>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
