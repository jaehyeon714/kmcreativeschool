<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학교폭력 신고 등록</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; }
        .report-container { background: white; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-width: 600px; margin: 0 auto; }
        .perpetrator-info, .attachment-info { border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; border-radius: 4px; }
        button { margin-top: 10px; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #218838; }
    </style>
    <script>
        function addPerpetrator() {
            const container = document.getElementById('perpetratorContainer');
            const newPerpetrator = `
                <div class="perpetrator-info">
                    <h4>가해자 정보</h4>
                    <label>이름: <input type="text" name="perpetratorName" required></label>
                    <label>학교: <input type="text" name="perpetratorSchool" required></label>
                    <label>주소: <input type="text" name="perpetratorAddress" required></label>
                    <label>연락처: <input type="text" name="perpetratorContact" required></label>
                    <label>성별: 
                        <select name="perpetratorGender" required>
                            <option value="">선택하세요</option>
                            <option value="남성">남성</option>
                            <option value="여성">여성</option>
                        </select>
                    </label>
                </div>
            `;
            container.insertAdjacentHTML('beforeend', newPerpetrator);
        }

        function addAttachment() {
            const container = document.getElementById('attachmentContainer');
            const newAttachment = `
                <div class="attachment-info">
                    <input type="file" name="attachments" required>
                    <button type="button" onclick="removeAttachment(this)">삭제</button>
                </div>
            `;
            container.insertAdjacentHTML('beforeend', newAttachment);
        }

        function removeAttachment(button) {
            button.parentElement.remove();
        }
    </script>
</head>
<body>
    <div class="report-container">
        <h2>학교폭력 신고 등록</h2>
        
        <form action="/submit-report" method="post">
            <div id="perpetratorContainer">
                <h3>가해자 정보</h3>
                <div class="perpetrator-info">
                    <label>이름: <input type="text" name="perpetratorName" required></label>
                    <label>학교: <input type="text" name="perpetratorSchool" required></label>
                    <label>주소: <input type="text" name="perpetratorAddress" required></label>
                    <label>연락처: <input type="text" name="perpetratorContact" required></label>
                    <label>성별: 
                        <select name="perpetratorGender" required>
                            <option value="">선택하세요</option>
                            <option value="남성">남성</option>
                            <option value="여성">여성</option>
                        </select>
                    </label>
                </div>
            </div>
            <button type="button" onclick="addPerpetrator()">가해자 추가</button>
            
            <div id="victimContainer">
                <h3>피해 정보</h3>
                <label>신고 종류: <input type="text" name="reportType" required></label>
                <label>발생 위치: <input type="text" name="incidentLocation" required></label>
                <label>발생 시간: <input type="datetime-local" name="incidentTime" required></label>
                <label>상세 내용: <textarea name="incidentDetails" required></textarea></label>
            </div>

            <div id="attachmentContainer">
                <h3>첨부 파일</h3>
                <button type="button" onclick="addAttachment()">첨부 파일 추가</button>
            </div>

            <div class="button-group">
                <button type="submit">신고하기</button>
                <button type="button">취소하기</button>
                <button type="button">임시 저장</button>
            </div>
        </form>
    </div>
</body>
</html>