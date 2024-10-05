<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
    <%
        // 현재 세션 가져오기
        HttpSession currentSession = request.getSession(false);
    	boolean isLoggedIn = (currentSession != null && currentSession.getAttribute("user") != null);
        
        if (!isLoggedIn) {
    %>
        <h1>이 기능은 로그인 후 사용할 수 있습니다.</h1>
        <p>로그인 페이지로 가시겠습니까? <a href="policeenroll.jsp">로그인</a></p>
    <%
        } 
    %>