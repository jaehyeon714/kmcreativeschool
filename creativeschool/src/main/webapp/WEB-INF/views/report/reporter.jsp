<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />    
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.requiredData{
		font-weight:bolder;
		color:red;
	}
	.alert {
	    display: none;
	    position: fixed;
	    right: 200px;
	    bottom: 150px;
	    z-index: 1000;
	    opacity: 0; 
	    transition: opacity 0.5s ease;
	    background-color: #f8d7da; 
	    color: #721c24;
	    border: 1px solid #f5c6cb; 
	    padding: 15px;
	    border-radius: 5px;
	}

	.alert.show {
	    display: block; 
	    opacity: 1; 
	}
	.fade-in {
	    animation: fadeIn 0.5s forwards;
	}
	
	@keyframes fadeIn {
	    from { opacity: 0; }
	    to { opacity: 1; }
	}
	.fade-out {
	    animation: fadeOut 0.5s forwards;
	}
	
	@keyframes fadeOut {
	    from { opacity: 1; }
	    to { opacity: 0; }
	}
	
</style>
<main class="d-flex flex-column justify-content-center align-items-center">
	<div id="alertMessage" class="alert">
        비밀번호 확인이 같지 않습니다.
    </div>
	<div class="d-flex justify-content-center">
		<h2>신고자정보 등록</h2>
	</div>
	<div style="width:60%">
		<form action="${path }/declaration/reportenroll.km" 
		method="post" onsubmit="return validateForm()">
		  <div class="form-group">
		    <label for="reporterName">신고자이름<span class="requiredData"> *</span></label>
		    <input type="text" class="form-control" 
		    id="reporterName" name="reporterName" 
		    placeholder="신고자이름입력" required>
		  </div>
		  <div class="form-group">
		    <label for="reporterEmail">신고자이메일<span class="requiredData"> *</span></label>
		    <input type="email" class="form-control" 
		    id="reporterEmail" name="reporterEmail" 
		    placeholder="신고자이메일(example@email.com)" required>
		  </div>
		  <div class="form-group">
		    <label for="reporterPhone">신고자전화번호</label>
		    <input type="text" class="form-control" 
		    id="reporterPhone" name="reporterPhone"
		    placeholder="전화번호(000-0000-0000)">
		  </div>
		  <div class="form-group">
		    <label for="reporterSchool">신고자학교</label>
		    <input type="text" class="form-control" 
		    id="reporterSchool" name="reporterSchool"
		    placeholder="초,중,고">
		  </div>
		   <div class="form-group">
		    <label for="reporterPassword">비밀번호<span class="requiredData"> *</span></label>
		    <input type="password" class="form-control" 
		    id="reporterPassword" name="reporterPassword"
		    placeholder="비밀번호">
		  </div>
		  <div class="form-group">
		    <label for="reporterPassword2">비밀번호확인</label>
		    <input type="password" class="form-control" 
		    id="reporterPassword2"
		    placeholder="비밀번호확인">
		  </div>
		  <div class="form-group d-flex justify-content-center">
		    <button class="btn btn-outline-success">등록</button>
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    <button class="btn btn-outline-warning">취소</button>
		  </div>
		</form>

	</div>
	<script>
		function validateForm() {
		    var password = document.getElementById("reporterPassword").value;
		    var confirmPassword = document.getElementById("reporterPassword2").value;
		    if (password !== confirmPassword) {
		        showAlert();
		        return false; 
		    }
		    return true; 
		}
		
		function showAlert() {
		    const alertMessage = document.getElementById('alertMessage');
		    alertMessage.classList.remove('fade-out'); 
		    alertMessage.style.display = 'block'; 
		    alertMessage.classList.add('show'); 
		    alertMessage.classList.add('fade-in'); 

		    setTimeout(() => {
		        alertMessage.classList.remove('show'); 
		        alertMessage.classList.remove('fade-in'); 
		        alertMessage.classList.add('fade-out'); 
		    }, 5000); 

		    setTimeout(() => {
		        alertMessage.style.display = 'none'; 
		    }, 5500); 
		}



	    
	</script>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
