<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cqkj.service.DeptsInfoService"%>
<%@page import="com.cqkj.bean.DeptsInfo"%>
<%@page import="java.util.List"%><%@page import="java.util.Date"%><%@page
	import="com.cqkj.service.UsersInfoService"%><%@page
	import="com.cqkj.bean.UsersInfo"%><%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String opt = request.getParameter("opt");

    if (opt.equals("delete"))
    {
        //获取删除对象主键ID
        String usersId = request.getParameter("usersId");

        //执行删除功能
        new UsersInfoService().isDelUsersInfo(Integer.parseInt(usersId));

        response.sendRedirect("usersInfo.jsp");
    }
    else if (opt.equals("add"))
    {
        //获取提交的用户名信息
        int deptsId = Integer.parseInt(request.getParameter("deptsId"));
        String loginName = request.getParameter("loginName");
        String loginPwd = request.getParameter("loginPwd");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        int age = Integer.parseInt(request.getParameter("age"));
        String phone = request.getParameter("phone");
        String idCard = request.getParameter("idCard");
        String weChat = request.getParameter("weChat");
        String address = request.getParameter("address");
        Date createDate = new Date();
        int createUser = Integer.parseInt(session.getAttribute("usersId").toString());
        Date lastUpdateDate = new Date();
        int lastUpdateUser = Integer.parseInt(session.getAttribute("usersId").toString());

        //创建用户对象，传入提交的数据
        UsersInfo usersInfo = new UsersInfo(deptsId, loginName, loginPwd, name, sex, age, phone, idCard, weChat,
                address, createDate, createUser, lastUpdateDate, lastUpdateUser);
        int flag = new UsersInfoService().AddUsersInfo(usersInfo);

        if (flag != 0)
        {
            //登陆成功，Session记录用户ID和用户名，并转到用户界面
            response.sendRedirect("usersInfo.jsp");
        }
        else
        {
            response.sendRedirect("addUsers.jsp");
        }
    }
    else if (opt.equals("update"))
    {
        UsersInfo ui = new UsersInfo();
        //获取提交的用户名信息
        ui.setUsersId(Integer.parseInt(request.getParameter("usersId")));
        ui.setDeptsId(Integer.parseInt(request.getParameter("deptsId")));
        ui.setLoginName(request.getParameter("loginName"));
        ui.setLoginPwd(request.getParameter("loginPwd"));
        ui.setName(request.getParameter("name"));
        ui.setSex(request.getParameter("sex"));
        ui.setAge(Integer.parseInt(request.getParameter("age")));
        ui.setPhone(request.getParameter("phone"));
        ui.setIdCard(request.getParameter("idCard"));
        ui.setWeChat(request.getParameter("weChat"));
        ui.setAddress(request.getParameter("address"));
        ui.setCreateUser(Integer.parseInt(request.getParameter("createUser")));

        ui.setCreateDate(new Date(Long.parseLong(request.getParameter("createDate"))));

        ui.setLastUpdateDate(new Date());
        ui.setLastUpdateUser(Integer.parseInt(session.getAttribute("usersId").toString()));

        int flag = new UsersInfoService().updUsersInfo(ui);

        if (flag != 0)
        {
            //登陆成功，Session记录用户ID和用户名，并转到用户界面
            response.sendRedirect("usersInfo.jsp");
        }
        else
        {
            response.sendRedirect("addUsers.jsp");
        }
    }
    else if (opt.equals("ajaxName"))
    {
        String jaxaName = request.getParameter("jaxaName");

        boolean flag = new UsersInfoService().selectByLoginName(jaxaName);

        if (flag)
        {
            out.print("{\"loginName\":\"1\"}");
        }
        else
        {
            out.print("{\"loginName\":\"0\"}");
        }
    }
    else if (opt.equals("deptsInfo"))
    {
        //创建集合保存所有部门的信息
        List<DeptsInfo> ldi = new DeptsInfoService().SelectAll();
        String str = JSON.toJSONString(ldi);
        out.print(str);
        //拼接json数组
        /* str.append("[");
        for (DeptsInfo d : ldi)
        {
            str.append("{\"Id\":\"").append(d.getDeptsId()).append("\",");
            str.append("\"deptsName\":\"").append(d.getDeptsName()).append("\"},");
        }
        str.deleteCharAt(str.length() - 1);
        str.append("]");
        out.print(str.toString()); */

    }
%>