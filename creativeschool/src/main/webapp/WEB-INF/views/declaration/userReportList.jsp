<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.km.common.CommonUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
td {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.green {
	color: green;
}

.blue {
	color: blue;
}

.yellow {
	color: orange;
}

.count-box {
	display: inline-block;
	padding: 8px 12px;
	border: 1px solid #ccc;
	border-radius: 12px;
	background-color: #f8f9fa;
	margin-right: 8px;
}

.search-box {
	margin-left: 20px;
}

.search-box input, .search-box select {
	margin-right: 8px;
}
</style>

<h2 class="text-center mt-4">${sessionScope.reporterId}님의 신고 내역</h2>

<div class="container mt-4 mb-4">
	<section>
		<div class="d-flex align-items-center mb-3">
			<div class="me-auto">
				<div class="count-box me-2">
					완료 <span>${completedReportCnt}건</span>
				</div>
				<div class="count-box me-2">
					접수 <span>${submittedReportCnt}건</span>
				</div>
				<div class="count-box me-2">
					미접수 <span>${notSubmittedReportCnt}건</span>
				</div>
			</div>

			<form class="d-flex align-items-center ml-auto" method="get"
				action="${path }/declaration/userReportList.do">
				<div class="input-group search-box">
					<select class="form-select" name="condition">
						<option selected>검색 카테고리</option>
						<option value="내용">내용</option>
						<option value="종류">종류</option>
						<option value="상태">처리 상태</option>
						<option value="경찰관">담당 경찰관</option>
					</select> <input type="text" class="form-control" placeholder="검색어 입력"
						name="keyword">
				</div>
				<button type="submit" class="btn btn-success"
					style="margin: 5px; white-space: nowrap;">검색</button>
			</form>
		</div>
	</section>
	<c:if test="${not empty condition and not empty keyword}">
		<div
			class="alert alert-info d-flex justify-content-between align-items-center"
			style="padding: 20px; height: 60px;">
			검색 조건: &nbsp;<strong> ${condition} </strong>&nbsp; | 검색어: &nbsp;<strong>
				${keyword} </strong>
			<button type="button" class="btn btn-danger"
				style="margin-left: auto; white-space: nowrap;"
				onclick="location.href='${path}/declaration/userReportList.do'">초기화</button>
		</div>


	</c:if>
	<table class="table table-hover mt-4">
		<thead>
			<tr>
				<th>번호</th>
				<th>접수일</th>
				<th>내용</th>
				<th>신고 종류</th>
				<th>처리 상태</th>
				<th>담당 경찰관</th>
				<th>경찰서 주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="report" items="${reports}">
				<tr>
					<td>${report.DECLARATION_NO}</td>
					<td>${report.DECLARATION_DATE}</td>
					<td>${CommonUtils.clobToString(report.DECLARATION_CONTENT)}</td>
					<td>${report.DECLARATION_CATEGORY}</td>
					<td><c:choose>
							<c:when test="${report.DECLARATION_STATUS == '완료'}">
								<a class="btn btn-success btn-sm">완료</a>
							</c:when>
							<c:when test="${report.DECLARATION_STATUS == '접수'}">
								<a class="btn btn-primary btn-sm">접수</a>
							</c:when>
							<c:when
								test="${report.DECLARATION_STATUS == '미접수' || report.DECLARATION_STATUS == null}">
								<a class="btn btn-warning btn-sm">미접수</a>
							</c:when>
							<c:otherwise>
								<span>${report.DECLARATION_STATUS}</span>
							</c:otherwise>
						</c:choose></td>
					<td>${report.POLICE_NAME}</td>
					<td>${report.DECLARATION_DETAIL}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="text-center">
		<c:if test="${not empty pageBar}">
            ${pageBar}
        </c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
