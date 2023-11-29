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
						图书修改
					</th>
					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String id = request.getParameter("id");
						String sql = "select * from book where id='" + id + "'";
						PreparedStatement stat = conn.prepareStatement(sql);
						ResultSet rs = stat.executeQuery();
						rs.next();
					%>
					<input name="id" type="hidden" id="name" value='<%=id%>'>
						<tr>
							<td class='forumRowHighLight' height=23>
								名称
							</td>
							<td class='forumRowHighLight'>
								<input id="name" name="name" type='text'
									value='<%=rs.getString("name")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								出版社
							</td>
							<td class='forumRowHighLight'>
								<input id="chuban" name="chuban" type='text'
									value='<%=rs.getString("chuban")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								作者
							</td>
							<td class='forumRowHighLight'>
								<input id="author" name="author" type='text'
									value='<%=rs.getString("author")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								类型
							</td>
							<td class='forumRowHighLight'>
								<select id="type" name="type">
									<option value="会员">
										会员
									</option>
									<option value="无限制">
										无限制
									</option>
								</select>
								&nbsp;
							</td>
						</tr>


						<tr>
							<td class='forumRowHighLight' height=23>
								数量
							</td>
							<td class='forumRowHighLight'>
								<input id="kucun" name="kucun" type='text' value='<%=rs.getString("kucun")%>'  size='70'>
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
	document.forms[0].action = "<%=path%>/ModBookAction";
	document.forms[0].submit();

}
</script>
