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
			sender2=paramObj.get('sender');
			if(sender.includes("@")){
				const msg=new Message("request",sender,receiver,'실시간 채팅을 요청했습니다.',new Date(),`${receiver}_${sender2}`);
				websocket.send(JSON.stringify(msg));
				chattingRoom=`${receiver}_${sender2}`;
			}else{
				// const msg=new Message("roominsert",sender,receiver,'',new Date(),`${sender2}_${receiver}`);
				// websocket.send(JSON.stringify(msg));
				chattingRoom=`${sender2}_${receiver}`;
			}
		}
		websocket.onmessage=(response)=>{
			const message=JSON.parse(response.data);
			switch(message.chattingCategory){
				case "request":request(message);break;
				case "msg" : acceptMessage('#chattingData',message);break;
			}
			
		}
	};
}
const acceptMessage=(id, message)=>{
	const $container=message.sender===sender?makeChatContent('my',message.chattingContent):makeChatContent('other',message.chattingContent);
	const $chattingContainer=document.querySelector(id)
	$chattingContainer.appendChild($container);
	//스크롤 맨밑으로 조정하기
	// const $container=$("#perpetrator-container");
	// $container[0].scrollTop=$container[0].scrollHeight;
	$chattingContainer.scrollTop=$chattingContainer.scrollHeight;
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
		$container.classList.add("justify-content-start");
	}else{
		$content.classList.add("alert-primary");
		$container.classList.add("justify-content-end");
	}

	$content.setAttribute("role","alert")
	$content.innerText=content;
	$container.appendChild($content);
	return $container;
}
const request=(message)=>{
	if(confirm(`${message.sender}님이 채팅을 요청하셨습니다. 채팅방에 들어가시겠습니까?`)){
		location.assign(`${contextPath}/chat/livechat.km?sender=${message.receiver}&receiver=${message.sender}`);
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