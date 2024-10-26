<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
    .requiredData {
        font-weight: bolder;
        color: red;
    }
    .alert {
        display: none;
        opacity: 0; 
        transition: opacity 0.5s ease;
        background-color: #f8d7da; 
        color: #721c24;
        border: 1px solid #f5c6cb; 
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    .info {
        display: none;
        opacity: 0; 
        transition: opacity 0.5s ease;
        background-color: #d7f8e3; 
        color: #721c24;
        border: 1px solid #f5c6cb; 
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    .alert.show {
        display: block; 
        opacity: 1; 
    }
    #alertContainer {
        position: fixed;
        right: 200px;
        bottom: 130px;
        z-index: 1000;
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
    <div id="alertContainer">
        <div id="emailCheckedAlert" class="info">기존 이메일 정보를 찾았어요.<br>해당 정보로 등록을 진행합니다.</div>
        <div id="emailCheckAlert" class="alert">이메일 중복 검사를 진행해주세요.</div>
        <div id="nameAlert" class="alert">이름 길이를 확인해주세요.</div>
        <div id="phoneAlert" class="alert">전화번호를 확인해주세요.</div>
        <div id="passwordPatternAlert" class="alert">비밀번호 규칙을 확인해주세요.</div>
        <div id="passwordAlert" class="alert">비밀번호 확인이 같지 않습니다.</div>
    </div>
    <br><br>
    <div class="d-flex justify-content-center">
        <h2>신고자정보 등록</h2>
    </div>
    <div style="width:60%">
        <form action="${path}/declaration/reportenroll.km" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="reporterName">신고자이름<span class="requiredData"> *</span></label>
                <input type="text" class="form-control" id="reporterName" name="reporterName" placeholder="신고자 이름 입력 (1글자 ~ 6글자)" required>
            </div>
            <div class="form-group">
                <label for="reporterEmail">신고자이메일<span class="requiredData"> *</span></label>
                <div class="input-group">
                    <input type="email" class="form-control" id="reporterEmail" name="reporterEmail" placeholder="신고자 이메일 (example@email.com)" required>
                    <div class="input-group-append">
                        <button class="btn btn-outline-primary" type="button" id="fetchReportsBtn">이메일 중복 검사</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="reporterPhone">신고자전화번호</label>
                <input type="text" class="form-control" id="reporterPhone" name="reporterPhone" placeholder="전화번호 (000-0000-0000)">
            </div>
            <div class="form-group">
                <label for="reporterSchool">신고자학교</label>
                <input type="text" class="form-control" id="reporterSchool" name="reporterSchool" placeholder="초,중,고">
            </div>
           <div class="form-group" id="passwordGroup">
			    <label for="reporterPassword">비밀번호<span class="requiredData"> *</span></label>
			    <input type="password" class="form-control" id="reporterPassword" name="reporterPassword" placeholder="비밀번호 (최소 8자 이상, 대문자와 특수문자 최소 1개씩 포함)">
			</div>
			<div class="form-group" id="password2Group">
			    <label for="reporterPassword2">비밀번호확인</label>
			    <input type="password" class="form-control" id="reporterPassword2" placeholder="비밀번호 확인">
			</div>

            <div class="form-group d-flex justify-content-center">
                <button class="btn btn-outline-success">등록</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-outline-warning">취소</button>
            </div>
        </form>
    </div>

    <script>
    	let emailChecked = false;
    
        document.getElementById("fetchReportsBtn").addEventListener("click", fetchReports);

        function validateForm() {
        	console.log("called");
            const name = document.getElementById("reporterName").value;
            const password = document.getElementById("reporterPassword").value;
            const confirmPassword = document.getElementById("reporterPassword2").value;
            const phone = document.getElementById("reporterPhone").value;
            const phoneRegex = /^\d{3}-?\d{3,4}-?\d{4}$/;

            let isValid = true;
            
            if (!emailChecked) {
                showAlert('emailCheckAlert'); 
                isValid = false;
            }
            
            if (!isPasswordValid(password) || !isPasswordValid(confirmPassword)) {
                showAlert('passwordPatternAlert');
                isValid = false;
            }

            if (password !== confirmPassword) {
                showAlert('passwordAlert');
                isValid = false;
            }

            if (phone && !phoneRegex.test(phone)) {
                showAlert('phoneAlert');
                isValid = false;
            }

            if (name.length < 1 || name.length > 6) {
                showAlert('nameAlert');
                isValid = false;
            }

            return isValid; 
        }

        function showAlert(alertId) {
            const alertMessage = document.getElementById(alertId);
            alertMessage.classList.remove('fade-out'); 
            alertMessage.style.display = 'block'; 
            alertMessage.classList.add('show', 'fade-in'); 

            setTimeout(() => {
                alertMessage.classList.remove('show', 'fade-in'); 
                alertMessage.classList.add('fade-out'); 
            }, 5000); 

            setTimeout(() => {
                alertMessage.style.display = 'none'; 
            }, 5500); 
        }

        function isPasswordValid(password) {
            const hasNumber = /[0-9]/.test(password);
            const hasLetter = /[a-zA-Z]/.test(password);
            const hasSpecialChar = /[~!@#$%^&*()_+|<>?:{}]/.test(password);
            return hasNumber && hasLetter && hasSpecialChar && password.length >= 8;
        }

        function fetchReports() {
            const email = encodeURIComponent(document.getElementById("reporterEmail").value);
            const url = `${path}/declaration/getReporterInfoByEmail.km?email=` + email;
            
            if (!email) {
                alert("이메일을 입력해주세요.");
                return;
            }

            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error("다시 시도해주세요.");
                    }
                    return response.json();
                })
                .then(reporter => {
                	if (reporter) {
                        document.getElementById("reporterName").value = reporter.reporterName || '';
                        document.getElementById("reporterPhone").value = reporter.reporterPhone || '';
                        document.getElementById("reporterSchool").value = reporter.reporterSchool || '';

                        document.getElementById("reporterPassword").value = reporter.reporterPassword || ''; 
                        document.getElementById("reporterPassword2").value = reporter.reporterPassword || ''; 
                        
                        document.getElementById("reporterName").readOnly = true;
                        document.getElementById("reporterPhone").readOnly = true;                       
                        document.getElementById("reporterSchool").readOnly = true;                      
                        document.getElementById("reporterPassword").readOnly = true;                    
                        document.getElementById("reporterPassword2").readOnly = true;
                        document.getElementById("reporterEmail").readOnly = true;

                        const passwordGroup = document.getElementById("passwordGroup");
                        const password2Group = document.getElementById("password2Group");
                        
                        if (passwordGroup) passwordGroup.style.display = 'none';
                        if (password2Group) password2Group.style.display = 'none';
                        emailChecked = true;
                        showAlert('emailCheckedAlert')
                    } else {
                        alert("해당 이메일로 등록된 정보가 없습니다.");
                        emailChecked = true;
                    }
                })
                .catch(error => {
                    alert("해당 이메일로 등록된 정보가 없습니다. 신규 가입을 진행해주세요.");
                    emailChecked = true;
                });
        }



    </script>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
