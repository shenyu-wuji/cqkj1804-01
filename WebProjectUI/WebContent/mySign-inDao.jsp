<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.cqkj.service.DeptsInfoService"%>
<%@page import="com.cqkj.bean.DeptsInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.cqkj.bean.UsersInfo"%>
<%@page import="com.cqkj.service.UsersInfoService"%>
<%@page import="com.cqkj.dao.UsersInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

    String opt = request.getParameter("opt");

    //生成用户类型复选框
    if (opt.equals("loginRole"))
    {
        List<DeptsInfo> ldi = new DeptsInfoService().SelectAll();
        String str = JSON.toJSONString(ldi);
        out.print(str);
    }
    //验证登录信息
    else if (opt.equals("checkLogin"))
    {
        //获取提交的用户名和密码
        int role = Integer.parseInt(request.getParameter("role"));
        String loginName = request.getParameter("loginName");
        String loginPwd = request.getParameter("loginPwd");

        //调用Service层的查询方法，查询用户是否存在以及密码是否正确
        UsersInfo usersInfo = new UsersInfoService().login(role, loginName, loginPwd);

        if (usersInfo != null)
        {
            //根据查询到的用户的用户类型ID查询用户类型编号
            DeptsInfo di = new DeptsInfoService().selectById(usersInfo.getDeptsId());
            
            //登陆成功，Session记录用户ID和用户名，并转到用户界面
            session.setAttribute("usersId", usersInfo.getUsersId());
            session.setAttribute("loginName", loginName);
            
            session.setAttribute("deptsCode", di.getDeptsCode());

            response.sendRedirect("myIndex.jsp");
        }
        else
        {
            //登陆失败，请求协议带回错误信息显示在登陆框进行提示
            request.setAttribute("msg", "用户名或密码输入错误！");
            //response.sendRedirect("mySign-in.jsp");
            request.getRequestDispatcher("mySign-in.jsp").forward(request, response);
        }
    }
    //注销清空用户session信息
    else if (opt.equals("cancel"))
    {
        request.getSession().invalidate();
        response.sendRedirect("myIndex.jsp");
    }
%>