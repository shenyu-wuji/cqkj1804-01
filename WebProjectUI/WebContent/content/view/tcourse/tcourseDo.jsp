<%@page import="com.cqkj.bean.PageList"%>
<%@page import="com.alibaba.fastjson.serializer.SerializerFeature"%>
<%@page import="com.cqkj.bean.TCourse"%>
<%@page import="com.cqkj.service.TCourseService"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="java.util.List"%><%@page import="java.util.Date"%><%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String opt = request.getParameter("opt");
    TCourseService tService = new TCourseService();

    if (opt.equals("selectTCourse"))
    {
        //獲取查詢文本框的内容
        String name = request.getParameter("name");
        String pageIndex = request.getParameter("pageIndex");
        PageList<TCourse> pageList = new PageList<TCourse>();
        
        if(!(pageIndex == null || pageIndex.isEmpty()))
        {
            pageList.setPageIndex(Integer.parseInt(pageIndex));
        }
        
        tService.selectName(pageList,name);
        
        //List<TCourse> ltc = pageList.getData();
        
        /* application.setAttribute("pageIndex", pageList.getPageIndex());
        application.setAttribute("total", pageList.getPageCount());
        application.setAttribute("FirstSeq", pageList.getFirstSeq()); */
		
        //String str = JSON.toJSONString(pageList,SerializerFeature.WriteDateUseDateFormat);
        //out.print(str);
        String str = JSON.toJSONString(pageList,SerializerFeature.WriteDateUseDateFormat);
        out.print(str);
    }
    else if (opt.equals("add"))
    {
        //获取提交的用户名信息
		TCourse tCourse = new TCourse();
        
        tCourse.setcNo(request.getParameter("cNo"));
        tCourse.setcName(request.getParameter("cName"));
        tCourse.setCreateDate(new Date());
        //创建用户对象，传入提交的数据
       
        int flag = tService.addTCourse(tCourse);

        if (flag != 0)
        {
            //登陆成功，Session记录用户ID和用户名，并转到用户界面
            response.sendRedirect("tcourse.jsp");
        }
        else
        {
            response.sendRedirect("addTCourse.jsp");
        }
    }
    else if (opt.equals("delete"))
    {
        //获取提交的用户名信息
        int flag = tService.delTCourse(Integer.parseInt(request.getParameter("cId")));

        if (flag > 0)
        {
            out.print("{\"msg\":\"OK\"}");
        }
        else
        {
            out.print("{\"msg\":\"该课程不能删除，有学生选了这门课，需删除选了该课的学生了选课信息才能删除\"}");
        }
    }
    else if (opt.equals("update"))
    {
        //更新数据
        TCourse tCourse = new TCourse();
        
        tCourse.setcId(Integer.parseInt(request.getParameter("cId")));
        tCourse.setcNo(request.getParameter("cNo"));
        tCourse.setcName(request.getParameter("cName"));
        tCourse.setCreateDate(new Date(Long.parseLong(request.getParameter("createDate"))));
        
        int flag = tService.updTCourse(tCourse);

        if (flag != 0)
        {
            //登陆成功，Session记录用户ID和用户名，并转到用户界面
            response.sendRedirect("tcourse.jsp");
        }
        else
        {
            response.sendRedirect("addTCourse.jsp");
        }
    }
    else if (opt.equals("checkcNo"))
    {
        //检验课程编号
        String cNo = request.getParameter("cNo");

        boolean flag = tService.selectBycNo(cNo);

        if (flag)
        {
            out.print("{\"cNo\":\"1\"}");
        }
        else
        {
            out.print("{\"cNo\":\"0\"}");
        }
    }
%>