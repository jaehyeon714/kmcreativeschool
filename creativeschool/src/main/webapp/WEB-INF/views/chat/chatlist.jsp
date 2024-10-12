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
		.list-group>li{
			width:100% !important;
		}
		#chatlist-container{
			overflow:auto;
			height:700px;
		}
	</style>
	<!-- main > section > article -->    
    <main class="container my-5" style="height: 600px;">
        <h2>채팅 리스트</h2>
        <ol id="chatlist-container" class="list-group">
        <c:forEach var="police" items="${polices }">
            <li class="list-group-item d-flex list-group-item-action list-group-item-${police['POLICE_LOG']!=null?'success':'dark'} ">
            	<div class="profileImgContainer">
            		<input type='hidden' value="${police['POLICE_IDENTITY']}"/>
	            	<c:if test="${police['POLICE_PROFILE']==null }">
		            	<img class="profileImg" src="${path}/resources/images/basicprofile.png"/>
	            	</c:if>
	            	<c:if test="${police['POLICE_PROFILE']!=null }">
		            	<img src="${path}/resources/upload/police/${police.policeProfile}"
		            	width="50"/>
	            	</c:if>
            	</div>
            	<div style="display:flex;justify-content:space-between;width:100%">
            		<div>
            			<h5>${police['POLICE_NAME']}<sub>${police['POLICE_GRADE']}</sub></h5>
            			<span>${police['POLICESTATION_NAME']}</span>
            		</div>
            		<div style="">
            		<c:if test="${police['POLICE_LOG']==null}">
            			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-bell-slash" viewBox="0 0 16 16">
						  <path d="M5.164 14H15c-.299-.199-.557-.553-.78-1-.9-1.8-1.22-5.12-1.22-6q0-.396-.06-.776l-.938.938c.02.708.157 2.154.457 3.58.161.767.377 1.566.663 2.258H6.164zm5.581-9.91a4 4 0 0 0-1.948-1.01L8 2.917l-.797.161A4 4 0 0 0 4 7c0 .628-.134 2.197-.459 3.742q-.075.358-.166.718l-1.653 1.653q.03-.055.059-.113C2.679 11.2 3 7.88 3 7c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0c.942.19 1.788.645 2.457 1.284zM10 15a2 2 0 1 1-4 0zm-9.375.625a.53.53 0 0 0 .75.75l14.75-14.75a.53.53 0 0 0-.75-.75z"/>
						</svg>
            		</c:if>
            		</div>
            	</div>
            </li>
         </c:forEach>
		</ol>
    </main>
    <script>
    	$(document).on("click",'.list-group-item-success',e=>{
    		const policeId=$(e.currentTarget).find("input[type='hidden']").val();
    		let clientEmail='';
    		
    		if('${sessionScope.clientEmail}'){
    			alert("저장된 이메일로 연결합니다.");
    			sender='${sessionScope.clientEmail}';
    			location.assign(`${path}/chat/livechat.km?receiver=\${policeId}&sender=${sessionScope.clientEmail}`);
    		}else{
				clientEmail=prompt("이메일입력");
				sender=clientEmail;
				if(clientEmail!=null&&clientEmail.trim().length>0&&clientEmail.indexOf("@")!=-1){
					location.assign(`${path}/chat/livechat.km?receiver=\${policeId}&sender=\${clientEmail}`);
				}else{
					alert("이메일 형식에 맞춰서 반드시 입력해야합니다.");
				}
    		}
    	});
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>