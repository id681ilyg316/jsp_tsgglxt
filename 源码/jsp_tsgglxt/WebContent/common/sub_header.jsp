<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<html>
<head>
<title>图书馆管理系统</title>

<LINK href="<%=path%>/js/jquery/plugin/jquery-easyui/themes/default/easyui.css" type="text/css" rel="stylesheet"/>
<LINK href="<%=path%>/js/jquery/plugin/jquery-easyui/themes/icon.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/plugins/jquery.window.js"></script>
<script type="text/javascript" src="<%=path%>/js/calendar/WdatePicker.js"></script>
 <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="javascript">
function up() {
	var pop = new Popup( {
		contentType : 1,
		isReloadOnClose : false,
		width : 400,
		height : 200
	});
	pop.setContent("contentUrl", "<%=path %>/upload/upload.jsp");
	pop.setContent("title", "文件上传");
	pop.build();
	pop.show();
	//另一红上传方式可以参照进销存
}
</script>




	</head>
<body>