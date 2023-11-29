<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="<%=path%>/ncss/css/style.css" rel="stylesheet"
			type="text/css" />
		<script language="JavaScript" src="<%=path%>/ncss/js/jquery.js">
		</script>

		<script type="text/javascript">
$(function() {
	//导航切换
	$(".menuson li").click(function() {
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});

	$('.title').click(function() {
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if ($ul.is(':visible')) {
			$(this).next('ul').slideUp();
		} else {
			$(this).next('ul').slideDown();
		}
	});
})
</script>


	</head>

	<body style="background: #f0f9fd;">
		<div class="lefttop">
			<span></span>
		</div>

		<dl class="leftmenu">
			<c:if test="${type=='用户'}">
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>个人信息
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="<%=path%>/hui/modMyHui.jsp"
								target="rightFrame">个人信息修改</a><i></i>
						</li>

					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>图书借阅
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="<%=path%>/book/jylist.jsp"
								target="rightFrame">图书借阅</a><i></i>
						</li>

					</ul>
				</dd>
			</c:if>





			<c:if test="${type!='用户'}">
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>管理员信息
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="<%=path%>/admin/modMyAdmin.jsp"
								target="rightFrame">管理员信息修改</a><i></i>
						</li>

					</ul>
				</dd>

				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>用户信息管理
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="<%=path%>/hui/list.jsp" target="rightFrame">用户信息管理</a><i></i>
						</li>

					</ul>
				</dd>




				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>图书信息
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="<%=path%>/book/list.jsp"
								target="rightFrame">图书信息管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="<%=path%>/book/jlist.jsp"
								target="rightFrame">图书借阅信息</a><i></i>
						</li>

					</ul>
				</dd>








				<c:if test="${type=='管理员'}">
					<dd>
						<div class="title">
							<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>系统设置
						</div>
						<ul class="menuson">
							<li>
								<cite></cite><a href="<%=path%>/admin/list.jsp"
									target="rightFrame">管理员信息管理</a><i></i>
							</li>

						</ul>
					</dd>
				</c:if>

			</c:if>




		</dl>

		<div style="display: none">

		</div>
	</body>
</html>
