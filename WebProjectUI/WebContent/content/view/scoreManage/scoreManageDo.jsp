<%@page import="com.cqkj.bean.UsersInfo"%>
<%@page import="com.cqkj.service.UsersInfoService"%>
<%@page import="com.cqkj.bean.Student"%>
<%@page import="com.cqkj.service.StudentService"%>
<%@page import="com.cqkj.service.TSCService"%>
<%@page import="com.cqkj.bean.TSC"%>
<%@page import="java.util.Date"%>
<%@page import="com.cqkj.bean.selTC"%>
<%@page import="com.alibaba.fastjson.serializer.SerializerFeature"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.cqkj.service.TCourseService"%>
<%@page import="com.cqkj.bean.TCourse"%>
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
    //查询该学生所选课程
    else if (opt.equals("selectTC"))
    {
        //获取要查询的选课结果的用户ID，
        String usersId = request.getParameter("usersId");

        selTC<TCourse> selTc = new selTC<TCourse>();
        TCourseService tService = new TCourseService();

        tService.selectTCResult(selTc, usersId);

        String str = JSON.toJSONString(selTc, SerializerFeature.WriteDateUseDateFormat);
        out.print(str);

    }
    //查询所有选课信息
    else if (opt.equals("selectMsg"))
    {
        String usersId = request.getParameter("usersId");
        selTC<TCourse> selTc = new selTC<TCourse>();
        TCourseService tService = new TCourseService();
        tService.selectTCResult(selTc, usersId);

        String str = JSON.toJSONString(selTc, SerializerFeature.WriteDateUseDateFormat);
        out.print(str);

    }
    else if (opt.equals("update"))
    {
        //获取学生主键
        int usersId = Integer.parseInt(request.getParameter("usersId"));

        if (usersId == 0)
        {
            out.print("{\"msg\":\"usersIdNull\"}");
        }
        else
        {
            //获取课程主键
            int cId = Integer.parseInt(request.getParameter("cId"));

            if (cId == 0)
            {
                out.print("{\"msg\":\"cIdNull\"}");
            }
            else
            {
                //获取分数
                String score = request.getParameter("score");

                if (score == null || score.isEmpty())
                {
                    out.print("{\"msg\":\"scoreNull\"}");
                }
                else
                {
                    if (Integer.parseInt(score) < 0  || Integer.parseInt(score) > 100)
                    {
                        out.print("{\"msg\":\"scoreError\"}");
                    }
                    else
                    {
                        //更新数据
                        if(new TSCService().updSCByForeign(usersId,cId,Integer.parseInt(score)) > 0)
                        {
                            out.print("{\"msg\":\"OK\"}");
                        }
                    }
                }
            }
        }
    }
%>