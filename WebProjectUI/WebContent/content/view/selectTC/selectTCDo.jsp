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
    TCourseService tService = new TCourseService();

    if (opt.equals("selectUnTC"))
    {
        //获取要查询未选课程的用户ID
        String usersId = request.getParameter("usersId");

        List<TCourse> ltc = tService.selectUnTC(Integer.parseInt(usersId));

        String str = JSON.toJSONString(ltc, SerializerFeature.WriteDateUseDateFormat);
        out.print(str);
    }
    else if (opt.equals("select"))
    {
        //获取要查询的选课结果的用户ID
        String usersId = request.getParameter("usersId");

        selTC<TCourse> selTc = new selTC<TCourse>();

        tService.selectTCResult(selTc,usersId);

        String str = JSON.toJSONString(selTc, SerializerFeature.WriteDateUseDateFormat);
        out.print(str);
    }
    else if (opt.equals("selectTC"))
    {
        //获取要选课的用户ID和课程ID
        String usersId = request.getParameter("usersId");
        String cId = request.getParameter("cId");

        //如果没有选择课程返回提示信息
        if (cId == null || cId.isEmpty())
        {
            out.print("{\"msg\":\"请选择课程111\"}");
        }
        else
        {
            //创建选课对象
            TSC tsc = new TSC();
            tsc.setcId(Integer.parseInt(cId));
            tsc.setStuId(Integer.parseInt(usersId));
            tsc.setCreateDate(new Date());

            //判断选课是否成功
            if (new TSCService().addSC(tsc) > 0)
            {
                out.print("{\"msg\":\"OK\"}");
            }
            else
            {
                out.print("{\"msg\":\"选课失败\"}");
            }
        }
    }
    else if (opt.equals("deleteTC"))
    {
        //获取要选课的用户ID和课程ID
        String scId = request.getParameter("scId");

        //判断选课是否成功
        if (new TSCService().delSC(Integer.parseInt(scId)) > 0)
        {
            out.print("{\"msg\":\"OK\"}");
        }
        else
        {
            out.print("{\"msg\":\"删除失败\"}");
        }

    }
%>