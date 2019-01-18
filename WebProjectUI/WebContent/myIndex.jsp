<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目标题</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="content/lib/bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css"
	href="content/stylesheets/theme.css">
<link rel="stylesheet"
	href="content/lib/font-awesome/css/font-awesome.css">

<script src="content/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

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

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<body class="">
	<!--<![endif]-->
	<!-- 标题栏 -->
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
				<li><a href="#"
					class="hidden-phone visible-tablet visible-desktop" role="button">设置</a></li>
				<li id="fat-menu" class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-user"></i> ${loginName}<i class="icon-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="mySign-inDao.jsp?opt=cancel">注销</a></li>
						<li class="divider"></li>
						<!-- 隐藏设置 -->
						<!-- <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
						<li class="divider visible-phone"></li> -->
						<li><a tabindex="-1" href="mySign-inDao.jsp?opt=cancel">退出</a></li>
					</ul></li>

			</ul>
			<a class="brand" href="myIndex.jsp"><span class="first">冠位</span>
				<span class="second">教务管理系统</span></a>
		</div>
	</div>

	<!-- 左菜单栏 -->
	<div class="sidebar-nav">

		<!-- 判断当前登录是否是管理员登录 -->
		<c:if test="${sessionScope.deptsCode == 'system'}">
			<a href="#user-menu" class="nav-header" data-toggle="collapse"><i
				class="icon-dashboard"></i>系统管理 <i class="icon-chevron-up"></i></a>
			<ul id="user-menu" class="nav nav-list collapse in">
				<li><a data-href="content/view/usersInfo/usersInfo.jsp">用户管理</a></li>
				<li><a data-href="content/view/deptsInfo/deptsInfo.jsp">用户类型管理</a></li>
			</ul>
		</c:if>

		<a href="#others" class="nav-header collapsed" data-toggle="collapse"><i
			class="icon-dashboard"></i>教务管理 <i class="icon-chevron-up"></i></a>
		<ul id="others" class="nav nav-list collapse">
			<c:choose>
				<c:when test="${sessionScope.deptsCode == 'student'}">
					<li><a data-href="content/view/selectTC/selectTC.jsp">学生选课</a></li>
				</c:when>
				<c:when test="${sessionScope.deptsCode == 'teacher'}">
					<li><a data-href="content/view/scoreManage/scoreManage.jsp">成绩管理</a></li>
				</c:when>
				<c:when test="${sessionScope.deptsCode == 'system'}">
					<li><a data-href="content/view/scoreManage/scoreManage.jsp">成绩管理</a></li>
					<li><a data-href="content/view/tcourse/tcourse.jsp">课程管理</a></li>
					<li><a data-href="content/view/tcTotal/tcTotal.jsp">选课统计</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>

	<div class="content">
		<div
			style="position: absolute; left: 0px; top: 0px; bottom: 0px; right: 0px; padding: 0px">
			<iframe id="contextFrame" name="contextFrame" src="Welcome.jsp"
				width="100%" height="100%"></iframe>
		</div>
	</div>
	<%
	    //判断Session中是否设置了userId字段
				if (session.getAttribute("usersId") == null) {
					response.sendRedirect("mySign-in.jsp");
				}
	%>

	<!-- request.getSession().removeAttribute("user");//清空session信息
		request.getSession().invalidate();//清除 session 中的所有信息
		//退出登录的时候清空cookie信息,cookie需要通过HttpServletRequest，HttpServletResponse获取
		Cookie[] cookie=request.getCookies();
		for(Cookie c:cookie){
			if("autoLogin".equals(c.getName())){
				c.setMaxAge(0);
				response.addCookie(c);
			}
		} -->


	<script src="content/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});


			// 初始化菜单点击事件
			$(".collapse li").each(function(index) {
				var curUrl = $(this).find("a").attr("data-href");
				$(this).click(function() {
					$("#contextFrame").attr("src", curUrl);
				});

				$(this).css("cursor", "pointer");
			});

		});
	</script>
</body>
</html>