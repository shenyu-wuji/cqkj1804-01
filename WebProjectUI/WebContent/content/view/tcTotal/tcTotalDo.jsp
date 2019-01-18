<%@page import="com.cqkj.service.TCourseService"%>
<%@page import="com.cqkj.bean.TCourse"%>
<%@page import="com.cqkj.bean.selTC"%>
<%@page import="com.cqkj.bean.UsersInfo"%>
<%@page import="com.cqkj.service.UsersInfoService"%>
<%@page import="com.alibaba.fastjson.serializer.SerializerFeature"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String opt = request.getParameter("opt");

    //查询学生
    if (opt.equals("selectStudent"))
    {
        //获取要查询未选课程的用户ID
        UsersInfoService uService = new UsersInfoService();

        List<UsersInfo> lui = uService.selectDeptsCode("student");

        String str = JSON.toJSONString(lui, SerializerFeature.WriteDateUseDateFormat);
        out.print(str);
    }
    else if (opt.equals("selectMsg"))
    {
        String usersId = request.getParameter("usersId");

        if (!(usersId == null || usersId.isEmpty()))
        {
            selTC<TCourse> selTc = new selTC<TCourse>();
            TCourseService tService = new TCourseService();

            tService.selectTCResult(selTc, usersId);

            String str = JSON.toJSONString(selTc, SerializerFeature.WriteDateUseDateFormat);
            out.print(str);
        }

    }
%>