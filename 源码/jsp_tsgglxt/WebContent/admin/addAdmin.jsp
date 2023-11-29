<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

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
						员工添加
					</th>
					<tr>
						<td width="15%" height=23 class='forumRow'>
							工号：
						</td>
						<td class='forumRow'>
							<input id="userName" name="userName" type='text' ' size='70'>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class='forumRowHighLight' height=23>
							密码
						</td>
						<td class='forumRowHighLight'>
							<input id="userPw" name="userPw" type='text' size='70'>
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
							电话
						</td>
						<td class='forumRowHighLight'>
							<input id="tel" name="tel" type='text' size='70'>
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td class='forumRowHighLight' height=23>
							出生年月
						</td>
						<td class='forumRowHighLight'>
							<input id="birth" name="birth" type='text' size='70' class="Wdate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd ',readOnly:true})" >
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class='forumRowHighLight' height=23>
							入职日期
						</td>
						<td class='forumRowHighLight'>
							<input id="ruzhi" name="ruzhi" type='text' size='70' class="Wdate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd ',readOnly:true})" >
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class='forumRowHighLight' height=23>
							用户类型
						</td>
						<td class='forumRowHighLight'>
							<select id="type" name="type">
							 <option value="管理员">管理员</option>
							 <option value="员工">员工</option>
							
							 
							</select>
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
	if ($("#userName").val() == "") {
		$.messager.alert('警告', '工号不能为空！', 'warning');
		return;
	}
	if ($("#userPw").val() == "") {
		$.messager.alert('警告', '密码不能为空！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/AddAdminAction";
	document.forms[0].submit();

}
</script>
