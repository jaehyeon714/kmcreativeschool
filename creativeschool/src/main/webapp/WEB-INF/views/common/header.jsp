<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
		a > button {
			margin-right: 20px; /* 버튼 사이의 여백 조정 */
		}
		.button-container {
			margin-left: 50px; /* 왼쪽으로 이동 */
		}
	</style>
	<meta charset="UTF-8">
	<title>신고 사이트</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ path }/resources/css/basic.css">
	<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
	<header class="d-flex justify-content-between align-items-center p-3 bg-white border-bottom">
		<!-- 왼쪽 부분: 로고 및 제목 -->
	    <div class="d-flex align-items-center">
	        <a href="${ path }/">
	            <img alt="로고" src="${ path }/resources/images/logo.png" class="mr-2" style="max-height: 50px;">
	        </a>
	        <h3 class="mb-0 ml-2"><strong>당신의 이야기를 들어줄 준비가 되어 있습니다.</strong></h3>
	    </div>
	    
	     <!-- 중간 부분: 메뉴 -->
	    <c:if test="${loginPolice==null }">
		  	<nav class="navbar navbar-expand-lg navbar-light bg-white w-50"> <!-- 전체 너비 설정 -->
	  			<div class="container-fluid">
	   				<div class="collapse navbar-collapse" id="navbarNav">
						<div class="d-flex justify-content-center w-150 button-container"> <!-- 버튼을 왼쪽으로 이동 -->
	          				<a href="${path}/declaration/requestdeclaration.km">
    							<button type="button" class="btn btn-outline-danger">신고하기</button>
							</a>
							<a href="${path}/chat/livechatlist.km">
    							<button type="button" class="btn btn-outline-primary">실시간채팅</button>
							</a>
		    				<a href="${path}/contact">
		    					<button type="button" class="btn btn-outline-danger">문의하기</button>
		    				</a>
		    				<a href="${path}/declaration/userReportLogin.km">
		    					<button type="button" class="btn btn-outline-primary">나의 신고내역</button>
		    				</a>
						</div>
	    			</div>
	    			</div>
			</nav>
		</c:if>
		
		<!-- 오른쪽 부분: 로그인 상태에 따른 내용 -->
		<div class="d-flex align-items-center">
            <c:if test="${loginPolice==null }">
                <a href="${path}/police/policeenroll.do">
                    <button type="button" class="btn btn-primary">경찰관</button>
                </a>
            </c:if>
            <c:if test="${loginPolice!=null }">
                <span style="font-size:18px;font-weight:bolder;">${loginPolice.policeName} ${loginPolice.policeGrade}</span>
                <span class="ml-3">
                    <a href="${ path }/declaration/searchDeclaration.do">
                        <button type="button" class="btn btn-primary">접수사건</button>
                    </a>
                </span>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
                	경찰 삭제
				</button>

				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  	<div class="modal-dialog modal-dialog-centered" role="document">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<h5 class="modal-title" id="exampleModalLongTitle">${ loginPolice.policeName } <span>${ loginPolice.policeGrade }님</span></h5>
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          		<span aria-hidden="true">&times;</span>
					        	</button>
					      	</div>
					      	<div class="modal-body">
					      		<h5>삭제하시겠습니까?</h5>
					      		<form action="${ path }/deletePolice.do" method="post" autocomplete="off" class="d-flex justify-content-between">
					      			<input type="text" id="policeIdentity" name="policeIdentity" value="${ loginPolice.policeIdentity }" readonly="readonly" class="border-0">
					      			<button type="submit" class="btn btn-outline-danger px-4">삭제</button>
					      		</form>
					      	</div>
				    	</div>
				  	</div>
				</div>
				
                <a href="${ path }/police/logout.do">
                    <button type="button" class="btn btn-primary mx-3">로그아웃</button>
                </a>
            </c:if>	
        </div>
	</header>
	<script src="${path }/resources/js/chatting-controller.js"></script>
	<script>
		if(${loginPolice!=null}){
			sender='${loginPolice.policeIdentity}';
		}else if(${sessionScope.clientEmail!=null}){
			sender='${sessionScope.clientEmail}';
		};
		openSocket(`\${location.host}`,'${path}')
	</script>
	
</body>
</html>
