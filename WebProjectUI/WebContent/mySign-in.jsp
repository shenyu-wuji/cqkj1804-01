<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目标题</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="项目描述">
<meta name="author" content="作者">

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

	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">

			</ul>
			<a class="brand" href="myIndex.jsp"><span class="first">冠位</span>
				<span class="second">教务管理系统</span></a>
		</div>
	</div>
	<div class="row-fluid">
		<div class="dialog">
			<div class="block">
				<p class="block-heading">用户登陆</p>
				<div class="block-body">
					<form id="form1" method="post" action="mySign-inDao.jsp?opt=checkLogin">
						<label>角色</label><select name="role" id="role"
							class="span12">
						</select> <label>用户名</label> <input type="text" id="loginName"
							name="loginName" class="span12"> <label>密码</label><input
							type="password" id="loginPwd" name="loginPwd" class="span12">
						<span id="nameTips" style="display: none; color: red;">用户名不能为空</span>
						<span id="pwdTips" style="display: none; color: red;">密码不能为空</span>
						<span id="error" style="color: red;"><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></span>
						<a class="btn btn-primary pull-right" id="btnLogin">登陆</a>
						<div class="clearfix"></div>
					</form>
				</div>
			</div>
		</div>
	</div>





	<script src="content/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
			
			loginRole();

			//给登陆按钮添加点击事件
			$("#btnLogin").click(loginClick);

		});
		
		function loginClick(){
			//用户名为空
			if ($.trim($("#loginName").val()) == "") {
				//显示用户名空值提示，隐藏错误提示和密码空值提示，用户名文本框获取焦点
				$("#nameTips").css("display", "inline");
				$("#pwdTips").css("display", "none");
				$("#error").text("");
				$("#loginName").focus();
			} else if ($.trim($("#loginPwd").val()) == "") {
				//显示密码空值提示，隐藏错误提示和用户名空值提示，密码文本框获取焦点
				$("#pwdTips").css("display", "inline");
				$("#nameTips").css("display", "none");
				$("#error").text("");
				$("#loginPwd").focus();
			} else {
				//提交表单，隐藏空值提示
				$("#nameTips").css("display", "none");
				$("#pwdTips").css("display", "none");
				$("#form1").submit();
			}
		};
		
		//部门复选框动态生成部门
		function loginRole(){$.ajax({
			//地址
			url : "mySign-inDao.jsp",
			type : "post", //提交方式
			data : {
				"opt" : "loginRole"
			//提交值jaxaName：文本框的val()
			},
			dataType : "json", //json方式，传回json对象数据
			success : function(data) { //接收data返回值并进行数据处理
				var role = $("#role");
				for (var i = data.length - 1; i >= 0; i--) {
					//select标签中添加部门下拉框
						role.append("<option value='" + data[i].deptsId + "'>"
										+ data[i].deptsName
										+ "</option>");
				}
			}
		});
		}
		
	</script>

</body>
</html>