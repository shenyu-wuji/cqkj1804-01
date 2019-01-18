<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="ceshi" value="7788" scope="page"></c:set>
	
	<c:out value="${ceshi1}" escapeXml="false"><h1>8899</h1></c:out>

	<!-- <form id="form1" action="Do.jsp"  method="post">
	昵称：<input type="text" name="name" /><br />
	所在城市：<input type="text" name="city" /><br />
	要使用的开发语言：<input type="checkbox" name="language" value="JAVA">JAVA
	<input type="checkbox" name="language" value="c#">c#
	<input type="checkbox" name="language" value="c">c
	<input type="checkbox" name="language" value="c++">c++<br />
	<button name="btnName" id="btnSubmit">提交</button>
	</form>
	
	<script type="text/javascript">
	$(function(){
		$("#btnSubmit").click(function(){
			$("#form1").submit();
		})
	});
	
	</script> -->
</body>
</html>