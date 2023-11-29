<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*,com.biyeseng.db.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	String userPw = request.getParameter("userPw");

	String sex = request.getParameter("sex");
	String tel = request.getParameter("tel");

	String birth = request.getParameter("birth");
	String ruzhi = request.getParameter("ruzhi");

	DBManager dbm = new DBManager();
	String sql = "update admin set userPw='" + userPw + "',sex='" + sex
			+ "',tel='" + tel + "',birth='" + birth + "',ruzhi='"
			+ ruzhi + "' where id=" + id;
	System.out.println(sql);

	Statement stat = null;
	Connection conn = null;
	try {
		conn = dbm.getConnection();
		stat = conn.createStatement();
		stat.execute(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			if (stat != null)
				stat.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	response.sendRedirect("modMyAdmin.jsp");
%>
