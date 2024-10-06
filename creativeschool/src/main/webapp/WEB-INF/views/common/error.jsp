<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<html>
<head>
</head>
<body>
	<div style="display:flex;justify-content:center;align-items:center;height:400px">
		<img src="${path }/resources/images/accessdenie.png" width="200">
	</div>
	<div style="display:flex;flex-direction:column;align-items:center">
	 	<h3>이 기능은 로그인 후 사용할 수 있습니다.</h3>
		<p>3초 후 로그인화면으로 이동합니다.</p>
	</div>
	<script>
		setTimeout(()=>{
			location.replace("${path}/police/policeenroll.do");
		},3000)
	</script>
 </body>
</html>