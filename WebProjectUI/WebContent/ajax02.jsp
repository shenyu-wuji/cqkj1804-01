<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="content/lib/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#intext").blur(function() {
			$.ajax({
				url : "ajax01.jsp",
				type : "post",
				data : {
					"name" : $(this).val()
				},
				dataType : "json",
				success : function(data) {
					if (data.loginName == "0") {
							$("#spajax").css("color","green");
							$("#spajax").text("符合规格");
					} else {
						$("#spajax").css("color","red");
						$("#spajax").text("已被注册");
					}
				}
			});

		});
	});
</script>

</head>
<body>

	<input type="text" id="intext">
	<span id="spajax"></span>
</body>
</html>