<%@page import="java.rmi.server.UID"%>
<%@page import="com.cqkj.bean.UsersInfo"%>
<%@page import="com.cqkj.service.UsersInfoService"%>
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

	<%
	    //接收字符串，如果不为空，代表编辑功能，为空代表新增功能
				String usersId = request.getParameter("usersId");

				UsersInfo ui = null;
				if (usersId != null) {

					ui = new UsersInfoService().selectById(Integer.parseInt(usersId));
				}
	%>

	<div class="header">

		<h1 class="page-title">用户编辑</h1>
	</div>

	<ul class="breadcrumb">
		<li><a data-href="usersInfo.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li><a href="usersInfo.jsp">用户管理</a> <span class="divider">/</span>
		</li>
		<li class="active">用户编辑</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnRefer" class="btn btn-primary">
					<i class="icon-save"></i> 提交
				</button>
				<a href="usersInfo.jsp" class="btn">取消</a>

				<div class="btn-group"></div>
			</div>
			<div class="well">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">信息表单</a>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<form id="tab" method="post"
							action="usersInfoDo.jsp?opt=<%=ui != null ? "update" : "add"%>">
							<label>部门</label> <select name="deptsId" id="deptsId"
								class="input-xlarge">
								<option value="">-请选择-</option>
								<%-- <option value="1"
									<%=ui != null ? ui.getDeptsId() == 1 ? "selected" : "" : ""%>>航空部</option>
								<option value="2"
									<%=ui != null ? ui.getDeptsId() == 2 ? "selected" : "" : ""%>>装备部</option> --%>
							</select> <label> 用户名 <span style="color: red">*</span>
							</label> <input type="text" name="loginName" id="loginName"
								value='<%=ui != null ? ui.getLoginName() : ""%>'
								class="input-xlarge"><span id="jaxaLoginName"></span> <span
								id="usersNameTips" style="display: none; color: red;">（用户名不能为空）</span>
							<label> 登录密码 <span style="color: red">*</span>
							</label> <input type="text" name="loginPwd" id="loginPwd"
								value="<%=ui != null ? ui.getLoginPwd() : ""%>"
								class="input-xlarge"> <span id="pwdTips"
								style="display: none; color: red;">（密码不能为空）</span> <label>
								姓名 <span style="color: red">*</span>
							</label> <input type="text" name="name" id="name"
								value="<%=ui != null ? ui.getName() : ""%>" class="input-xlarge">
							<span id="nameTips" style="display: none; color: red;">（姓名不能为空）</span>
							<label>性别</label> <select name="sex" id="sex"
								class="input-xlarge">
								<option value="y"
									<%=ui != null ? ui.getSex().equals("y") ? "selected" : "" : ""%>>男</option>
								<option value="x"
									<%=ui != null ? ui.getSex().equals("x") ? "selected" : "" : ""%>>女</option>
							</select> <label>年龄</label> <select name="age" id="age"
								class="input-xlarge">
								<%
								    for (int i = 1; i < 151; i++) {
												if (i == 20) {
								%>
								<option selected="selected" value="<%=i%>"><%=i%></option>
								<%
								    } else {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
								    }
											}
								%>
							</select> <label>手机号</label> <input type="text" name="phone"
								value="<%=ui != null ? ui.getPhone() : ""%>"
								class="input-xlarge"> <label>身份证号<span
								style="color: red">*</span></label> <input type="text" name="idCard" id="idCard"
								value="<%=ui != null ? ui.getIdCard() : ""%>"
								class="input-xlarge"> <span id="idCardTips"
								style="display: inline-block; color: red;"></span> <label>微信号</label>
							<input type="text" name="weChat"
								value="<%=ui != null ? ui.getWeChat() : ""%>"
								class="input-xlarge"> <label>住址</label> <input
								type="text" name="address"
								value="<%=ui != null ? ui.getAddress() : ""%>"
								class="input-xlarge"> <input type="hidden"
								name="usersId" value="<%=ui != null ? ui.getUsersId() : ""%>" />
							<input type="hidden" name="createUser"
								value="<%=ui != null ? ui.getCreateUser() : ""%>" /> <input
								type="hidden" name="createDate"
								value="<%=ui != null ? ui.getCreateDate().getTime() : ""%>" />
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>
	<input type="hidden" id="checkID"
		value="<%=ui != null ? ui.getDeptsId() : ""%>" />

	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();

		var depName =<%=ui != null ? "\"" + ui.getLoginName() + "\"" : "\"\""%>;
		var count = 0;
		var veg = /^\S*$/;
		var vg = /^((\d{15})|(^\d{17}(\d|X|x)))$/;

		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			//部门复选框动态生成部门
			proDepts();

			//ajax，判断用户名是否符合规格
			$("#loginName").blur(function() {
				//用户名为空格不进行判断
				if ($.trim($(this).val()) != "") {
					$.ajax({
						//url : "jaxaUsersInfo.jsp",  //地址
						url : "usersInfoDo.jsp?opt=ajaxName",
						type : "post", //提交方式
						data : {
									"jaxaName" : $.trim($(this).val())   //提交值jaxaName：文本框的val()
							},
						dataType : "json", //json方式，传回json对象数据
						success : function(data) { //接收data返回值并进行数据处理
									//为编辑多加一个判断，如果用户名和编辑对象的用户名相同，则符合规格
									if (data.loginName == "1" && $("#loginName").val() != depName) {
										$("#jaxaLoginName").css("color","red");
										$("#jaxaLoginName").text("该用户已被注册");
										count = 1;
									} 
									else {
										//用户名不满足正则表达式
										if(!veg.test( $("#loginName").val()))
										{
											$("#jaxaLoginName").css("color","red");
											$("#jaxaLoginName").text("用户名不符合规格,不可以使用空格");
											count = 1;
										}
										else
										{
											$("#jaxaLoginName").css("color","green");
											$("#jaxaLoginName").text("符合规格");
											count = 0;
										}
									}
									$("#usersNameTips").css("display", "none");
												}
							});
					}
			});

			//提交按钮点击事件
			$("#btnRefer").click(function() {
				
				//用户名为空
				if (count == 0) {
					if ($.trim($("#loginName").val()) == "") {
						//显示用户名空值提示，隐藏错误提示和密码空值提示，用户名文本框获取焦点
						$("#usersNameTips").css("display", "inline-block");
						$("#pwdTips").css("display", "none");
						$("#nameTips").css("display", "none");
						$("#jaxaLoginName").text("");
						$("#loginName").focus();
					} else if ($.trim($("#loginPwd").val()) == "") {
						//显示密码空值提示，隐藏错误提示和用户名空值提示，密码文本框获取焦点
						$("#pwdTips").css("display", "inline-block");
						$("#usersNameTips").css("display", "none");
						$("#nameTips").css("display", "none");
						$("#loginPwd").focus();
					} else if ($.trim($("#name").val()) == "") {
						$("#nameTips").css("display", "inline-block");
						$("#usersNameTips").css("display", "none");
						$("#pwdTips").css("display", "none");
						$("#name").focus();
					}
					else if (!vg.test($.trim($("#idCard").val()))) {
						$("#idCardTips").text("身份证不符合规格");
						$("#idCard").focus();
					}else {
						$("#tab").submit();
					}
				}
			});
		});
		
		//部门复选框动态生成部门
		function proDepts(){$.ajax({
			//地址
			url : "usersInfoDo.jsp",
			type : "post", //提交方式
			data : {
				"opt" : "deptsInfo"
			//提交值jaxaName：文本框的val()
			},
			dataType : "json", //json方式，传回json对象数据
			success : function(data) { //接收data返回值并进行数据处理
				var deptsId = $("#deptsId");
				for (var i = 0; i < data.length; i++) {
					//select标签中添加部门下拉框
						deptsId.append("<option value='" + data[i].deptsId + "'>"
										+ data[i].deptsName
										+ "</option>");
				}
				//为编辑功能中的部门复选框添加默认值：选中对象的部门
				if(<%=ui != null ? true : false%>)
				{
					deptsId.find("option[value='<%=ui != null ? ui.getDeptsId() : ""%>']").attr("selected", "true");
				}

						}
					});
		}
	</script>
</body>
</html>