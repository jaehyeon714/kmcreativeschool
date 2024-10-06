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
        <div id="fileUploadContainer" class="row" style="padding-top:3%">
			<div class="col-6 input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">파일업로드</span>
			  </div>
			  <div class="custom-file">
			    <input type="file" class="custom-file-input" 
			    	id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"
			    multiple>
			    <label class="custom-file-label" for="inputGroupFile01">파일선택</label>
			  </div>
			</div>
			<div class="col-4 input-group mb-3">
				<button class="btn btn-success" onclick="uploadFile();">파일전송</button>
			</div>
		</div>
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
		document.querySelector("#inputGroupFile01").addEventListener("change",e=>{
			const $label=$(e.target).next("label");
			const files=e.target.files;
			if(files.length>1){
				$label.text(e.target.files[0].name+'등 '+files.length+'건');
			}else{
				$label.text(e.target.files[0].name);
			}
		});
		function uploadFile(){
			const formData=new FormData();
			formData.append("sender",sender);
			formData.append("receiver",receiver);
			formData.append("chattingRoom",chattingRoom);
			
			const $fileInput=document.querySelector("#inputGroupFile01");
			for(file of $fileInput.files){
				formData.append("upfile",file);
			}
			//파일 등록하기
			 $.ajax({
				url:"${path}/chat/upload.km",
				data:formData,
				type:'post',
				processData:false,
				contentType:false,
				success:data=>{
					//파일업로드 내용 채팅창에 전송하기
					const chatData=data;
					//chatData.chattingContent=JSON.parse(data.chattingContent);
					//console.log(chatData);
					websocket.send(JSON.stringify(chatData));
					alert("파일업로드 완료");
				},error:data=>{
					alert("파일업로드에 실패했습니다. :( 다시 시도해주세요!");
				},complete:()=>{
					$fileInput.value='';
					$($fileInput).next("label").text("파일선택");
				}
			}); 
			
			
			
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>