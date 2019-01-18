<%@page import="com.cqkj.service.TCourseService"%>
<%@page import="com.cqkj.bean.TCourse"%>
<%@page import="java.rmi.server.UID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理</title>
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
				String cId = request.getParameter("cId");

				TCourse cou = null;
				if (cId != null) {

					cou = new TCourseService().selectById(Integer.parseInt(cId));
				}
	%>

	<div class="header">

		<h1 class="page-title">课程编辑</h1>
	</div>

	<ul class="breadcrumb">
		<li><a data-href="tcourse.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li><a href="tcourse.jsp">课程管理</a> <span class="divider">/</span>
		</li>
		<li class="active">课程编辑</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnRefer" class="btn btn-primary">
					<i class="icon-save"></i> 提交
				</button>
				<a href="tcourse.jsp" class="btn">取消</a>

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
							action="tcourseDo.jsp?opt=<%=cou != null ? "update" : "add"%>">
							<label>部门</label> <label> 课程编号 <span style="color: red">*</span>
							</label> <input type="text" name="cNo" id="cNo"
								value='<%=cou != null ? cou.getcNo() : ""%>'
								class="input-xlarge"><span id="cNoTips"></span> <label>
								课程名称 <span style="color: red">*</span>
							</label> <input type="text" name="cName" id="cName"
								value="<%=cou != null ? cou.getcName() : ""%>"
								class="input-xlarge"> <span id="cNameTips"></span>
								<input
								type="hidden" name="createDate"
								value="<%=cou != null ? cou.getCreateDate().getTime() : ""%>" />
								<input
								type="hidden" name="cId"
								value="<%=cou != null ? cou.getcId() : ""%>" />
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>

	<input type="hidden" id="checkID"
		value="<%=cou != null ? cou.getcId() : ""%>" />

	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();

		var tcNo =<%=cou != null ? "\"" + cou.getcNo() + "\"" : "\"\""%>;
		var count = 0;
		var veg = /^\S*$/;

		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			//ajax，判断用户名是否符合规格
			$("#cNo").blur(checkcNo);

			//提交按钮点击事件
			$("#btnRefer").click(checkNull);

		});

		//检验课程编号是否符合规格
		function checkcNo() {
			//用户名为空格不进行判断
			if ($.trim($(this).val()) != "") {
				$.ajax({
					//地址
					url : "tcourseDo.jsp?opt=checkcNo",
					type : "post", //提交方式
					data : {
						"cNo" : $(this).val()
					//提交值jaxaName：文本框的val()
					},
					dataType : "json", //json方式，传回json对象数据
					success : function(data) { //接收data返回值并进行数据处理
						//为编辑多加一个判断，如果用户名和编辑对象的用户名相同，则符合规格
						if (data.cNo == "1" && $("#cNo").val() != tcNo) {
							$("#cNoTips").css("color", "red");
							$("#cNoTips").text("该课程编号已被使用");
							count = 1;
						} else {
							//用户名不满足正则表达式
							if (!veg.test($("#cNo").val())) {
								$("#cNoTips").css("color", "red");
								$("#cNoTips").text("课程编号不符合规格,不可以使用空格");
								count = 1;
							} else {
								$("#cNoTips").css("color", "green");
								$("#cNoTips").text("符合规格");
								count = 0;
							}
						}
					}
				});
			}
		}

		function checkNull() {
			//提交按钮点击事件
			if (count == 0) {
				//部门编号为空
				if ($.trim($("#cNo").val()) == "") {
					//显示用户名空值提示，隐藏错误提示和密码空值提示，用户名文本框获取焦点
					$("#cNoTips").css("color", "red");
					$("#cNoTips").text("课程编号不能为空");
					$("#cNameTips").text("");
					$("#cNo").focus();
				} else if ($.trim($("#cName").val()) == "") {
					//显示密码空值提示，隐藏错误提示和用户名空值提示，密码文本框获取焦点
					$("#cNameTips").css("color", "red");
					$("#cNameTips").text("课程名称不能为空");
					$("#cNoTips").text("");
					$("#cName").focus();
				} else {
					$("#tab").submit();
				}
			}
		}
	</script>
</body>
</html>