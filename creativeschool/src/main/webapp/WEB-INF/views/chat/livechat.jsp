<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main class="container my-4">
		<div class="d-flex justify-content-start align-items-center">
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
			<div class="d-flex justify-content-end">
				<a href="${ path }/chat/livechatlist.km">돌아가기</a>
			</div>
		</div>
		
        <div id="" class="border rounded p-3 mb-3" style="height: 400px; overflow-y: auto;">
            <div class="message my-2">
                <div class="alert alert-secondary" role="alert">안녕하세요! 어떻게 도와드릴까요?</div>
            </div>
            <div class="message my-2">
                <div class="alert alert-primary" role="alert">안녕하세요! 질문이 있습니다.</div>
            </div>
        </div>
        <div class="input-group">
            <input id="message" type="text" class="form-control" placeholder="메시지를 입력하세요..." aria-label="메시지를 입력하세요..." required>
            <div class="input-group-append">
                <button class="btn btn-primary" onclick="sendMessage()" type="submit">전송</button>
            </div>
        </div>
		<input type="file" value="사진 보내기">
	</main>
	<script>
		const police='${param.police}';
		const clientEmail='${sessionScope.clientEmail}';
		const chattingRoom=`\${police}_\${clientEmail}`;
		const websocket=new WebSocket("ws://localhost:9090/${path}/chatting");
		websocket.onopen=data=>{
			const msg=new Message("open",clientEmail,'','접속',new Date());
			websocket.send(JSON.stringify(msg));			
		};
		websocket.onmessage=(data)=>{
			console.log(data);
		}
		
		
		const sendMessage=()=>{
			const text=$('#message').val();
			
		}
		class Message{
			constructor(chattingCategory,sender,
					reciever,chattingContent,chattingDate,chattingRoom){
				this.chattingCategory=chattingCategory;
				this.sender=sender;
				this.reciever=reciever;
				this.chattingContent=chattingContent;
				this.chattingDate=chattingDate;
				this.chattingRoom=chattingRoom
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>