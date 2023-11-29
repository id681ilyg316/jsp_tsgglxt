<%@ page language="java" import="java.util.*,com.biyeseng.db.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<html>
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link rel="stylesheet" href="css/common.css" type="text/css" />
		<title>管理区域</title>
	</head>
	<body>
		<div id="man_zone">

			<table width="95%" border="0" align="center" cellpadding="3"
				cellspacing="1" class="table_style">
				<tr>
					<td colspan="2">
						&nbsp;版权信息
					</td>
				</tr>
				<tr>
					<td width="18%" class="left_title_2">
						<span class="left-title">系统名称</span>
					</td>
					<td width="82%">
						&nbsp;图书馆管理系统
					</td>
				</tr>
				<tr>
					<td class="left_title_2">
						当前版本
					</td>
					<td>
						&nbsp;Version1.0
					</td>
				</tr>

				<tr>
					<td class="left_title_2">
						作者
					</td>
					<td>
						&nbsp;图书管理系统
					</td>
				</tr>
				<tr>
					<td class="left_title_2">
						电子邮件
					</td>
					<td>
						&nbsp;
					</td>
				</tr>



			</table>
			<br />

			<%
				String type = session.getAttribute("type") + "";
				if (type.equals("用户")) {
			%>


			<table width="95%" border="0" align="center" cellpadding="3"
				cellspacing="1" class="table_style">
				<tr>
					<td colspan="12">
						&nbsp;未还图书
					</td>
				</tr>
				<tr>
					<td width="50%" class="left_title_1">
						<span class="left-title">图书</span>
					</td>
					<td width="25%" class="left_title_1">
						<span class="left-title">借阅时间</span>
					</td>
					<td width="25%" class="left_title_1">
						<span class="left-title">最晚还书时间</span>
					</td>
				</tr>
				<%
					DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();

						String sql = "select * from book b,jieyue jy where b.id=jy.bid and jy.ucard='"+session.getAttribute("card")+"' ";

						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
				%>
				<tr>
					<td width="50%" align="right">
						<span class="left-title"><%=rs.getString("name") %>(<%=rs.getString("chuban") %>)</span>
					</td>
					<td width="25%" align="right">
						<span class="left-title"><%=rs.getString("jdate") %></span>
					</td>
					<td width="25%" align="right">
						<span class="left-title"><%=rs.getString("qdate") %></span>
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

			</table>
			<%
				}
			%>

		</div>
	</body>
</html>
