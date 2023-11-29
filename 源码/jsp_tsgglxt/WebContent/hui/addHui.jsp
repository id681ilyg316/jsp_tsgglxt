<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*,com.biyeseng.db.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />

	</head>
	<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">

		<br />


		<form id="form1" name="form1" action="">

			<table cellpadding='3' cellspacing='1' border='0' class='tableBorder'
				align=center>
				<tr>
					<th class='tableHeaderText' colspan=2 height=25>
						用户信息添加
					</th>
					 

					<tr>
						<td class='forumRowHighLight' height=23>
							工号
						</td>
						<td class='forumRowHighLight'>
							<input id="name" name="name" type='text' size='70'>
								&nbsp; 
						</td>
					</tr>

					<tr>
						<td class='forumRowHighLight' height=23>
							密码
						</td>
						<td class='forumRowHighLight'>
							<input id="pass" name="pass" type='text' size='70'>
								&nbsp; 
						</td>
					</tr>

					<tr>
						<td class='forumRowHighLight' height=23>
							性别
						</td>
						<td class='forumRowHighLight'>
							<input id="sex" name="sex" type='text' size='70'>
								&nbsp; 
						</td>
					</tr>

					<tr>
						<td class='forumRowHighLight' height=23>
							年龄
						</td>
						<td class='forumRowHighLight'>
							<input id="age" name="age" type='text' size='70'>
								&nbsp; 
						</td>
					</tr>

					<tr>
						<td class='forumRowHighLight' height=23>
							电话
						</td>
						<td class='forumRowHighLight'>
							<input id="tel" name="tel" type='text' size='70'>
								&nbsp; 
						</td>
					</tr>

					<tr>
						<td class='forumRowHighLight' height=23>
							身份证号(登录号)
						</td>
						<td class='forumRowHighLight'>
							<input id="card" name="card" type='text' size='70'>
								&nbsp; 
						</td>
					</tr>

					<tr>
						<td class='forumRowHighLight' height=23>
							是否会员
						</td>
						<td class='forumRowHighLight'>
							<select id="state" name="state" >
							 <option value="非会员">非会员</option>
							 <option value="会员">会员</option>
							</select>
								&nbsp; 
						</td>
					</tr>

					 
					<tr>
						<td class='forumRowHighLight' height=23>
							备注
						</td>
						<td class='forumRowHighLight'>
							<input id="info" name="info" type='text' size='70'>
								&nbsp; 
						</td>
					</tr>


					<tr>
						<td height="50" colspan=2 class='forumRow'>
							<div align="center">
								<input type="button" name="Submit" value="保存" class="button"
									onclick="save();" />

								<input type="button" name="Submit2" value="返回" class="button"
									onclick="window.history.go(-1);" />
							</div>
						</td>
					</tr>
			</table>
		</form>
	</body>
</html>
<script>

function save() {
	if ($("#name").val() == "") {
		$.messager.alert('警告', '工号不能为空！', 'warning');
		return;
	}
	if ($("#pwd").val() == "") {
		$.messager.alert('警告', '密码不能为空！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/AddHuiAction";
	document.forms[0].submit();

}
</script>
