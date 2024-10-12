<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
.report-container {
	background: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	margin: 0 auto;
}
input[readonly] {
    background-color: lightgray;
}
.info {
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 4px;
}
.alert {
    display: none;
    position: fixed;
    right: 20px;
    bottom: 20px;
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
</style>

<div class="report-container">
    <h2>경찰관 등록</h2>

	<form method="post" action="${path}/police/policeInsertDo.km" enctype="multipart/form-data" id="policeForm">
        <div style="display: flex;">
            <!-- 왼쪽 입력 필드 -->
            <div style="flex-grow: 1; margin-right: 20px;">
                <label>아이디: <input type="text" name="policeIdentity" required></label><br>
                <label>비밀번호: <input type="text" name="policePassword" required></label><br>
                <label>이름: <input type="text" name="policeName" required></label><br>
                <label>이메일: <input type="text" name="policeEmail" required></label><br>
                <label>전화번호: <input type="text" name="policePhone" required></label><br>
                <label>직위: <input type="text" name="policeGrade" required></label><br>
                <label>관할서 검색: <input type="text" name="policeJurisdiction"
                    required oninput="searchPoliceStationByName(this.value);"></label><br>
                
                <label>관할서 이름: <input type="text" name="policeStationName" readonly/><br></label>
                <label>관할서 구분: <input type="text" name="policeStationDiv" readonly/><br></label>
                <label>관할서 시도청: <input type="text" name="policeStationSidoStation" readonly/><br></label>
                <label>관할서 주소: <input type="text" name="policeStationAddress" readonly/><br></label>

                <div id="result" style="margin-top: 10px;"></div>
            </div>
            
            <div style="text-align: center;  margin-right: 70px;">
                <label for="policePhoto" style="cursor: pointer;">
                    <img id="photoPreview" src="${path }/resources/images/basicprofile.png" alt="사진 미리보기" style="border-radius: 50%; width: 150px; height: 150px; border: 2px solid #ccc;">
                    <input type="file" id="policePhoto" name="policePhoto" accept="image/*" style="display: none;" onchange="previewPhoto(event)">
                </label>
                <p>경찰관 사진 등록</p>
            </div>
        </div>

        <input type="submit" class="btn btn-outline-success" value="등록">
        <input type="reset" class="btn btn-outline-danger" value="취소">
    </form>
    
    <div id="alertMessage" class="alert">
        사진을 선택해야 제출할 수 있습니다.
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="${path }/resources/js/common.js"></script>

<script>
	
	let policeStationsData = [];
	
	async function loadPoliceStationsData() {
	    try {
	        policeStationsData = await searchPoliceStation(); 
	    }
	    catch (error) {
	        console.error(error);
	    }
	}

	function searchPoliceStationByName(name) {
	    const resultDiv = document.getElementById('result');
	    resultDiv.innerHTML = '';

	    const result = policeStationsData.filter(item => item['관서명'] === name);
	    const additionalResults = policeStationsData.filter(item => item['경찰서'] === name);
	    result.push(...additionalResults);

	    if (result.length > 0) {
	        result.forEach(item => {
	            const div = document.createElement('div');
	            div.classList.add('info');
	            console.log(item);
	            div.innerHTML = `
	                <strong>경찰서:</strong> \${item['경찰서']}경찰서<br>
	                <strong>관서명:</strong> \${item['관서명']}<br>
	                <strong>구분:</strong> \${item['구분']}<br>
	                <strong>시도청:</strong> \${item['시도청']}<br>
	                <strong>연번:</strong> \${item['연번']}<br>
	                <strong>주소:</strong> \${item['주소']}<br>
	            `;
	            
				div.onclick = function() {
				    const allDivs = document.querySelectorAll('.info');
				    allDivs.forEach(d => d.style.borderColor = '#ccc');
				
				    div.style.borderColor = 'blue';
				
				    document.querySelector('input[name="policeStationName"]').value = item['경찰서'] + '경찰서';
				    document.querySelector('input[name="policeStationDiv"]').value = item['구분'];
				    document.querySelector('input[name="policeStationSidoStation"]').value = item['시도청'];
				    document.querySelector('input[name="policeStationAddress"]').value = item['주소'];
				    
				    //더미
				    /*
				    document.querySelector('input[name="policeIdentity"]').value = '테스트아이디';
				    document.querySelector('input[name="policePassword"]').value = 'testpassword';
				    document.querySelector('input[name="policeName"]').value = '김춘식';
				    document.querySelector('input[name="policeEmail"]').value = '테스트이메일';
				    document.querySelector('input[name="policePhone"]').value = '1234';
				    document.querySelector('input[name="policeGrade"]').value = '학생';
					*/
				};


                
	            resultDiv.appendChild(div);
	        });
	    } else {
	        resultDiv.innerHTML = '<p>해당 경찰서를 찾을 수 없습니다.</p>';
	    }
	}


	loadPoliceStationsData();
	
    function previewPhoto(event) {
        const photoPreview = document.getElementById('photoPreview');
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            photoPreview.src = e.target.result;
        };

        if (file) {
            reader.readAsDataURL(file);
        }
    }
    document.getElementById('policeForm').addEventListener('submit', function(event) {
        const fileInput = document.getElementById('policePhoto');
        if (!fileInput.files.length) {
            event.preventDefault(); 
            showAlert(); 
        }
    });
    function showAlert() {
        const alertMessage = document.getElementById('alertMessage');
        
        alertMessage.classList.remove('show'); 
        alertMessage.style.display = 'block'; 
        alertMessage.style.opacity = '1'; 

        setTimeout(() => {
            alertMessage.classList.add('fade-in');
        }, 10); 

        setTimeout(() => {
            alertMessage.classList.remove('fade-in'); 
            alertMessage.style.opacity = '0'; 
        }, 5000); 
        
        setTimeout(() => {
            alertMessage.style.display = 'none';
        }, 5500);
    }

    

</script>
