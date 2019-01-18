<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>选课统计</title>
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
	<div class="header">

		<h1 class="page-title">${sessionScope.deptsCode}</h1>
	</div>

	<ul class="breadcrumb">
		<li><a data-href="tcTotal.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">选课统计</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<span class="btn btn-primary"> <i
					class="plus"></i> 学生:
				</span> <select id="student" style="margin:0px 10px;">
				
				</select>
				
				<a class="btn" id="selectTC" href="#" role="button" data-toggle="modal">查询</a>
				<span class="btn btn-primary" style="margin:0px 20px 0px 100px;">总分为:</span>
				<span id="spScore" class="btn">0</span>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>课程编号</th>
							<th>课程名称</th>
							<th>成绩</th>
							<th style="width: 26px;"></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
			<div class="pagination">
				<ul>
				</ul>
			</div>

		</div>
	</div>

	<input type="hidden" id="usersId" value="${sessionScope.usersId }" />
	<input type="hidden" id="inDeleteId" value="" />


	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
			
			//刷新学生选框
			selectStudent();
			
			//学生复选框失去焦点触发课程复习复选框
			$("#selectTC").click(selectMsg);
			
			//确认保存点击事件
			$("#btnDelete").click();

		});
		
		//查询学生所选课程成绩信息
		function selectMsg() {
			$.ajax({
						//地址
						url : "tcTotalDo.jsp",
						type : "post", //提交方式
						data : {
							"opt" : "selectMsg",
							"usersId" : $("#student").val()
						//提交值jaxaName：文本框的val()
						},
						dataType : "json", //json方式，传回json对象数据
						success : function(datas) { //接收data返回值并进行数据处理
							var tcou = $(".table tbody");
							var str = "";
							var scoreTotal = 0;
							for (var i = 0; i < datas.data.length; i++) {
								str = str + "<tr><td>";
								str = str + (i + 1)  + '</td><td>';
								str = str + datas.data[i].cNo + '</td><td>';
								str = str + datas.data[i].cName + '</td><td>';
								str = str + datas.score[i] + '</td></tr>';
								scoreTotal = scoreTotal + datas.score[i];
							}
							tcou.text("");
							tcou.append(str);
							$("#spScore").text(scoreTotal);
						}
					});
		}
		
		//查询所有学生的信息
		function selectStudent() {
			$.ajax({
				//地址
				url : "tcTotalDo.jsp",
				type : "post", //提交方式
				data : {
					"opt" : "selectStudent"
				//提交值jaxaName：文本框的val()
				},
				dataType : "json", //json方式，传回json对象数据
				success : function(data) { //接收data返回值并进行数据处理
					var stu = $("#student");
					var str = "";
					stu.text("");
					stu.append("<option value='0'>--请选择--</option>");
					for (var i = 0; i < data.length; i++) {
						
						//select标签中添加部门下拉框
							stu.append("<option value='" + data[i].usersId + "'>"+ data[i].loginName+":" +data[i].name+ "</option>");
					}
				}
			});
		}
	</script>
</body>
</html>