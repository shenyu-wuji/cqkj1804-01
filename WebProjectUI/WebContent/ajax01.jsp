<%@page import="java.util.List"%><%@page import="com.cqkj.service.UsersInfoService"%><%@page import="com.cqkj.bean.UsersInfo"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	boolean flag = false;
	
	List<UsersInfo> lui = new UsersInfoService().SelectAll();
	
	for(UsersInfo u : lui)
	{
	    if(u.getLoginName().equals(name))
	    {
	        flag = true;
	        break;
	    }
	}
	
	if(flag)
	{
	    out.print("{\"loginName\":\"1\"}");
	}
	else
	{
	    out.print("{\"loginName\":\"0\"}");
	}
	
	
%>