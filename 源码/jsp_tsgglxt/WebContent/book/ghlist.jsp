<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*,com.biyeseng.db.*,java.sql.*"
	pageEncoding="UTF-8"%>


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
					图书借阅信息列表
				</th>

				<tr>
					<td height="400" valign="top" class='forumRow'>
						<br>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="25" class='forumRowHighLight'>
										&nbsp;
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
											名称
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											出版社
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											作者
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											借阅人卡号
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											借阅时间
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
									String bid = request.getParameter("bid");
									String sql = "select * from book b,jieyue jy where b.id=jy.bid and b.id="+bid;
									 
									PreparedStatement pstmt = conn.prepareStatement(sql);
									ResultSet rs = pstmt.executeQuery();

									while (rs.next()) {
										String id = rs.getString("id");
								%>




								<tr>
									<td height="40" class='forumRow'>
										<div align="center">
											<%=rs.getString("name")%>
										</div>
									</td>

									<td height="40" class='forumRow'>
										<div align="center">
											<%=rs.getString("chuban")%>
										</div>
									</td>

									<td height="40" class='forumRow'>
										<div align="center">
											<%=rs.getString("author")%>
										</div>
									</td>

									<td height="40" class='forumRow'>
										<div align="center">
											<%=rs.getString("ucard")%>
										</div>
									</td>

									<td height="40" class='forumRow'>
										<div align="center">
											<%=rs.getString("jdate")%>
										</div>
									</td>



									<td class='forumRow'>
										<div align="center">
										

											<a href="<%=path%>/HuanAction?bid=<%=rs.getInt("bid")%>&uid=<%=rs.getString("ucard")%>">归还</a>
											


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
										&nbsp; 
									</td>
								</tr>
								<tr>
									<td height="70">
										 
									</td>
								</tr>
							</table>
							<br>
					</td>
				</tr>
		</table>