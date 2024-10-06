<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<main class="container my-4">
	<h4>사건신고현황</h4>
	<c:if test="${not empty reports }">
		<table class="table table-striped table-hover">
			<tr>
				<th>사건번호</th>
				<th>분류</th>
				<th>발생장소</th>
				<th>발생시간</th>
				<th>가해인원</th>
				<th>신고자이름</th>
				<th>등록일</th>
				<th>첨부파일</th>
			</tr>
		<c:forEach var="report" items="${reports }">
			<tr style="cursor:pointer;" onclick="requestDetail(${report['DECLARATION_NO']})">
				<td>${report['DECLARATION_NO'] }</td>
				<td>${report['DECLARATION_CATEGORY'] }</td>
				<td>${report['DECLARATION_DETAIL'] }</td>
				<td>${report['DECLARATION_DATE']}</td>
				<td>${report['ATTACKER_COUNT']}</td>
				<td>${report['REPORTER_NAME'] }</td>
				<td><fmt:formatDate value="${report['DECLARATION_INSERTDATE'] }"/></td>
				<td>${report['ATTACH_COUNT']>0?'있음':'없음'}</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty reports }">
		<h3>접수된 사건이 없습니다.</h3>
	</c:if>
	<div id="pageBar">
		${pageBar }
	</div>
</main>
	<script>
	 function requestDetail(no){
		 location.assign("${path}/declaration/searchDeclarationdetail?no="+no);
	 }
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>