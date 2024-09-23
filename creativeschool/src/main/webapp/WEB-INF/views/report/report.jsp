<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />    
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <style>
        .report-container { background: white; 
        padding: 20px; border-radius: 5px; 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        max-width: 95%; margin: 0 auto; }
        .perpetrator-info, .victimContainer, .attachment-info { 
        	border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; border-radius: 4px;
         }
         .perpetrator-info>.row,.victimContainer>.row{
         	margin:0 !important;
         	
         }
         .row>label{
         	margin-right:3% !important;
         	width:47%;
         }
         .victimContainer textarea,.perpetrator-info textarea{
         	resize:none;
         	width:100%;
         	height:200px;
         }
         .perpetrator-info textarea{
         	height:100px;
         }
         #attachContainer input[type="file"]{
         	width:45% !important;
         	margin:2%;
         }
         .deleteIcon{
         	cursor:pointer;
         	border-radius:50px;
         	/* border:2px solid red; */
		}
    </style>
<div class="report-container">
    <h2>학교폭력 신고 등록</h2>
    <form id="reportForm" action="${path}/declaration/reportenrollend.km" method="post" enctype="multipart/form-data">
        <div id="perpetratorContainer">
        	<div>
	            <div class="d-flex align-items-center" 
	            style="width:100%;margin-bottom:2%">
		            <h4>가해자 정보</h4>&nbsp;&nbsp;<span id="attackCount"></span>&nbsp;&nbsp;&nbsp;
		            <button type="button" class="btn btn-outline-info" 
		            onclick="addAttacker(event)">추가</button>
	            </div>
	            <div id="perpetrator-container" style="max-height:394px;overflow:scroll;">
		            <div class="perpetrator-info">
		           	 	<div class="d-flex justify-content-end">
		           	 		<img class="deleteIcon" src="${path }/resources/images/delete2.png" width="20px" onclick="delAttacker(event);">
		            	</div>
			            <div class="row">
			                <label>이름 
			                <input type="text" name="attackerName" 
			                class="form-control" required></label>
			                <label>학교 
			            	<input type="text" name="attackerSchool" 
			            	class="form-control" required></label>
						</div>
						<div class="row">     	
			                <label>연락처 
			                <input type="text" name="attackerContact"
			                class="form-control" required></label>
			                <label>성별 
			                    <select name="attackerGender"
			                    class="form-control" required>
			                        <option value="">선택하세요</option>
			                        <option value="남성">남성</option>
			                        <option value="여성">여성</option>
			                    </select>
			                </label>
			             </div>
			             <div class="row">
				             <label style="width:100%">주소 
				             <input type="text" name="attackerAddress" 
				             class="form-control" required></label>
			             </div>
			             <div class="row">
			             <label style="width:100%">인상착의
			             <textarea name="attackerInfo" 
				            class="form-control"></textarea>
				            </label>
			             </div>
	             	</div>
             	</div>
        </div>
        
        <div class="victimContainer">
            <h4>피해 정보</h4>
            <div class="row">
	            <label>신고 종류 <input type="text" class="form-control" name="reportType" required></label>
	            <label>발생 위치 <input type="text" class="form-control" name="incidentAddress" required></label>
            <label>발생 시간 <input type="datetime-local" class="form-control" name="incidentTime" required></label>
            </div>
            <div class='row'>            
            <label style="width:100%">상세 내용 
            <textarea name="incidentDetails" 
            class="form-control" 
             required></textarea></label>
             </div>
        </div>

        <div class="attachmentContainer">
        	<div class="d-flex align-items-center">
	            <h4>첨부 파일</h4>&nbsp;&nbsp;&nbsp;
	            <button type="button" 
	            class="btn btn-outline-info" onclick="addAttachment()">파일추가</button>
	            <button type="button" 
	            class="btn btn-outline-warning" onclick="delAttachment()">파일삭제</button>
            </div>
            <div id="attachContainer" class="d-flex">
            	<input class="form-control" type="file"
            	name="upfile" accept="image/*">
            </div>
        </div>

        <div class="button-group d-flex justify-content-end">
            <button type="submit" class="btn btn-outline-success" onclick="return dataCheck();">신고하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-outline-danger">취소하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary">임시 저장</button>
        </div>
     </div>
    </form>
</div>
<script>
	const dataCheck=()=>{
		const data=$('#reportForm').serialize();
		console.log(data);
		return false;
	}
	const addAttachment=()=>{
		if($("#attachContainer>input").length<5){
			const inputTemp=$("#attachContainer>input").first().clone();
			$('#attachContainer').append(inputTemp);
			
		}else{
			alert("첨부파일은 5개까지만 가능합니다");
		}
	}
	const delAttachment=()=>{
		if($("#attachContainer>input").length==1){
			alert("더이상 삭제할 수 없습니다.");			
		}else{
			$("#attachContainer>input").last().remove();
		}
	}
	const addAttacker=(e)=>{
		//가해자 입력form 추가하기 
		const $targetContainer=$(".perpetrator-info").first();
		const $copyContainer=$targetContainer.clone(true);
		console.log($copyContainer);
		const $containerDiv=$targetContainer.after($copyContainer);
		//복사된 가해자 정보 초기화 해주기 
		$copyContainer.find("input").val("");
		$copyContainer.find("textarea").val("");
		//스크롤 맨밑으로 조정하기
		const $container=$("#perpetrator-container");
		$container[0].scrollTop=$container[0].scrollHeight;
		funcAttackCount();
	}
	const delAttacker=(e)=>{
		//가해자 입력form 삭제하기
		if($(".perpetrator-info").length>1){
			$(e.target).parents("div.perpetrator-info").remove();
		}else{
			alert("삭제할 수 없습니다.")
		}
		funcAttackCount();
	}
	const funcAttackCount=()=>{
		$("#attackCount").text("("+$(".perpetrator-info").length+"명)");
	}
	$(document).on("click","input[name*=Address]",e=>{
		openSearchAddress(e.target);
	})
	/* document.querySelectorAll("input[name*=Address]").forEach(element=>element.addEventListener('click',e=>{
		openSearchAddress(e.target);
	})); */
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path }/resources/js/common.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>