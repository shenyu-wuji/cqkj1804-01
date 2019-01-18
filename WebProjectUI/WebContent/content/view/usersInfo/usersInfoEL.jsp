<%@page import="com.cqkj.bean.PageList"%>
<%@page import="com.cqkj.bean.UsersInfo"%>
<%@page import="com.cqkj.service.UsersInfoService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户管理</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="../../lib/bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css"
	href="../../stylesheets/theme.css">
<link rel="stylesheet"
	href="../../lib/font-awesome/css/font-awesome.css">

<script src="../../lib/jquery-1.7.2.min.js" type="text/javascript"></script>

<!-- Demo page code -->

<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
<body class="">
	<!--<![endif]-->

	<%!//总页码数，用来控制下一页的逻辑功能
	int pageCount;%>

	<%
	    List<UsersInfo> luser = new UsersInfoService().SelectAll();

				//创建PageList对象，用来获取页码，页数，每页的内容
				PageList<UsersInfo> pageList = new PageList();

				int count = 2;

				//判断是否传入页码改变请求
				if (request.getParameter("pageIndex") != null) {
					pageList.setPageIndex(Integer.parseInt(request.getParameter("pageIndex")));

					if (pageCount == pageList.getPageIndex()) {
						count = pageList.getPageIndex();
					} else {
						count = pageList.getPageIndex() + 1;
					}
				}

				//分页查询，按pageList中的页码和大小查询
				new UsersInfoService().selectPage(pageList);
				pageCount = pageList.getPageCount();

				//将要查的某页的内容传给集合对象
				luser = pageList.getData();
	%>


	<div class="header">

		<h1 class="page-title">Users</h1>
	</div>

	<ul class="breadcrumb">
		<li><a data-href="usersInfo.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">用户管理</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnAddUser" class="btn btn-primary">
					<i class="icon-plus"></i> 添加用户
				</button>
				<button class="btn">Import</button>
				<button class="btn">Export</button>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>登录名</th>
							<th>姓名</th>
							<th>性别</th>
							<th>电话</th>
							<th>地址</th>
							<th>创建日期</th>
							<th>操作</th>
							<th style="width: 26px;"></th>
						</tr>
					</thead>
					<tbody>
						<%
						    for (int i = 0, j = 0; i < luser.size(); i++) {
						%>
						<tr>
							<td><%=i + 1 + pageList.getFirstSeq()%></td>
							<td><%=luser.get(i).getLoginName()%></td>
							<td><%=luser.get(i).getName()%></td>
							<td><%=luser.get(i).getSex().equals("y") ? "男" : "女"%></td>
							<td><%=luser.get(i).getPhone()%></td>
							<td><%=luser.get(i).getAddress()%></td>
							<td><%=luser.get(i).getCreateDate().toLocaleString()%></td>
							<td><a
								href="addUsers.jsp?usersId=<%=luser.get(i).getUsersId() %>"><i
									class="icon-pencil">编辑 </i></a> <a href="#myModal"
								detId="<%=luser.get(i).getUsersId()%>" role="button"
								data-toggle="modal"><i class="icon-remove">删除</i></a></td>
						</tr>

						<%
						    }
						%>

					</tbody>
				</table>
			</div>
			<div class="pagination">
				<ul>
					<li><a href="#">页数</a></li>
					<li><a href="usersInfo.jsp?pageIndex=<%=1%>">首页</a></li>
					<%
					    for (int i = 0; i < pageCount; i++) {
					%>
					<li><a href="usersInfo.jsp?pageIndex=<%=i + 1%>"><%=i + 1%></a></li>
					<%
					    }
					%>
					<li><a href="usersInfo.jsp?pageIndex=<%=count%>">下一页</a></li>
					<li><a
						href="usersInfo.jsp?pageIndex=<%=pageList.getPageCount()%>">尾页</a></li>
				</ul>
			</div>

			<div class="modal small hide fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">删除确认</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>确认要删除该用户吗？
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-danger" data-dismiss="modal" id="btnDelete">删除</button>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="inDeleteId" value="" />


	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			// 控制菜单跳转
			$("#btnAddUser").click(function() {
				window.location.href = "addUsers.jsp"
			});

			//删除按钮添加点击事件，为隐藏文本赋值点击对象的ID
			$(".well table tbody td:last-child a:last-child").click(function() {
				$("#inDeleteId").val($(this).attr("detId"));
			});

			//确认删除点击事件，将对象ID传给目标地址
			$("#btnDelete")
					.click(
							function() {
								window.location.href = "usersInfoDo.jsp?opt=delete&usersId="
										+ $("#inDeleteId").val();
							});

		});
	</script>
</body>
</html>