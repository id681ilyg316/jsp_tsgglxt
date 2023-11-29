<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*,com.biyeseng.db.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	String card = request.getParameter("card");
	String info = request.getParameter("info");

	String adate = new java.util.Date().toLocaleString();

	DBManager dbm = new DBManager();
	String sql = "update hui set name='" + name + "',pass='" + pass
			+ "',sex='" + sex + "',age='" + age + "',tel='" + tel
			+ "',card='" + card + "',info='" + info + "',adate='"
			+ adate + "' where id=" + id;
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

	out
			.println("<script>alert('修改成功！');window.location.href='modMyHui.jsp'</script>");
%>
