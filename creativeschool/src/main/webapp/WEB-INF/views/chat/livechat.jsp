<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<style>
		.content{
			max-width:50%;
			word-break:break-all;
		}
		#chattingData{
			overflow:auto;
		}
	</style>
	<main class="container my-4">
		<div class="d-flex justify-content-start align-items-center">
			<c:choose>
			<c:when test="${policeObj!=null}">
				<div>
					<c:if test="${policeObj.policeProfile==null }">
		            	<img class="profileImg" src="${path}/resources/images/basicprofile.png" width="50"/>
		           	</c:if>
		           	<c:if test="${policeObj.policeProfile!=null }">
		            	<img src="${path}/resources/upload/profile/${policeObj.policeProfile}"
		            	width="50"/>
		           	</c:if>
	           	</div>
	           	<div style="width:85%">
					<h3 style="margin:0">${policeObj.policeName }
						<span style="font-size:14px">${policeObj.policeGrade}</span></h3>
				</div>
			</c:when>
			<c:otherwise>
	           	<div style="width:85%">
					<h3 style="margin:0">${receiver}님</h3>
				</div>
			</c:otherwise>
			</c:choose>
			<div class="d-flex justify-content-end">
				<a href="${ path }/chat/livechatlist.km">돌아가기</a>
			</div>
		</div>
		
        <div id="chattingData" class="border rounded p-3 mb-3" style="height: 400px; overflow-y: auto;">
            <div class="message my-2 justify-content-center">
                <div style="text-align:center" class="alert alert-info" role="alert">안녕하세요! 무엇을 도와드릴까요?</div>
            </div>
        </div>
        <div class="input-group">
            <input id="message" type="text" class="form-control" 
            	placeholder="메시지를 입력하세요..." aria-label="메시지를 입력하세요..." 
            	onkeyup="sendMessageHandler(event);">
            <div class="input-group-append">
                <button class="btn btn-primary" onclick="sendMessageHandler(event)" type="submit">전송</button>
            </div>
        </div>
		<input type="file" value="사진 보내기">
	</main>
	<script>
		if('${loginPolice}') {
			sender='${loginPolice.policeIdentity}';
			receive=`${param.receiver}`;
		}
		else if('${sessionScope.clientEmail}'){
			sender='${sessionScope.clientEmail}';
			receive='${param.recevier}';
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>