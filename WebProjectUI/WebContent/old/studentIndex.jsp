<%@page import="com.cqkj.service.StudentService"%>
<%@page import="com.cqkj.bean.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <%! 
     
     List<Student> stus = new StudentService().SelectAll();
     
     %>
     
     姓名：<%=stus.get(0).getStuName() %>
     年龄：<%=stus.get(0).getStuAge() %>
     姓名：<%=stus.get(1).getStuName() %>
     年龄：<%=stus.get(1).getStuAge() %>
     
</body>
</html>