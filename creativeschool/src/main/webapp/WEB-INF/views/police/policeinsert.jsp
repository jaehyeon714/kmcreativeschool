<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>    

<style>
     .report-container { background: white; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-width: 600px; margin: 0 auto; }
     .perpetrator-info, .attachment-info { border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; border-radius: 4px; }
</style>

    <div class="report-container">
        <h2>경찰관 등록</h2>
        
        <form method="post" action="#">
            <div >
                <div >
                    <label>이름: <input type="text" name="policeName" required></label>
                    <label>이메일: <input type="text" name="policeMail" required></label>
                    <label>전화번호: <input type="text" name="policePhone" required></label>
                    <label>관할서: <input type="text" name="policeJurisdiction" required></label>
                </div> 
                   		<input type="submit" class="btn btn-outline-success" value="등록">
                   		<input type="reset" class="btn btn-outline-danger" value="취소">
            </div>
        </form>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>