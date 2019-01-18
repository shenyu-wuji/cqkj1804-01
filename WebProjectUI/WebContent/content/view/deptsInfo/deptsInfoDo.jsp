<%@page import="com.cqkj.bean.DeptsInfo"%>
<%@page import="com.cqkj.service.DeptsInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	    request.setCharacterEncoding("utf-8");
	    String opt = request.getParameter("opt");

	    if (opt.equals("delete"))
	    {
	        //获取删除对象主键ID
	        String deptsId = request.getParameter("deptsId");
	        
	        //执行删除功能
	        new DeptsInfoService().delDeptsInfo(Integer.parseInt(deptsId));

	        response.sendRedirect("deptsInfo.jsp");
	    }
	    else if (opt.equals("add"))
	    {
	        //获取提交的用户名信息
	        DeptsInfo di = new DeptsInfo();
	        di.setDeptsCode(request.getParameter("deptsCode"));
	        di.setDeptsName(request.getParameter("deptsName"));

	        //创建用户对象，传入提交的数据
	        
	        int flag = new DeptsInfoService().AddUsersInfo(di);

	        if (flag != 0)
	        {
	            //登陆成功，Session记录用户ID和用户名，并转到用户界面
	            response.sendRedirect("deptsInfo.jsp");
	        }
	        else
	        {
	            response.sendRedirect("addDepts.jsp");
	        }
	    }
	    else if (opt.equals("update"))
	    {
	        DeptsInfo di = new DeptsInfo();
	        //获取提交的用户名信息
	        di.setDeptsId(Integer.parseInt(request.getParameter("deptsId")));
	        di.setDeptsCode(request.getParameter("deptsCode"));
	        di.setDeptsName(request.getParameter("deptsName"));

	        int flag = new DeptsInfoService().updDeptsInfo(di);

	        if (flag != 0)
	        {
	            //登陆成功，Session记录用户ID和用户名，并转到用户界面
	            response.sendRedirect("deptsInfo.jsp");
	        }
	        else
	        {
	            response.sendRedirect("addDepts.jsp");
	        }
	    }
	    else if (opt.equals("ajaxCode"))
	    {
	        String deCode = request.getParameter("deCode");

	        boolean flag = new DeptsInfoService().selectByDeptsCode(deCode);

	        if (flag)
	        {
	            out.print("{\"deptsCode\":\"1\"}");
	        }
	        else
	        {
	            out.print("{\"deptsCode\":\"0\"}");
	        }
	    }
	%>