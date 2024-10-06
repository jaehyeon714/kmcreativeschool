<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" /> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <script>
        function closeWindow() {
            window.close(); 
        }
    </script>
    <meta charset="UTF-8">
    <title>완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #ff6363;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
            color: #555;
        }
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ff6363;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 20px;
        }
        .back-button:hover {
            background-color: #ff6363;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>실패</h2>
        <div class="message">요청이 실패했습니다.<br>입력하신 이메일로 등록된 계정이 존재하지 않습니다.</div>
        <button class="back-button" onclick="closeWindow()">닫기</button>
    </div>
    
</body>

</html>
