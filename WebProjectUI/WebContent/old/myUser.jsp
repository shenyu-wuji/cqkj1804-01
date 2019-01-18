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



	<div class="header">

		<h1 class="page-title">Edit User</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="../myIindex.jsp">Home</a> <span class="divider">/</span></li>
		<li><a href="myUsers.jsp">Users</a> <span class="divider">/</span></li>
		<li class="active">User</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button class="btn btn-primary">
					<i class="icon-save"></i> Save
				</button>
				<a href="#myModal" data-toggle="modal" class="btn">Delete</a>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
					<li><a href="#profile" data-toggle="tab">Password</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<form id="tab">
							<label>姓名</label> <input type="text" value="呆"
								class="input-xlarge"> <label>学号 </label> <input
								type="text" value="S1000" class="input-xlarge"> <label>性别</label>
							<input type="text" value="男" class="input-xlarge"> <label>年龄</label>
							<select name="DropDownTimezone" id="DropDownTimezone"
								class="input-xlarge">
								<option value="-12.0">10</option>
								<option value="-11.0">11</option>
								<option value="-10.0">12</option>
								<option value="-9.0">13</option>
								<option selected="selected" value="-8.0">14</option>
								<option value="-7.0">15</option>
								<option value="-6.0">16</option>
								<option value="-5.0">17</option>
								<option value="-4.0">18</option>
								<option value="-3.5">19</option>
								<option value="-3.0">20</option>
								<option value="-2.0">21</option>
								<option value="-1.0">22</option>
								<option value="0.0">23</option>
								<option value="1.0">24</option>
								<option value="2.0">25</option>
								<option value="3.0">26</option>
								<option value="3.5">27</option>
								<option value="4.0">28</option>
								<option value="4.5">29</option>
								<option value="5.0">30</option>
								<option value="5.5">31</option>
								<option value="5.75">32</option>
								<option value="6.0">33</option>
								<option value="7.0">34</option>
								<option value="8.0">35</option>
								<option value="9.0">36</option>
								<option value="9.5">37</option>
								<option value="10.0">38</option>
								<option value="11.0">39</option>
								<option value="12.0">40</option>
							</select>
						</form>
					</div>
					<div class="tab-pane fade" id="profile">
						<form id="tab2">
							<label>New Password</label> <input type="password"
								class="input-xlarge">
							<div>
								<button class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>

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
				A <a href="http://www.portnine.com/bootstrap-themes" target="_blank">Free
					Bootstrap Theme</a> by <a href="http://www.portnine.com"
					target="_blank">Portnine</a>
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
		});
	</script>
</body>
</html>