<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

     <!-- 
     1:JSP: Java Server Pages,它是基于Servlet规范的一门动态网站开发技术。
     2:JSP页面中包含：HTML静态代码和Java代码
     
     3:声明代码块（定义变量和方法） < %! // 声明的java代码  % >
     
     4:输出代码块（向HTML中输出内容）< % out.print(表达式); % >
     
     5:输出表达式（向HTML中输出表达式的结果） < %=表达式 % >
     
     6:JSP运行原理：
     JSP页面-> 预编译成Servlet.java文件 -> 生成 .class字节码文件 -> 第一次访问生成一个Servlet对象（只生成一次）
     (生成的java和class文件 保存在Tomcat的work目录下)
      -->
      
      <%!
      
      int num1 = 9;
      int num2 = 8;
      
      public int add()
      {
    	  return num1 + num2;
      }
      
      %>
      
      num1+num2的值是：<% out.println(add());out.println(num1); %>
      num1+num2的值是：<%= add() %>
      
                  作业：新建一个JSP页面，页面的内容显示学生表中“张三”的基本信息。
      
     <h1>Hello JSP!</h1> 
</body>
</html>