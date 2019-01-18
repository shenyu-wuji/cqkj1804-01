<%@page import="com.cqkj.service.UsersInfoService"%><%@page
	import="com.cqkj.bean.UsersInfo"%><%@page import="java.util.List"%><%@ page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String jaxaName = request.getParameter("jaxaName");
    boolean flag = false;

    List<UsersInfo> lui = new UsersInfoService().SelectAll();

    for (UsersInfo u : lui)
    {
        if (u.getLoginName().equals(jaxaName))
        {
            flag = true;
            break;
        }
    }

    if (flag)
    {
        out.print("{\"loginName\":\"1\"}");
    }
    else
    {
        out.print("{\"loginName\":\"0\"}");
    }
%>