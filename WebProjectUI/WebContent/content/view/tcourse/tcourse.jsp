<%@page import="com.cqkj.bean.TCourse"%>
<%@page import="com.cqkj.service.TCourseService"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

	<div class="header">

		<h1 class="page-title">${sessionScope.deptsCode}</h1>
	</div>

	<ul class="breadcrumb">
		<li><a data-href="usersInfo.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">课程管理</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnAddUser" class="btn btn-primary">
					<i class="icon-plus"></i> 添加课程
				</button>
				<input id="TCmsg" class="xLager" style="margin:0px 10px;" value="" ></input>
				<button class="btn" id="selectTC">查询</button>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>课程 编号</th>
							<th>课程名称</th>
							<th>创建日期</th>
							<th>操作</th>
							<th style="width: 26px;"></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
			<div class="pagination" id="page">
				<ul>
				
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
						<i class="icon-warning-sign modal-icon"></i>确认要删除该课程吗？
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
	<input type="hidden" id="getPageIndex" value="" />
	
	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			selectTC();

			$("#selectTC").click(selectTC);

			// 控制菜单跳转
			$("#btnAddUser").click(function() {
				window.location.href = "addTCourse.jsp";
			});

			//确认删除点击事件
			$("#btnDelete").click(deleteTC);
			
		});

		//异步删除
		function deleteTC() {
			$.ajax({
				//地址
				url : "tcourseDo.jsp",
				type : "post", //提交方式
				data : {
					"opt" : "delete",
					"cId" : $("#inDeleteId").val()
				//提交值jaxaName：文本框的val()
				},
				dataType : "json", //json方式，传回json对象数据
				success : function(data) {
					if (data.msg == "OK") {
						selectTC();
					} else {
						alert(data.msg);
					}
				},
				error:function()
				{
					alert("该数据不能删除，用户信息表有关联!");
				}
			});
		}
		
		//异步查询刷新课程信息
		function selectTC() {
			$.ajax({
						//地址
						url : "tcourseDo.jsp",
						type : "post", //提交方式
						data : {
							"opt" : "selectTCourse",
							"name" : $.trim($("#TCmsg").val()),
							"pageIndex" : $.trim($("#getPageIndex").val())
						//提交值jaxaName：文本框的val()
						},
						dataType : "json", //json方式，传回json对象数据
						success : function(datas) { //接收data返回值并进行数据处理
							
							//拼接表格内容
							var tcou = $(".table tbody");
							var str = "";
							for (var i = 0; i < datas.data.length; i++) {
								str = str + "<tr><td>";
								str = str + (i + 1 + datas.firstSeq) + '</td><td>';
								str = str + datas.data[i].cNo + '</td><td>';
								str = str + datas.data[i].cName + '</td><td>';
								str = str + datas.data[i].createDate.toLocaleString()
										+ '</td><td>';
								str = str
										+ '<a href="addTCourse.jsp?cId='
										+ datas.data[i].cId
										+ '"><i class="icon-pencil">编辑 </i></a>';
								str = str
										+ '<a href="#myModal" role="button" data-toggle="modal" detId="'+ datas.data[i].cId + '"><i class="icon-pencil">删除</i></a>';
								str = str + "</td></tr>";
							}
							tcou.text("");
							tcou.append(str);
							
							//删除按钮添加点击事件，为隐藏文本赋值点击对象的ID
							$(".well table tbody td:last-child a:last-child").click(function() {
												$("#inDeleteId").val($(this).attr("detId"));
											});
							//插入页码
							var page = $("#page ul");
							var pageStr = "";
							pageStr = pageStr + '<li><a href="#">总页数'+ datas.pageCount +'</a></li>';
							pageStr = pageStr + '<li><a href="#" id="nowPage">当前页'+ datas.pageIndex +'</a></li>';
							pageStr = pageStr + '<li><a href="#" id="onePage" value='+ 1 +'>首页</a></li>';
							pageStr = pageStr + '<li><a href="#" id="lastPage" value="'+ (datas.pageIndex == 1 ? 1 :datas.pageIndex - 1)  +'">上一页</a></li>';
							pageStr = pageStr + '<li><a href="#" id="nextPage" value="'+ (datas.pageIndex == datas.pageCount ? datas.pageIndex :datas.pageIndex + 1)+'">下一页</a></li>';
							pageStr = pageStr + '<li><a href="#" id="endPage" value='+ datas.pageCount +'>尾页</a></li>';
							page.text("");
							page.append(pageStr);
							
							//上一页和下一页首页，尾页的点击事件，注意:a标签没有value，不能使用val()
							$("#lastPage").click(function(){$("#getPageIndex").val($(this).attr("value"));selectTC()});
							$("#nextPage").click(function(){$("#getPageIndex").val($(this).attr("value"));selectTC()});
							$("#onePage").click(function(){$("#getPageIndex").val($(this).attr("value"));selectTC()});
							$("#endPage").click(function(){$("#getPageIndex").val($(this).attr("value"));selectTC()});
						}
					});
		}

	</script>
</body>
</html>