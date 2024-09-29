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
</style>

<div class="report-container">
	<h2>경찰관 등록</h2>

	<form method="post" action="#">
		<div>
			<label>아이디: <input type="text" name="policeId" required></label><br>
			<label>비밀번호: <input type="text" name="policePassword" required></label><br>
			<label>이름: <input type="text" name="policeName" required></label><br>
			<label>이메일: <input type="text" name="policeMail" required></label><br>
			<label>전화번호: <input type="text" name="policePhone" required></label><br>
			<label>관할서 검색: <input type="text" name="policeJurisdiction"
				required oninput="searchPoliceStationByName(this.value);">
			</label><br>
			
			<label>관할서 이름: <input type="text" name="policeStationName" readonly/>	<br></label>	
			<label>관할서 구분: <input type="text" name="policeStationType" readonly/>	<br></label>	
			<label>관할서 시도청: <input type="text" name="policeStationSido" readonly/>	<br></label>	
			<label>관할서 연번: <input type="text" name="policeStationNumber" readonly/>	<br></label>	
			<label>관할서 주소: <input type="text" name="policeStationLocation" readonly/><br>	</label>	
		
			

			<div id="result" style="margin-top: 10px;"></div>

		</div>
		<input type="submit" class="btn btn-outline-success" value="등록">
		<input type="reset" class="btn btn-outline-danger" value="취소">
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="/resources/js/common.js"></script>

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
	    
	    if (result.length > 0) {
	        result.forEach(item => {
	            const div = document.createElement('div');
	            div.classList.add('info');
	            console.log(item);
	            div.innerHTML = `
	                <strong>경찰서:</strong> \${item['경찰서']}<br>
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
				
				    document.querySelector('input[name="policeStationName"]').value = item['관서명'];
				    document.querySelector('input[name="policeStationType"]').value = item['구분'];
				    document.querySelector('input[name="policeStationSido"]').value = item['시도청'];
				    document.querySelector('input[name="policeStationNumber"]').value = item['연번'];
				    document.querySelector('input[name="policeStationLocation"]').value = item['주소'];
				};


                
	            resultDiv.appendChild(div);
	        });
	    } else {
	        resultDiv.innerHTML = '<p>해당 경찰서를 찾을 수 없습니다.</p>';
	    }
	}






	loadPoliceStationsData();

</script>
