<%@page import="com.cqkj.bean.TCourse"%>
<%@page import="com.cqkj.service.TCourseService"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>学生选课</title>
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
		<li><a data-href="selectTC.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">学生选课</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<span class="btn btn-primary"> <i
					class="icon-plus"></i> 课程名称:
				</span> <select id="unSelectTC" style="margin:0px 10px;">
				
				</select>
				<a class="btn" id="selectTC" href="#selModal" role="button" data-toggle="modal">选课</a>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>课程 编号</th>
							<th>课程名称</th>
							<th>选课时间</th>
							<th>成绩</th>
							<th>操作</th>
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

			<div class="modal small hide fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">取消选课确认</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>确定要取消选修课程吗？
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-danger" data-dismiss="modal" id="btnDelete">确认</button>
				</div>
			</div>
			
			<div class="modal small hide fade" id="selModal" tabindex="-1"
				role="dialog" aria-labelledby="selModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="selModalLabel">选课确认</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>确定要选修该课程吗？
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-danger" data-dismiss="modal" id="btnSelect">确认</button>
				</div>
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
			
			select();

			selectUnTC(); 

			//选课确认点击事件
			$("#btnSelect").click(selectTC);

			//确认删除点击事件
			$("#btnDelete").click(deleteTC);

		});
		
		//选课添加点击事件
		function deleteTC() {
			$.ajax({
						//地址
						url : "selectTCDo.jsp",
						type : "post", //提交方式
						data : {
							"opt" : "deleteTC",
							"scId" : $(".well table tbody td:last-child a:last-child").attr("detId"),
							"usersId" : $("#usersId").val()
						//提交值jaxaName：文本框的val()
						},
						dataType : "json", //json方式，传回json对象数据
						success : function(data) { //接收data返回值并进行数据处理
							if (data.msg == "OK") {
								selectUnTC(); 
								select();
							} else {
								alert(data.msg);
							}
						},
						error:function()
						{
							alert("删除选课失败了！！！！！");
						}
						
					})
		}
		
		//选课添加点击事件
		function selectTC() {
			$.ajax({
						//地址
						url : "selectTCDo.jsp",
						type : "post", //提交方式
						data : {
							"opt" : "selectTC",
							"cId" : $("#unSelectTC").val(),
							"usersId" : $("#usersId").val()
						//提交值jaxaName：文本框的val()
						},
						dataType : "json", //json方式，传回json对象数据
						success : function(data) { //接收data返回值并进行数据处理
							if (data.msg == "OK") {
								//windows.location.href = "selectTC.jsp";
								selectUnTC(); 
								select();
							} else {
								alert(data.msg);
							}
						},
						error:function()
						{
							alert("请选择课程");
						}
						
					})
		}
		
		//异步查询刷新所选课程信息
		function select() {
			$.ajax({
						//地址
						url : "selectTCDo.jsp",
						type : "post", //提交方式
						data : {
							"opt" : "select",
							"usersId" : $("#usersId").val()
						//提交值jaxaName：文本框的val()
						},
						dataType : "json", //json方式，传回json对象数据
						success : function(datas) { //接收data返回值并进行数据处理
							var tcou = $(".table tbody");
							var str = "";
							for (var i = 0; i < datas.data.length; i++) {
								str = str + "<tr><td>";
								str = str + (i + 1)  + '</td><td>';
								str = str + datas.data[i].cNo + '</td><td>';
								str = str + datas.data[i].cName + '</td><td>';
								str = str + datas.data[i].createDate + '</td><td>';
								str = str + datas.score[i] + '</td><td>';
								str = str
										+ '<a href="#myModal" role="button" data-toggle="modal" detId="'+ datas.foreign[i] + '"><i class="icon-pencil">取消</i></a>';
								str = str + "</td></tr>";
							}
							tcou.text("");
							tcou.append(str);

							//删除按钮添加点击事件，为隐藏文本赋值点击对象的ID
							$(".well table tbody td:last-child a:last-child").click(function() {
												$("#inDeleteId").val($(this).attr("detId"));
											});
						}
					})
		}


		//异步查询刷新该学生未选课程信息
		function selectUnTC() {
			$.ajax({
						//地址
						url : "selectTCDo.jsp",
						type : "post", //提交方式
						data : {
							"opt" : "selectUnTC",
							"usersId" : $("#usersId").val()
						//提交值jaxaName：文本框的val()
						},
						dataType : "json", //json方式，传回json对象数据
						success : function(data) { //接收data返回值并进行数据处理
							var sel = $("#unSelectTC");
							var str = "";
							sel.text("");
							sel.append("<option value=''>--请选择--</option>");
							for (var i = 0; i < data.length; i++) {
								
								//select标签中添加部门下拉框
									sel.append("<option value='" + data[i].cId + "'>"+ data[i].cName+ "</option>");
							}
							
						}
					});
		}
	</script>
</body>
</html>