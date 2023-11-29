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
						个人信息修改
					</th>
					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String id = request.getParameter("id");
						String sql = "select * from hui where card='"
								+ session.getAttribute("card") + "'";
						PreparedStatement stat = conn.prepareStatement(sql);
						ResultSet rs = stat.executeQuery();
						rs.next();
					%>
					<input name="id" type="hidden" id="name"
						value='<%=rs.getInt("id")%>'>
						 

						<tr>
							<td class='forumRowHighLight' height=23>
								工号
							</td>
							<td class='forumRowHighLight'>
								<input id="name" name="name" type='text'
									value='<%=rs.getString("name")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								密码
							</td>
							<td class='forumRowHighLight'>
								<input id="pass" name="pass" type='text'
									value='<%=rs.getString("pass")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								性别
							</td>
							<td class='forumRowHighLight'>
								<input id="sex" name="sex" type='text'
									value='<%=rs.getString("sex")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								年龄
							</td>
							<td class='forumRowHighLight'>
								<input id="age" name="age" type='text'
									value='<%=rs.getString("age")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								电话
							</td>
							<td class='forumRowHighLight'>
								<input id="tel" name="tel" type='text'
									value='<%=rs.getString("tel")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								身份证号(登录号)
							</td>
							<td class='forumRowHighLight'>
								<input id="card" name="card" type='text'
									value='<%=rs.getString("card")%>' readonly="readonly" size='70'>
									&nbsp; 
							</td>
						</tr>

						 
						<tr>
							<td class='forumRowHighLight' height=23>
								备注
							</td>
							<td class='forumRowHighLight'>
								<input id="info" name="info" type='text'
									value='<%=rs.getString("info")%>' size='70'>
									&nbsp; 
							</td>
						</tr>
						<%
							if (rs != null)
								rs.close();
							if (stat != null)
								stat.close();
							if (conn != null)
								conn.close();
						%>


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
	document.forms[0].action = "<%=path%>/hui/updatemy.jsp";
	document.forms[0].submit();

}
</script>
