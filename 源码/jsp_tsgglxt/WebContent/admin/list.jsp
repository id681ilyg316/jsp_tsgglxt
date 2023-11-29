<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*,com.biyeseng.db.*,java.sql.*" pageEncoding="UTF-8"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
	</HEAD>
	<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">

		<br />


		<table cellpadding='3' cellspacing='1' border='0' class='tableBorder'
			align=center>
			<tr>
				<th width="100%" height=25 class='tableHeaderText'>
					员工列表
				</th>

				<tr>
					<td height="400" valign="top" class='forumRow'>
						<br>
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="25" class='forumRowHighLight'>
									&nbsp;|
									<a href="<%=path %>/admin/addAdmin.jsp">添加员工</a>
								</td>
							</tr>
							<tr>
								<td height="30"></td>
							</tr>
						</table>


						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="2">
							<tr>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										工号
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										密码
									</div>
								</td>
								
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										性别
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										电话
									</div>
								</td>
								
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										出生日期
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										入职日期
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										用户类型
									</div>
								</td>
								
								<td width="9%" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										操作
									</div>
								</td>
							</tr>
							
							<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select * from admin";
						if (queryName != null) {
							sql = "select * from admin where userName like '%" + queryName
									+ "%'";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
					%>




							<tr>
								<td height="40" class='forumRow'>
									<div align="center">
										<%=rs.getString("userName")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("userPw")%>
									</div>
								</td>
								
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("sex")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("tel")%>
									</div>
								</td>
								
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("birth")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("ruzhi")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("type")%>
									</div>
								</td>
								 
								<td class='forumRow'>
									<div align="center">
									<a href="<%=path %>/admin/modAdmin.jsp?id=<%=id %>">编辑</a> |
							<a href="<%=path %>/DelAdminAction?id=<%=id %>">删除</a> 
									</div>
								</td>
							</tr>
							
							<%
						}
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					%>


							<tr>
								<td height="35" colspan="8">
									<div align="center">
										<table width='100%'>
											<tr>
												<td align='center' height=25>
													
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="20" class='forumRow'>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td height="25" class='forumRowHighLight'>
									&nbsp;| 搜索
								</td>
							</tr>
							<tr>
								<td height="70">
								<form action="<%=path %>/admin/list.jsp" method="post">
										<div align="center">
											&nbsp;
											<label>
											</label>
											<label>
												请输入员工工号：<input type='text' name='queryName' value=''
										style='width: 150px' />
											</label>
											<label>
												&nbsp;
												<input type="submit"  type="button"	
											 value="查 询" />	
											</label>
										</div>
									</form>
								</td>
							</tr>
						</table>
						<br>
					</td>
				</tr>
		</table>