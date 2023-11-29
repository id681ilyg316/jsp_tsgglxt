<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>图书馆管理系统</title>

		
</script><link href="<%=path %>/ncss/css/style.css" rel="stylesheet" type="text/css" />

		<script language="javascript">
$(function() {
	$('.loginbox').css( {
		'position' : 'absolute',
		'left' : ($(window).width() - 692) / 2
	});
	$(window).resize(function() {
		$('.loginbox').css( {
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
	})
});
</script>


	</head>
	<body
		style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">


		<div id="mainBody">
			<div id="cloud1" class="cloud"></div>
			<div id="cloud2" class="cloud"></div>
		</div>


		<div class="logintop">
			<span>欢迎登录：图书馆管理系统</span>
		
		</div>

		<div class="loginbody">

			<span class="systemlogo"></span>

			<div class="loginbox">
			<form name="form1" action="loginuser!logon.action" method="post">
						<input type="hidden" id="messageInfo"
							value="${requestScope.messageInfo}" />
			

				<ul>
					<li>
						<input name="username" id="username" type="text" class="loginuser"  
							onclick="JavaScript:this.value=''"  />
					</li>
					<li>
						<input name="userpwd"  id="userpwd" type="password" class="loginpwd"  
							onclick="JavaScript:this.value=''" />
					</li>
					<li>
						<select name="type">
						   <option value="用户">用户</option>
						    <option value="员工">员工</option>
						   <option value="管理员">管理员</option>
						</select>
					</li>
					<li>
						<input name="" type="button" class="loginbtn" value="登录"
							onclick="login();"/>
						<input name="" type="button" class="loginbtn" value="注册"
							onclick="regyh();"/>	
						 
					</li>
				</ul>

</form>
			</div>

		</div>
	</body>
</html>
<script>

function login() {

	if ($("#username").val() == "") {
		$.messager.alert('警告', '请输入用户名！', 'warning');
		return;
	}
	if ($("#userpwd").val() == "") {
		$.messager.alert('警告', '请输入密码！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/LoginAction";
	document.forms[0].submit();

}
function regyh() {

	
	document.forms[0].action = "<%=path%>/hui/regHui.jsp";
	document.forms[0].submit();

}
</script>