<%@page import="com.cqkj.service.DeptsInfoService"%>
<%@page import="com.cqkj.bean.DeptsInfo"%>
<%@page import="java.rmi.server.UID"%>
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
				String deptsId = request.getParameter("deptsId");

				DeptsInfo di = null;
				if (deptsId != null) {

					di = new DeptsInfoService().selectById(Integer.parseInt(deptsId));
				}
	%>

	<div class="header">

		<h1 class="page-title">用户类型编辑</h1>
	</div>

	<ul class="breadcrumb">
		<li><a data-href="deptsInfo.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li><a href="deptsInfo.jsp">用户类型管理</a> <span class="divider">/</span>
		</li>
		<li class="active">用户类型编辑</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnRefer" class="btn btn-primary">
					<i class="icon-save"></i> 提交
				</button>
				<a href="deptsInfo.jsp" class="btn">取消</a>

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
							action="deptsInfoDo.jsp?opt=<%=di != null ? "update" : "add"%>&deptsId=<%=di != null ? di.getDeptsId(): ""%>">
							<label>用户类型编号<span style="color: red">*</span></label> <input
								type="text" name="deptsCode" id="deptsCode"
								value="<%=di != null ? di.getDeptsCode() : ""%>"
								class="input-xlarge"> <span id="deptsCodeTips"
								style="display: inline-block;"></span><label>用户类型名称<span
								style="color: red">*</span></label> <input type="text" name="deptsName"
								id="deptsName" value="<%=di != null ? di.getDeptsName() : ""%>"
								class="input-xlarge"><span id="deptsNameTips"
								style="display: inline-block;"></span>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>


	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		
		var count = 0;
		var veg = /^\S*$/;
		var depCode =<%=di != null ? "\"" + di.getDeptsCode() + "\"" : "\"\""%>;
		
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
			
			$("#deptsCode").blur(function() {
				//用户名为空格不进行判断
				if ($.trim($(this).val()) != "") {
					$.ajax({
						//地址
						url : "deptsInfoDo.jsp?opt=ajaxCode",
						type : "post", //提交方式
						data : {
									"deCode" : $.trim($(this).val())   //提交值jaxaName：文本框的val()
							},
						dataType : "json", //json方式，传回json对象数据
						success : function(data) { //接收data返回值并进行数据处理
									//为编辑多加一个判断，如果用户名和编辑对象的用户名相同，则符合规格
									if (data.deptsCode == "1" && $("#deptsCode").val() != depCode) {
										$("#deptsCodeTips").css("color","red");
										$("#deptsCodeTips").text("该编号已被使用");
										count = 1;
									} 
									else {
										//用户名不满足正则表达式
										if(!veg.test( $("#deptsCode").val()))
										{
											$("#deptsCodeTips").css("color","red");
											$("#deptsCodeTips").text("编号命名不符合规格,不可以使用空格");
											count = 1;
										}
										else
										{
											$("#deptsCodeTips").css("color","green");
											$("#deptsCodeTips").text("符合规格");
											count = 0;
										}
									}
												}
							});
					}
			});

			//提交按钮点击事件
			$("#btnRefer").click(function() {
				if (count == 0) {
				//部门编号为空
				if ($("#deptsCode").val() == "") {
					//显示用户名空值提示，隐藏错误提示和密码空值提示，用户名文本框获取焦点
					$("#deptsCodeTips").css("color","red");
					$("#deptsCodeTips").text("用户类型编号不能为空");
					$("#deptsNameTips").text("");
					$("#deptsCode").focus();
				} else if ($("#deptsName").val() == "") {
					//显示密码空值提示，隐藏错误提示和用户名空值提示，密码文本框获取焦点
					$("#deptsNameTips").css("color","red");
					$("#deptsNameTips").text("用户类型名称不能为空");
					$("#deptsCodeTips").text("");
					$("#deptsName").focus();
				} else {
					$("#tab").submit();
				}
				}
			});
			
		});
	</script>
</body>
</html>