<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<style>
		.profileImgContainer{
			margin-right:2%;
		}
		.profileContent{
		
		}
	</style>
	<!-- main > section > article -->    
    <main class="container my-5" style="height: 600px;">
        <h2>채팅 리스트</h2>
        <ol class="list-group">
        <c:forEach var="police" items="${polices }">
            <li class="list-group-item d-flex list-group-item-action list-group-item-${police['POLICE_LOG']!=null?'success':'dark'} ">
            	<div class="profileImgContainer">
            		<input type='hidden' value="${police['POLICE_IDENTITY']}"/>
	            	<c:if test="${police['POLICE_PROFILE']==null }">
		            	<img class="profileImg" src="${path}/resources/images/basicprofile.png"/>
	            	</c:if>
	            	<c:if test="${police['POLICE_PROFILE']!=null }">
		            	<img src="${path}/resources/upload/profile/${police.policeProfile}"
		            	width="50"/>
	            	</c:if>
            	</div>
            	<div>
            		<h5>${police['POLICE_NAME']}<sub>${police['POLICE_GRADE']}</sub></h5>
            		<span>${police['POLICESTATION_NAME']}</span>
            	</div>
            </li>
         </c:forEach>
		</ol>
    </main>
    <script>
    	$(document).on("click",'.list-group-item-success',e=>{
    		const policeId=$(e.target).find("input[type='hidden']").val();
			console.log(policeId);
    		//채팅창 열기 
    		/* open(""); */
    	});
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>