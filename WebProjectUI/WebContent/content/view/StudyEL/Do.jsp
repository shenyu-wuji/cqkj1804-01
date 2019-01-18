<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结果</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
	<span style="color:red">结果显示</span><br />
	<span>昵称:${param.name} </span><br />
	<span>所在城市：${param.city} </span><br />
	<span>要使用的开发语言：<c:forEach items="${paramValues.language}" varStatus="userIndex" var="users" >
						${users}
						${userIndex.last ? "" : ","}
					</c:forEach> </span>
</body>
</html>