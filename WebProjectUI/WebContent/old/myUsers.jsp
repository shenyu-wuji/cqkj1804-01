<%@page import="com.cqkj.service.StudentService"%>
<%@page import="com.cqkj.bean.Student"%>
<%@page import="com.cqkj.dao.impl.oracle.StudentDaoImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Bootstrap Admin</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="../content/lib/bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="../content/stylesheets/theme.css">
<link rel="stylesheet" href="../content/lib/font-awesome/css/font-awesome.css">

<script src="../content/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

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


	<%!
	List<Student> lstu = new StudentService().SelectAll();
	%>


	<div class="header">

		<h1 class="page-title">Users</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="../myIndex.jsp" target="_top">Home</a> <span
			class="divider">/</span></li>
		<li class="active">Users</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnAddUser" class="btn btn-primary">
					<i class="icon-plus"></i> New User
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
							<th>学生ID</th>
							<th>学号</th>
							<th>姓名</th>
							<th style="width: 26px;"></th>
						</tr>
					</thead>
					<tbody>
					<%
						for(int i = 0; i < 8;i++)
						{ 
					%>
						    <tr>
							<td><%=i+1 %></td>
							<td><%=lstu.get(i).getStuId() %></td>
							<td><%=lstu.get(i).getStuNo() %></td>
							<td><%=lstu.get(i).getStuName() %></td>
							<td><a href="myUser.jsp"><i class="icon-pencil"></i></a> <a
								href="#myModal" role="button" data-toggle="modal"><i
									class="icon-remove"></i></a></td>
							</tr> 
					<%	}
					%>
						<%-- <tr>
							<td>1</td>
							<td><%=lstu.get(0).getStuId() %></td>
							<td><%=lstu.get(0).getStuNo() %></td>
							<td><%=lstu.get(0).getStuName() %></td>
							<td><a href="user.html"><i class="icon-pencil"></i></a> <a
								href="#myModal" role="button" data-toggle="modal"><i
									class="icon-remove"></i></a></td>
						</tr>
						<tr>
							<td>2</td>
							<td><%=lstu.get(1).getStuId() %></td>
							<td><%=lstu.get(1).getStuNo() %></td>
							<td><%=lstu.get(1).getStuName() %></td>
							<td><a href="user.html"><i class="icon-pencil"></i></a> <a
								href="#myModal" role="button" data-toggle="modal"><i
									class="icon-remove"></i></a></td>
						</tr>
						<tr>
							<td>3</td>
							<td><%=lstu.get(2).getStuId() %></td>
							<td><%=lstu.get(2).getStuNo() %></td>
							<td><%=lstu.get(2).getStuName() %></td>
							<td><a href="user.html"><i class="icon-pencil"></i></a> <a
								href="#myModal" role="button" data-toggle="modal"><i
									class="icon-remove"></i></a></td>
						</tr>
						<tr>
							<td>4</td>
							<td><%=lstu.get(3).getStuId() %></td>
							<td><%=lstu.get(3).getStuNo() %></td>
							<td><%=lstu.get(3).getStuName() %></td>
							<td><a href="user.html"><i class="icon-pencil"></i></a> <a
								href="#myModal" role="button" data-toggle="modal"><i
									class="icon-remove"></i></a></td>
						</tr>
						<tr>
							<td>5</td>
							<td><%=lstu.get(4).getStuId() %></td>
							<td><%=lstu.get(4).getStuNo() %></td>
							<td><%=lstu.get(4).getStuName() %></td>
							<td><a href="user.html"><i class="icon-pencil"></i></a> <a
								href="#myModal" role="button" data-toggle="modal"><i
									class="icon-remove"></i></a></td>
						</tr>
						<tr>
							<td>6</td>
							<td><%=lstu.get(5).getStuId() %></td>
							<td><%=lstu.get(5).getStuNo() %></td>
							<td><%=lstu.get(5).getStuName() %></td>
							<td><a href="user.html"><i class="icon-pencil"></i></a> <a
								href="#myModal" role="button" data-toggle="modal"><i
									class="icon-remove"></i></a></td>
						</tr> --%>
					</tbody>
				</table>
			</div>
			<div class="pagination">
				<ul>
					<li><a href="#">Prev</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>

			<div class="modal small hide fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">Delete Confirmation</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>Are you sure you want
						to delete the user?
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
					<button class="btn btn-danger" data-dismiss="modal">Delete</button>
				</div>
			</div>



			<footer>
				<hr>

				<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
				<p class="pull-right">
					A <a href="http://www.portnine.com/bootstrap-themes"
						target="_blank">Free Bootstrap Theme</a> by <a
						href="http://www.portnine.com" target="_blank">Portnine</a>
				</p>

				<p>
					&copy; 2012 <a href="http://www.portnine.com" target="_blank">Portnine</a>
				</p>
			</footer>

		</div>
	</div>




	<script src="../content/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
			
			// 控制菜单跳转
			$("#btnAddUser").click(function(){
				window.location.href="myUser.jsp"
			});
		});
	</script>
</body>
</html>