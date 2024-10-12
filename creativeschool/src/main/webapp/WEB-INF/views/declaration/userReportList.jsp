<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.km.common.CommonUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
	td {
	    overflow: hidden; 
	    text-overflow: ellipsis;
	    white-space: nowrap; 
	}
</style>

<h2 class="text-center mt-4">${sessionScope.reporterId }님의 신고 내역</h2>

<div class="container mt-4 mb-4">
	<table class="table table-hover">
		<tr>
			<td>번호</td>
			<td>접수일</td>
			<td>내용</td>
			<td>신고 종류</td>
			<td>처리 상태</td>
			<td>담당 경찰관</td>
			<td>경찰서 주소</td>
		</tr>
	<c:forEach var="report" items="${reports}">
        <tr>
            <td>${report.DECLARATION_NO}</td>
            <td>${report.DECLARATION_DATE}</td>
            <td>${CommonUtils.clobToString(report.DECLARATION_CONTENT)}</td>
            <td>${report.DECLARATION_CATEGORY}</td>
            <td>${report.DECLARATION_STATUS != null ? report.DECLARATION_STATUS : '알 수 없음'}</td>
            <td>${report.POLICE_NAME}</td>
            <td>${report.DECLARATION_DETAIL}</td>
        </tr>
    </c:forEach>

	</table>
	<div class="text-center">
		<c:if test="${ not empty pageBar }">
	            ${ pageBar }
	        </c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
