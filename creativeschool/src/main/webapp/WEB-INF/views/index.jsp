<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <meta charset="UTF-8">
    <title>신고 사이트</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${ path }/resources/css/basic.css">
    <script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        .main-container {
            position: relative;
            background: url('${path}/resources/images/mainPage.jpg') no-repeat center center/cover; /* 배경 이미지 설정 */
            height: calc(100vh - 170px); /* 헤더와 푸터의 높이를 고려 */
            z-index: 1; /* 콘텐츠가 이미지 위에 오도록 설정 */
        }
        .content {
            position: relative;
            z-index: 2; /* 콘텐츠가 이미지 위에 있도록 설정 */
        }
        .card {
            margin: 20px 0;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.92); /* 카드 바디를 살짝 투명하게 설정 */
        }
        .icon {
            font-size: 50px;
            color: #007bff;
        }
        .text-overlay {
            color: white; /* 텍스트 색상을 흰색으로 변경 */
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); /* 어두운 그림자 추가 */
            font-weight: bold; /* 폰트 두께 조절 */
        }
    </style>
    <main class="main-container">
        <div class="content container py-5">
            <h1 class="text-center mb-4 text-overlay">신고를 위한 안내</h1>
            <h5 class="text-center mb-4 text-overlay">신고하고 싶은 내용을 아래에 입력하세요.</h5>
            
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <i class="fas fa-exclamation-circle icon"></i>
                            <h5 class="card-title">신고하기</h5>
                            <p class="card-text">신고하고 싶은 사건을 접수하세요.</p>
                            <a href="${path}/declaration/requestdeclaration.km" class="btn btn-primary">신고하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <i class="fas fa-comments icon"></i>
                            <h5 class="card-title">실시간 채팅</h5>
                            <p class="card-text">실시간으로 상담사와 연결됩니다.</p>
                            <a href="${path}/chat/livechatlist.km" class="btn btn-primary">채팅 시작</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
