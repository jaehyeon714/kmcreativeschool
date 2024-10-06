let sender="";
let websocket="";
let receiver="";
let contextPath=""
let chattingRoom="";
function openSocket(server,path){
	contextPath=path;
	websocket=new WebSocket(`ws://${server}${path}/chatting`);
	websocket.onopen=data=>{
		if(sender!=''){
			const msg=new Message("open",sender,'','접속',new Date());
			websocket.send(JSON.stringify(msg));
			const url=new URL(location.href);
			const paramObj=url.searchParams;
			receiver=paramObj.get('receiver');
			const sender2=paramObj.get('sender');
			if(sender.includes("@")){
				const msg=new Message("request",sender,receiver,'실시간 채팅을 요청했습니다.',new Date(),`${receiver}_${sender2}`);
				websocket.send(JSON.stringify(msg));
				chattingRoom=`${receiver}_${sender2}`;
			}else{
				const msg=new Message("roominsert",sender,receiver,'',new Date(),`${sender2}_${receiver}`);
				websocket.send(JSON.stringify(msg));
				chattingRoom=`${sender2}_${receiver}`;
			}
		}
		websocket.onmessage=(response)=>{
			const message=JSON.parse(response.data);
			switch(message.chattingCategory){
				case "request":request(message);break;
				case "msg" : acceptMessage('#chattingData',message);break;
				case "enter" : acceptMessage('#chattingData',message);break;
				case "file" : filePrintMessage("#chattingData",message);break;
			}
			
		}
	};
}
const checkFileExt={
	image:['png','jpeg','jpg','gif','wbep','svg','avif'],
	sound:["mp3",'wav','ogg'],
	video:["mp4","webm","ogg"]	
}
const filePrintMessage=(id,message)=>{
	const content=JSON.parse(message.chattingContent);
	if(content.length>0){
		content.forEach(e=>{
			const ext=e.substring(e.lastIndexOf(".")+1);
			const result=checkFile(ext);
			const $tag=createFileTag(result,e);
			const $container=makeChatContent(message.sender==sender?"my":"other",$tag);
			const $chattingContainer=document.querySelector(id)
			$chattingContainer.appendChild($container);
			//스크롤 맨밑으로 조정하기
			$chattingContainer.scrollTop=$chattingContainer.scrollHeight;
		});			
	}
}
const createFileTag=(tagName,fileName)=>{
	const tag=document.createElement(tagName);
	tag.setAttribute("src",`${contextPath}/resources/upload/chatting/${chattingRoom}/${fileName}`);
	tag.setAttribute("width","400px");
	tag.setAttribute("height","400px");
	if(tagName!='img'){
		tag.setAttribute("controls","true");
	}
	tag.addEventListener("click",(e)=>{
		location.assign(`${contextPath}/chat/download?rename=${fileName}&chattingRoom=${chattingRoom}`);
	});
	tag.style.cursor="pointer";
	return tag;
	
}
const checkFile=(ext)=>{
	let result="";
	for(check in checkFileExt){
		if(checkFileExt[check].includes(ext)){
			//사진,영상,이미지파일
			switch(check){
				case 'image' : result="img";break; 
				case 'video' : result="video";break;
				case 'sound' : result="audio";break;
			}
			if(result!="") return result;
		}
	}
	return result;
}
const acceptMessage=(id, message)=>{
	const $chattingContainer=document.querySelector(id)
	let $container='';
	if(message.chattingCategory=='msg'){
		//메세지 출력하는것 만들기
		$container=message.sender===sender?makeChatContent('my',message.chattingContent):makeChatContent('other',message.chattingContent);
		
	}else{
		//서버에서 보낸 정보 글 만들기
		$container=makeInfo(message.chattingContent);
	}
	$chattingContainer.appendChild($container);
	//스크롤 맨밑으로 조정하기
	$chattingContainer.scrollTop=$chattingContainer.scrollHeight;
}
const makeInfo=(msg)=>{
	const $container=document.createElement("div");
	$container.classList.add("message");
	$container.classList.add("my-2");
	$container.classList.add('justify-content-center');
	const $content=document.createElement("div");
	$content.style.textAlign='center';
	$content.setAttribute("role","alert");
	$content.classList.add("alert");
	$content.classList.add("alert-info");
	$content.innerText=msg;
	$container.appendChild($content);
	return $container;
}
const makeChatContent=(flag,content)=>{
	const $container=document.createElement("div");
	$container.classList.add("message");
	$container.classList.add("my-2");
	$container.classList.add('col-12');
	$container.classList.add('d-flex');
	$container.setAttribute("role","alert");
	const $content=document.createElement("div");
	$content.classList.add("alert");
	$content.classList.add("content");
	if(flag==='my'){
		$content.classList.add("alert-secondary");
		$container.classList.add("justify-content-end");
	}else{
		$content.classList.add("alert-primary");
		$container.classList.add("justify-content-start");
	}

	$content.setAttribute("role","alert")
	if(typeof content==='string') $content.innerText=content; 
	else $content.appendChild(content);
	$container.appendChild($content);
	return $container;
}
const request=(message)=>{
	if(confirm(`${message.sender}님이 채팅을 요청하셨습니다. 채팅방에 들어가시겠습니까?`)){
		location.assign(`${contextPath}/chat/livechat.km?sender=${message.receiver}&receiver=${message.sender}`);
		const msg=new Message("enter",sender,receiver,`입장하셨습니다.`,new Date(),`${message.chattingRoom}`)
		websocket.send(JSON.stringify(msg));
	}
}
const sendMessageHandler=(e)=>{
	const text=$('#message').val();	
	if(text!==''){
		if(e.currentTarget.tagName==='INPUT'){
			if(e.key=='Enter'){
				sendMessage(text);			
			}
		}else{
			sendMessage(text);
		}
	}
}	
const sendMessage=(text)=>{
	const msg=new Message("msg",sender,receiver,`${text}`,new Date(),`${chattingRoom}`);
	websocket.send(JSON.stringify(msg));
	document.querySelector("#message").value='';
}
class Message{
	constructor(chattingCategory,sender,
			receiver,chattingContent,chattingDate,chattingRoom){
		this.chattingCategory=chattingCategory;
		this.sender=sender;
		this.receiver=receiver;
		this.chattingContent=chattingContent;
		this.chattingDate=chattingDate;
		this.chattingRoom=chattingRoom
	}
}